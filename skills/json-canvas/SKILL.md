---
name: json-canvas
description: Generate and manipulate Obsidian JSON Canvas (.canvas) files for visual system architecture, mindmaps, entity relationship diagrams, and multi-step user flows. Use when asked to "create a canvas diagram", "generate architecture canvas", "visualize user flow as canvas", or "map out project dependencies visually".
metadata:
  author: obsidianmd & antigravity
  version: "1.0.0"
  argument-hint: "[create | update | export] <filename.canvas>"
---

# JSON Canvas (`.canvas`) Skill

Generate interactive infinite canvas diagrams adhering to the official [jsoncanvas.org](https://jsoncanvas.org/) specification.

## When to Use

Use this skill whenever:
- Visualizing complex system architecture, microservices, or database schemas.
- Generating spatial brainstorming canvases, mindmaps, or project roadmaps.
- Creating user journey flows with visual branching logic.
- Building interactive cards that link to project files (`docs/PRD.md`, `ARCHITECTURE.md`).

## JSON Canvas Format Specification

A valid `.canvas` file is a UTF-8 JSON file with `nodes` and `edges`:

```json
{
  "nodes": [
    {
      "id": "unique-id-1",
      "type": "text",
      "text": "# API Gateway\n- Handles authentication\n- Rate limiting",
      "x": 100,
      "y": 100,
      "width": 300,
      "height": 200,
      "color": "1"
    },
    {
      "id": "unique-id-2",
      "type": "file",
      "file": "docs/ARCHITECTURE.md",
      "x": 500,
      "y": 100,
      "width": 350,
      "height": 250
    }
  ],
  "edges": [
    {
      "id": "edge-1",
      "fromNode": "unique-id-1",
      "fromSide": "right",
      "toNode": "unique-id-2",
      "toSide": "left",
      "label": "References"
    }
  ]
}
```

### Color Codes
- `"1"`: Red
- `"2"`: Orange
- `"3"`: Yellow
- `"4"`: Green
- `"5"`: Cyan
- `"6"`: Purple

## Rules for Agents
1. Calculate node positions dynamically (`x`, `y`) with at least `100px` padding between adjacent nodes to prevent visual collisions.
2. Label edges clearly with the relationship or data protocol (e.g., `HTTPS`, `Server Action`, `Dependencies`).
3. Embed markdown headings and bullet points inside text nodes for readability.
