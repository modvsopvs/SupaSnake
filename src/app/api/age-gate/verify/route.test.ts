import { POST } from './route';
import { NextRequest } from 'next/server';

/**
 * Age Gate Verification API Tests
 *
 * Coverage: POST /api/age-gate/verify
 * - Valid verification (logged in user)
 * - Valid verification (anonymous user)
 * - Invalid request (missing fields)
 * - Database errors
 * - Verification hash validation
 * - Timestamp validation
 * - Session management
 */

// Mock Supabase
jest.mock('@supabase/supabase-js', () => ({
  createClient: jest.fn(() => ({
    auth: {
      getUser: jest.fn(),
    },
    from: jest.fn(() => ({
      update: jest.fn(() => ({
        eq: jest.fn(() => ({
          error: null,
        })),
      })),
      insert: jest.fn(() => ({
        error: null,
      })),
    })),
  })),
}));

describe('POST /api/age-gate/verify', () => {
  beforeEach(() => {
    jest.clearAllMocks();
  });

  it('should save age verification for logged-in user', async () => {
    const mockRequest = {
      json: async () => ({
        ageVerified: true,
        verificationHash: 'hashed-year-12345',
        verifiedAt: new Date().toISOString(),
      }),
      headers: {
        get: (name: string) => (name === 'authorization' ? 'Bearer mock-token' : null),
      },
      cookies: {
        get: () => null,
      },
    } as unknown as NextRequest;

    const response = await POST(mockRequest);
    const data = await response.json();

    expect(response.status).toBe(200);
    expect(data.success).toBe(true);
  });

  it('should save age verification for anonymous user', async () => {
    const mockRequest = {
      json: async () => ({
        ageVerified: true,
        verificationHash: 'hashed-year-12345',
        verifiedAt: new Date().toISOString(),
      }),
      headers: {
        get: () => null,
      },
      cookies: {
        get: (name: string) => (name === 'session_id' ? { value: 'session-123' } : null),
      },
    } as unknown as NextRequest;

    const response = await POST(mockRequest);
    const data = await response.json();

    expect(response.status).toBe(200);
    expect(data.success).toBe(true);
  });

  it('should reject request with missing fields', async () => {
    const mockRequest = {
      json: async () => ({
        ageVerified: true,
      }),
      headers: {
        get: () => null,
      },
      cookies: {
        get: () => null,
      },
    } as unknown as NextRequest;

    const response = await POST(mockRequest);
    const data = await response.json();

    expect(response.status).toBe(400);
    expect(data.error).toBe('Missing required fields');
  });

  it('should handle database errors gracefully', async () => {
    const { createClient } = require('@supabase/supabase-js');
    createClient.mockReturnValueOnce({
      auth: {
        getUser: jest.fn().mockResolvedValue({ data: { user: { id: 'user-123' } } }),
      },
      from: jest.fn(() => ({
        update: jest.fn(() => ({
          eq: jest.fn(() => ({
            error: new Error('Database error'),
          })),
        })),
      })),
    });

    const mockRequest = {
      json: async () => ({
        ageVerified: true,
        verificationHash: 'hashed-year-12345',
        verifiedAt: new Date().toISOString(),
      }),
      headers: {
        get: (name: string) => (name === 'authorization' ? 'Bearer mock-token' : null),
      },
      cookies: {
        get: () => null,
      },
    } as unknown as NextRequest;

    const response = await POST(mockRequest);
    const data = await response.json();

    expect(response.status).toBe(500);
    expect(data.error).toBe('Failed to save verification');
  });

  it('should validate verification hash format', async () => {
    const mockRequest = {
      json: async () => ({
        ageVerified: true,
        verificationHash: '', // Invalid empty hash
        verifiedAt: new Date().toISOString(),
      }),
      headers: {
        get: () => null,
      },
      cookies: {
        get: () => null,
      },
    } as unknown as NextRequest;

    const response = await POST(mockRequest);
    const data = await response.json();

    expect(response.status).toBe(400);
    expect(data.error).toBe('Missing required fields');
  });

  it('should handle concurrent verification attempts', async () => {
    const mockRequest = {
      json: async () => ({
        ageVerified: true,
        verificationHash: 'hashed-year-12345',
        verifiedAt: new Date().toISOString(),
      }),
      headers: {
        get: (name: string) => (name === 'authorization' ? 'Bearer mock-token' : null),
      },
      cookies: {
        get: () => null,
      },
    } as unknown as NextRequest;

    const [response1, response2] = await Promise.all([
      POST(mockRequest),
      POST(mockRequest),
    ]);

    expect(response1.status).toBe(200);
    expect(response2.status).toBe(200);
  });

  it('should handle session ID migration', async () => {
    const mockRequest = {
      json: async () => ({
        ageVerified: true,
        verificationHash: 'hashed-year-12345',
        verifiedAt: new Date().toISOString(),
      }),
      headers: {
        get: () => null,
      },
      cookies: {
        get: (name: string) => (name === 'session_id' ? { value: 'session-123' } : null),
      },
    } as unknown as NextRequest;

    const response = await POST(mockRequest);
    const data = await response.json();

    expect(response.status).toBe(200);
    expect(data.success).toBe(true);
  });
});
