# Data Processing Agreement (DPA) Template

**Status:** 🚨 TEMPLATE - REQUIRES LAWYER REVIEW

**Purpose:** GDPR Article 28 compliance (Controller-Processor agreements)
**Use case:** Sign with all third-party vendors processing user data

---

## ⚠️ DO NOT USE THIS TEMPLATE IN PRODUCTION

GDPR requires specific DPA clauses. Most vendors provide their own DPA (Amplitude, Supabase, etc.). Lawyer must review ALL vendor DPAs.

---

## What is a DPA?

**GDPR Article 28** requires written contracts between:
- **Data Controller** (you - SupaSnake)
- **Data Processor** (vendor - Amplitude, Supabase, etc.)

**Penalties for non-compliance:** Up to €10M or 2% of global revenue

---

## Vendors Requiring DPA

| Vendor | Service | Data Processed | DPA Status |
|--------|---------|----------------|------------|
| Supabase | Database, hosting | All user data | ✅ Provided by Supabase |
| Amplitude | Analytics | Events, device info | ✅ Provided by Amplitude |
| Statsig | A/B testing | Feature flags, events | ✅ Provided by Statsig |
| Adjust | Attribution | Device IDs, install data | ✅ Provided by Adjust |
| Sentry | Error tracking | Crash logs, stack traces | ✅ Provided by Sentry |
| OneTrust | Consent management | Consent records | ✅ Provided by OneTrust |

**Action required:** Request and sign DPA with each vendor

---

## DPA Checklist (What to Verify)

### 1. Parties
```
[LAWYER TO VERIFY]
- Controller: [Your company name and address]
- Processor: [Vendor name and address]
- Effective date
- Duration (typically tied to service agreement)
```

### 2. Subject Matter & Nature
```
[LAWYER TO VERIFY]
- What service vendor provides
- What data they process
- Purpose of processing
- Duration of processing
```

### 3. Type of Personal Data
```
[LAWYER TO SPECIFY PER VENDOR]

Example (Amplitude):
- User IDs (hashed)
- Device identifiers
- Gameplay events
- Session data
- Location (country-level only)

Example (Supabase):
- All user profile data
- Game progress data
- Collection data
- Authentication tokens
```

### 4. Categories of Data Subjects
```
[LAWYER TO SPECIFY]
- Players aged 13+
- Geographic: Global
```

### 5. Processor Obligations (GDPR Art. 28(3))
```
[LAWYER TO VERIFY VENDOR COMMITS TO]
- Process only on documented instructions
- Ensure confidentiality of personnel
- Implement appropriate security measures
- Assist with data subject rights requests (GDPR Ch. 3)
- Assist with security breach notifications
- Delete or return data after service ends
- Make information available for audits
- Immediately inform if instruction violates law
```

### 6. Sub-Processors
```
[LAWYER TO VERIFY]
- List of current sub-processors (e.g., AWS, GCP)
- Right to object to new sub-processors
- Notice period for sub-processor changes (typically 30 days)
- Sub-processors must have equivalent DPA
```

**Example (Supabase):**
- AWS (hosting)
- Cloudflare (CDN)
- [Lawyer to get full list from Supabase]

### 7. International Data Transfers
```
[LAWYER TO VERIFY]
- Where data is stored (EU, US, etc.)
- Transfer mechanism:
  - Standard Contractual Clauses (SCCs) - EU approved
  - Or: Privacy Shield replacement (if available)
  - Or: Adequacy decision (EU → safe countries)

- Encryption requirements
- Data localization options (EU data stays in EU)
```

**Critical for SupaSnake:**
- EU users → Supabase EU region (GDPR compliance)
- US users → Supabase US region (efficiency)

### 8. Security Measures (GDPR Art. 32)
```
[LAWYER TO VERIFY VENDOR IMPLEMENTS]
- Encryption at rest (AES-256)
- Encryption in transit (TLS 1.2+)
- Access controls (RBAC, 2FA)
- Regular security audits (SOC 2, ISO 27001)
- Incident response plan
- Breach notification (within 72 hours)
- Backup and disaster recovery
```

### 9. Data Subject Rights Assistance
```
[LAWYER TO VERIFY VENDOR WILL ASSIST WITH]
- Access requests (export data)
- Deletion requests (right to be forgotten)
- Correction requests
- Portability requests
- Objection requests
- Response timeline: Within 30 days (GDPR requirement)
```

**Technical requirement:**
Vendor must provide APIs for:
- Data export (JSON format)
- Data deletion (hard delete, not soft delete)

### 10. Security Breach Notification
```
[LAWYER TO VERIFY]
- Vendor notifies you within 24-48 hours
- Provides details:
  - Nature of breach
  - Data affected
  - Likely consequences
  - Measures taken/proposed
- You notify supervisory authority within 72 hours (GDPR requirement)
```

### 11. Audits & Inspections
```
[LAWYER TO VERIFY]
- Your right to audit vendor's compliance
- Frequency (typically annual)
- Notice period (30 days)
- Vendor provides SOC 2 / ISO 27001 reports (alternative to audits)
```

