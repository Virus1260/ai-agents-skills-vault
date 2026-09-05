import os
import re

script_dir = os.path.dirname(os.path.abspath(__file__))
vault_root = os.path.dirname(script_dir)
skills_dir = os.path.join(vault_root, "skills")
catalog_path = os.path.join(vault_root, "SKILLS_CATALOG.md")

categories = {
    "Design Systems & Animations": [
        "taste", "design", "animation", "motion", "emil", "impeccable", "gsap", "figma",
        "brutal", "minimalist", "brand", "color", "palette", "typography", "deck", "slide",
        "poster", "frame-", "card-", "wpds", "svg", "threejs", "shader"
    ],
    "Frontend & UI Engineering": [
        "react", "next", "angular", "vue", "svelte", "tailwind", "shadcn", "frontend",
        "css", "html", "web-", "ui-", "component", "expo", "flutter", "swift", "radix",
        "watermelon", "responsive", "popups", "accessibility", "wcag"
    ],
    "Backend & Architecture": [
        "backend", "api", "node", "express", "fastapi", "django", "dotnet", "csharp",
        "golang", "rust", "python", "php", "java", "scala", "graphql", "trpc", "rest",
        "microservices", "bullmq", "event-sourcing", "cqrs", "architecture", "c4-"
    ],
    "Database & Data Engineering": [
        "database", "postgres", "sql", "clickhouse", "bigquery", "neon", "dbt",
        "migration", "dataform", "lakehouse", "nosql", "vector-database", "data-"
    ],
    "AI, ML & Agent Engineering": [
        "agent", "llm", "rag", "langchain", "langgraph", "prompt", "ollama", "crewai",
        "model", "machine-learning", "clarity", "autonomous", "eval", "voice-", "speech",
        "computer-vision", "yolo", "sam", "anti-slop"
    ],
    "Generative Media, Audio & Video": [
        "fal-", "venice-", "imagegen", "remotion", "video", "audio", "sora", "minimax",
        "music", "lip-sync", "upscale", "sticker", "youtube-", "gif-"
    ],
    "Security & Pentesting": [
        "security", "pentest", "vulnerability", "red-team", "sast", "xss", "injection",
        "fuzzing", "privilege", "reverse", "malware", "auth-", "clerk", "sentry"
    ],
    "DevOps, Cloud & Infrastructure": [
        "aws", "gcp", "azure", "docker", "k8s", "kubernetes", "terraform", "cloudflare",
        "vercel", "deploy", "server", "linux", "bash", "powershell", "git", "ci", "monitoring",
        "datadog", "observability", "prometheus", "grafana"
    ],
    "Workflow & SaaS Integrations": [
        "linear", "jira", "github", "gitlab", "bitbucket", "slack", "discord", "notion",
        "asana", "trello", "monday", "hubspot", "salesforce", "stripe", "airtable",
        "google", "outlook", "gmail", "zapier", "make-", "composio", "intercom"
    ]
}

def classify(name, desc):
    text = (name + " " + desc).lower()
    for cat, keywords in categories.items():
        if any(k in text for k in keywords):
            return cat
    return "Universal & Developer Productivity"

skills = sorted([d for d in os.listdir(skills_dir) if os.path.isdir(os.path.join(skills_dir, d))])
print(f"Indexing {len(skills)} skills...")

classified = {}
for cat in list(categories.keys()) + ["Universal & Developer Productivity"]:
    classified[cat] = []

for s in skills:
    s_path = os.path.join(skills_dir, s)
    desc = "No description provided."
    skill_md = os.path.join(s_path, "SKILL.md")
    if os.path.exists(skill_md):
        try:
            with open(skill_md, "r", encoding="utf-8", errors="ignore") as f:
                content = f.read(2000)
            # Match frontmatter description
            m = re.search(r"description:\s*([^\n\r]+)", content, re.IGNORECASE)
            if m:
                desc = m.group(1).strip().strip("\"'")
            else:
                # First non-header line
                lines = [l.strip() for l in content.split("\n") if l.strip() and not l.startswith("#") and not l.startswith("---")]
                if lines:
                    desc = lines[0][:150]
        except Exception:
            pass
    cat = classify(s, desc)
    classified[cat].append((s, desc))

md = []
md.append("# AI Agent Skills Vault — Master Skills Catalog\n")
md.append(f"> **Total Skills Tracked**: {len(skills)} modular skills across all coding agents.\n")
md.append("## Table of Contents\n")
for cat, items in classified.items():
    anchor = cat.lower().replace(" ", "-").replace("&", "").replace(",", "").replace("--", "-")
    md.append(f"- [{cat} ({len(items)})](#{anchor})")

md.append("\n---\n")

for cat, items in classified.items():
    anchor = cat.lower().replace(" ", "-").replace("&", "").replace(",", "").replace("--", "-")
    md.append(f"## {cat}\n")
    md.append(f"*Category contains {len(items)} curated skills.*\n")
    md.append("| Skill Name | Purpose & Description |")
    md.append("|---|---|")
    for s, desc in items:
        # Clean description
        clean_desc = desc.replace("|", "\\|").replace("\n", " ")
        md.append(f"| [`{s}`](skills/{s}/SKILL.md) | {clean_desc} |")
    md.append("\n---\n")

with open(catalog_path, "w", encoding="utf-8") as f:
    f.write("\n".join(md))

print(f"SKILLS_CATALOG.md generated successfully ({len(skills)} skills categorized).")
