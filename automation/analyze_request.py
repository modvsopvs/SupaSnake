#!/usr/bin/env python3
"""
Request Analysis Tool
Analyzes user requests using 8-level consequence analysis
"""

import sys
import json
from typing import Dict, List


def analyze_request(request: str) -> Dict:
    """
    Analyze user request and determine affected systems,
    complexity, and recommended pipeline
    """

    analysis = {
        "request": request,
        "affected_systems": [],
        "complexity_score": 0,
        "recommended_pipeline": "simple_feature",
        "estimated_duration": "",
        "design_questions": [],
        "consequences": []
    }

    # Simple keyword-based analysis (in production, would use AI)
    request_lower = request.lower()

    # Identify affected systems
    system_keywords = {
        "physics": ["physics", "movement", "collision", "speed", "velocity"],
        "economy": ["cost", "price", "currency", "buy", "sell", "dna", "coins"],
        "vfx": ["particle", "effect", "visual", "glow", "trail"],
        "ui": ["button", "menu", "hud", "interface", "display"],
        "audio": ["sound", "music", "audio", "sfx"],
        "content": ["level", "stage", "asset", "snake variant"],
        "networking": ["multiplayer", "online", "sync", "server"],
        "ai": ["bot", "npc", "ai", "computer player"]
    }

    for system, keywords in system_keywords.items():
        if any(kw in request_lower for kw in keywords):
            analysis["affected_systems"].append(system)

    # Determine complexity
    num_systems = len(analysis["affected_systems"])

    if num_systems == 0:
        analysis["complexity_score"] = 3
        analysis["affected_systems"] = ["main"]
    elif num_systems == 1:
        analysis["complexity_score"] = 4
    elif num_systems == 2:
        analysis["complexity_score"] = 6
    elif num_systems <= 4:
        analysis["complexity_score"] = 7
    else:
        analysis["complexity_score"] = 9

    # Recommend pipeline
    if analysis["complexity_score"] <= 4:
        analysis["recommended_pipeline"] = "simple_feature"
        analysis["estimated_duration"] = "15-20 minutes"
    elif analysis["complexity_score"] <= 7:
        analysis["recommended_pipeline"] = "feature"
        analysis["estimated_duration"] = "30-40 minutes"
    else:
        analysis["recommended_pipeline"] = "aaa_feature"
        analysis["estimated_duration"] = "45-60 minutes"

    # Generate design questions
    if "economy" in analysis["affected_systems"]:
        analysis["design_questions"].append({
            "id": "cost",
            "question": "What should be the cost?",
            "options": ["50 DNA", "100 DNA", "200 DNA", "Custom"]
        })

    if "physics" in analysis["affected_systems"]:
        analysis["design_questions"].append({
            "id": "duration",
            "question": "How long should the effect last?",
            "options": ["1 second", "3 seconds", "5 seconds", "Until collision"]
        })

    # 8-level consequence analysis (simplified)
    analysis["consequences"] = [
        {
            "level": 1,
            "description": f"Direct: Implement {', '.join(analysis['affected_systems'])} changes"
        },
        {
            "level": 2,
            "description": "Testing: Requires unit and integration tests"
        },
        {
            "level": 3,
            "description": "Balance: May affect game balance and economy"
        }
    ]

    return analysis


def main():
    if len(sys.argv) < 2:
        print("Usage: python analyze_request.py <request>")
        sys.exit(1)

    request = " ".join(sys.argv[1:])
    analysis = analyze_request(request)

    print(json.dumps(analysis, indent=2))


if __name__ == "__main__":
    main()
