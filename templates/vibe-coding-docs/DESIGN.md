# UI/UX Design System Specification

> **Project Design Identity**: Modern, High-Contrast, Minimal & Obsidian  
> **Brand Direction**: Fast, Fluid, Distraction-Free  

---

## 1. Core Design Principles
- **Clarity over Clutter**: Maximize whitespace, eliminate unnecessary borders, and ensure information hierarchy is immediately obvious.
- **Consistent Physics**: All transitions and micro-interactions must use natural spring physics (200-300ms easing curves).
- **Dark Mode Excellence**: True obsidian/neutral dark mode background with semantic contrast layers (elevations).

---

## 2. Color Palette & Semantic Tokens

| Role | Hex Code | Purpose & Application |
|---|---|---|
| **Background (Dark)** | `#09090B` (Zinc-950) | Deep canvas background |
| **Card / Surface** | `#18181B` (Zinc-900) | Elevated cards, dialogs, drawers |
| **Border / Subtle** | `#27272A` (Zinc-800) | Subtle container outlines |
| **Primary Accent** | `#6366F1` (Indigo-500) | Primary CTA buttons, active state indicators |
| **Secondary Accent** | `#8B5CF6` (Purple-500) | Badges, secondary actions, subtle highlights |
| **Success** | `#10B981` (Emerald-500) | Confirmed transactions, success toasts |
| **Warning** | `#F59E0B` (Amber-500) | Caution notices, threshold warnings |
| **Error / Destructive** | `#EF4444` (Red-500) | Destructive buttons, validation errors |
| **Text Primary** | `#FAFAFA` (Zinc-50) | High-contrast body text and headers |
| **Text Muted** | `#A1A1AA` (Zinc-400) | Secondary labels, timestamps, placeholders |

---

## 3. Typography Hierarchy

- **Primary Font Family**: Inter / Geist Sans (`font-sans`)
- **Monospace Family**: Geist Mono / JetBrains Mono (`font-mono`)

| Level | Size | Weight | Line Height | Tracking |
|---|---|---|---|---|
| **Display / H1** | `2.25rem` (36px) | `700` (Bold) | `2.5rem` | `-0.025em` |
| **Section / H2** | `1.5rem` (24px) | `600` (SemiBold) | `2rem` | `-0.02em` |
| **Subheading / H3** | `1.25rem` (20px) | `600` (SemiBold) | `1.75rem` | `-0.015em` |
| **Body Large** | `1rem` (16px) | `400` (Regular) | `1.5rem` | `normal` |
| **Body Small / Meta** | `0.875rem` (14px) | `400` / `500` | `1.25rem` | `normal` |
| **Micro / Caption** | `0.75rem` (12px) | `500` (Medium) | `1rem` | `0.02em` |

---

## 4. UI Components & Micro-Interactions
- **Buttons**: Minimum touch target `44x44px`. Active scale `scale(0.98)` on click.
- **Focus Rings**: `ring-2 ring-indigo-500 ring-offset-2 ring-offset-zinc-950` on keyboard tab.
- **Elevation**: Use subtle inset borders (`border border-zinc-800/80`) combined with soft drop-shadows rather than heavy dark shadows.
- **Animation**: Micro-interactions with Motion Primitives / Framer Motion. Zero layout shift.
