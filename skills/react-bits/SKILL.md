---
name: react-bits
description: Production animated React UI components, interactive cards, accordion galleries, and background beams inspired by ReactBits.dev.
---

# React Bits Component Library

Curated component patterns from ReactBits (`https://reactbits.dev/`) providing animated UI blocks, interactive cards, accordion galleries, and particle backgrounds.

## Popular Components & Usage

### 1. Animated Accordion Gallery
Used for interactive showcases where expanding cards slide smoothly with spring physics:
- Uses Framer Motion layout animations (`layoutId`, `animate={{ flex: active ? 3 : 1 }}`).
- Features high-contrast typography, rounded-2xl cards, and dark glassmorphic overlays.

### 2. Spotlight & Shimmer Cards
- Cards with dynamic mouse-tracking spotlights using CSS radial gradients:
  `background: radial-gradient(600px circle at ${mouse.x}px ${mouse.y}px, rgba(255,255,255,0.06), transparent 40%)`

### 3. Split-Text & Variable Fonts Animation
- Staggered word and character reveals utilizing CSS transitions or GSAP SplitText.

### 4. Background Beams & Gradients
- Ambient moving gradients for modern SaaS heroes with GPU-accelerated backdrop blur.