**Practical:**
Most vendors provide certification instead of allowing direct audits.

### 12. Data Deletion/Return
```
[LAWYER TO VERIFY]
- Upon service termination:
  - Delete all personal data (including backups)
  - Or: Return data in usable format
  - Timeline: 30-90 days
  - Certification of deletion

- Exceptions (if required by law to retain)
```

### 13. Liability & Indemnification
```
[LAWYER TO NEGOTIATE]
- Processor liable for GDPR violations
- Processor indemnifies controller for:
  - GDPR fines due to processor's fault
  - Data subject claims

- Liability cap (typically tied to service agreement)
```

### 14. Governing Law & Dispute Resolution
```
[LAWYER TO SPECIFY]
- Governing law: [Jurisdiction]
- Dispute resolution: Arbitration or courts
- Jurisdiction for GDPR claims (typically EU)
```

---

## Vendor-Specific DPA Notes

### Supabase DPA
```
[LAWYER TO REVIEW]
- Template: https://supabase.com/dpa
- EU data residency: Available (Supabase EU region)
- Sub-processors: AWS, Cloudflare
- Certifications: SOC 2 Type II
- Data deletion: Automatic upon project deletion
```

### Amplitude DPA
```
[LAWYER TO REVIEW]
- Template: https://amplitude.com/dpa
- EU data residency: Available (EU data center)
- Sub-processors: AWS, Google Cloud
- Certifications: SOC 2, ISO 27001, Privacy Shield
- Data deletion: API available, 30-day retention
```

### Statsig DPA
```
[LAWYER TO REVIEW]
- Template: https://www.statsig.com/dpa
- Data residency: US (check EU option)
- Sub-processors: AWS
- Certifications: SOC 2
```

### Adjust DPA
```
[LAWYER TO REVIEW]
- Template: https://www.adjust.com/terms/data-processing-agreement/
- Data residency: EU and US options
- Sub-processors: AWS, GCP
- Certifications: ISO 27001
```

### Sentry DPA
```
[LAWYER TO REVIEW]
- Template: https://sentry.io/legal/dpa/
- Data residency: US (check EU)
- Sub-processors: Google Cloud
- Certifications: SOC 2
```

---

## DPA Signing Process

### Step 1: Request DPA from Vendor
```
Email to vendor:
"We require a Data Processing Agreement (DPA) for GDPR compliance.
Please provide your standard DPA template."
```

Most vendors have self-service DPA signing:
- Amplitude: In-app DPA signing
- Supabase: Available in project settings
- Others: DocuSign or email

### Step 2: Lawyer Review
```
- Lawyer reviews vendor DPA
- Checks all Art. 28(3) requirements
- Negotiates if necessary (rarely needed for standard vendors)
```

### Step 3: Execute DPA
```
- Sign via vendor's process
- Store executed copy in docs/legal/executed-dpas/
- Add to DPA tracking sheet (see below)
```

### Step 4: Monitor Sub-Processor Changes
```
- Vendors must notify of sub-processor changes
- Review new sub-processors (30-day objection period)
- Update DPA tracking sheet
```

---

## DPA Tracking Sheet

Create: `docs/legal/dpa-tracking.csv`

```csv
Vendor,Service,DPA Signed,DPA Date,DPA URL,Sub-Processors,Last Review,Next Review
Supabase,Database,Yes,2025-01-15,/docs/legal/executed-dpas/supabase-dpa.pdf,"AWS, Cloudflare",2025-01-15,2026-01-15
Amplitude,Analytics,Yes,2025-01-20,/docs/legal/executed-dpas/amplitude-dpa.pdf,"AWS, GCP",2025-01-20,2026-01-20
Statsig,A/B Testing,Pending,N/A,N/A,AWS,N/A,N/A
Adjust,Attribution,Pending,N/A,N/A,"AWS, GCP",N/A,N/A
Sentry,Error Tracking,Yes,2025-01-10,/docs/legal/executed-dpas/sentry-dpa.pdf,GCP,2025-01-10,2026-01-10
OneTrust,Consent Mgmt,Pending,N/A,N/A,AWS,N/A,N/A
```

**Annual review required** to ensure compliance.

---

## Common DPA Mistakes to Avoid

❌ **Not signing DPA** - GDPR violation, €10M fine
❌ **Using outdated DPA** - Vendors update terms, must re-sign
❌ **Ignoring sub-processor changes** - Must review and object if needed
❌ **No data deletion proof** - Keep certificates of deletion
❌ **No EU data residency** - US data centers may violate GDPR (Schrems II)

---

## Next Steps

1. **Request DPAs** - Email all vendors (see list above)
2. **Lawyer review** - Have lawyer review each DPA
3. **Sign DPAs** - Execute via vendor process
4. **Store copies** - `docs/legal/executed-dpas/`
5. **Track renewals** - Annual review (DPA tracking sheet)
6. **Monitor changes** - Sub-processor change notifications

**Timeline:** 2-3 weeks (depends on vendor response times)
**Cost:** Included in $10k-15k legal budget

---

**Last Updated:** [TO BE COMPLETED BY LAWYER]
**Version:** Template v1.0
