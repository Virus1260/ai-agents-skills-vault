---
name: lenis-smooth-scroll
description: Ultra-smooth momentum scrolling integration for web applications using Lenis (@studio-freight/lenis / lenis/react) with GSAP ScrollTrigger synchronization.
---

# Lenis Smooth Scroll

Lenis is a lightweight, robust, high-performance smooth scroll library used by award-winning Awwwards web experiences.

## Core Installation
```bash
npm install lenis
# or for React / Next.js
npm install lenis @studio-freight/react-lenis
```

## Vanilla JavaScript Setup
```javascript
import Lenis from 'lenis';

const lenis = new Lenis({
  duration: 1.2,
  easing: (t) => Math.min(1, 1.001 - Math.pow(2, -10 * t)),
  smoothWheel: true,
  orientation: 'vertical',
  gestureOrientation: 'vertical',
});

function raf(time) {
  lenis.raf(time);
  requestAnimationFrame(raf);
}

requestAnimationFrame(raf);
```

## GSAP ScrollTrigger Integration
To synchronize Lenis with GSAP ScrollTrigger so triggers align perfectly:
```javascript
import Lenis from 'lenis';
import gsap from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';

gsap.registerPlugin(ScrollTrigger);

const lenis = new Lenis();

lenis.on('scroll', ScrollTrigger.update);

gsap.ticker.add((time) => {
  lenis.raf(time * 1000);
});

gsap.ticker.lagSmoothing(0);
```

## React / Next.js (App Router) Component
```tsx
'use client';
import { ReactLenis, useLenis } from 'lenis/react';

export default function SmoothScrollLayout({ children }: { children: React.ReactNode }) {
  return (
    <ReactLenis root options={{ lerp: 0.1, duration: 1.5, smoothWheel: true }}>
      {children}
    </ReactLenis>
  );
}
```
