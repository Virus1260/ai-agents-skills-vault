# Obsidian MD (`obsidianmd`) Reference Guide

> **Organization**: [obsidianmd](https://github.com/obsidianmd)  
> **Key Projects**: `jsoncanvas`, `obsidian-headless`, `obsidian-sample-plugin`, `obsidian-api`, `knap`

---

## Overview

The Obsidian open ecosystem provides open file standards and developer tools for connected thought, knowledge graphing, infinite visual canvases, and Markdown transformations.

---

## Key Technologies for AI Agents

### 1. JSON Canvas (`jsoncanvas`) — Open Infinite Canvas Standard
- **Specification**: Open file format (`.canvas`) representing spatial notes, cards, and relationship edges.
- **Node Types**: `text`, `file`, `link`, `group`.
- **Use Case**: AI agents can generate `.canvas` files directly to output interactive visual system architecture diagrams, mindmaps, and user flow charts.

Example `.canvas` Structure:
```json
{
  "nodes": [
    {"id": "node-1", "type": "text", "text": "# Frontend\nNext.js 15 App Router", "x": 0, "y": 0, "width": 300, "height": 180, "color": "1"},
    {"id": "node-2", "type": "text", "text": "# Database\nSupabase PostgreSQL", "x": 450, "y": 0, "width": 300, "height": 180, "color": "4"}
  ],
  "edges": [
    {"id": "edge-1", "fromNode": "node-1", "toNode": "node-2", "label": "Server Actions / SQL"}
  ]
}
```

### 2. Obsidian Headless (`obsidian-headless`)
- Headless command-line sync client for Obsidian vaults.
- Allows AI coding agents and automated CI/CD runners to pull, update, and push markdown notes without running the desktop Obsidian application.

### 3. KNAP (`knap`)
- A simple, high-performance template engine that transforms structured data (JSON, YAML) into formatted Markdown.
