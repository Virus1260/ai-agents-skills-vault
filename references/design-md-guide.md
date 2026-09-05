# DESIGN.md Catalog & Brand Design Systems Guide

- **Catalogs**: [getdesign.md](https://getdesign.md/) | [designmd.co](https://www.designmd.co/) | [awesome-design-md](https://github.com/voltagent/awesome-design-md)
- **Location in Vault**: `E:\git_desktop\ai-agents-skills-vault\design-systems\`

## How AI Coding Agents Use DESIGN.md
When prompted to build an interface matching a specific brand style (e.g. "Create a SaaS landing page in Stripe style"):
1. Load `design-systems/stripe/DESIGN.md`.
2. Extract exact color tokens (e.g. Slate, Indigo accents, blur values), typography hierarchy (Inter / SF Pro Display), border radiuses (8px / 12px), and shadow layers.
3. Apply directly into CSS tokens (`--color-primary`, `--radius-md`) to ensure pixel-perfect brand alignment.
