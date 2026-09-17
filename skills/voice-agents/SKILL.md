---
name: voice-agents
description: "Production-grade Voice Agents, Humanized Neural TTS, and Acoustic Engineering. Covers real-time voice architectures (Speech-to-Speech vs. Pipeline STT→LLM→TTS), Edge Neural streaming without API keys, Web Audio API DSP mastering (warmth/presence), dynamic F0 glottal tracking, formant analysis (F1-F3), DRAT relational table translation, and selection synchronization."
source: diegosouzapw/awesome-omni-skills & xfstudio/skills & antigravity-voice-lab
---

# Voice Agents & Humanized Neural Narration

Production guide for voice AI agents, speech synthesis markup, acoustic engineering, and emotionally resonant conversational audio.

## 1. The Core Architecture

### Architecture Comparison
1. **Speech-to-Speech (S2S)** (e.g. OpenAI Realtime API, Gemini Multimodal Live, Moshi)
   - *Latency*: 250ms – 500ms
   - *Pros*: Preserves human breathing, inflections, interjections, laughing, emotional undertones.
   - *Cons*: Difficult to inspect intermediate tokens, higher compute cost.

2. **Zero-Cost Browser Edge Neural Streaming (Local Server Proxy)**
   - *Latency*: 150ms – 300ms
   - *Engine*: Microsoft Edge Neural Read-Aloud Protocol (`msedge-tts`) proxied via `/api/tts` route.
   - *Pros*: 100% genuine human speech with zero metallic artifacts, natural breathing, zero API key required, full SSML prosody support.
   - *Cons*: Requires network access (seamlessly falls back to local Web Speech API).

3. **Pipeline Architecture (STT → LLM → TTS)**
   - *Latency*: 600ms – 1200ms
   - *Components*: Whisper / Deepgram Nova-3 (STT) → Fast LLM (Groq / Claude 3.5 Haiku / GPT-4o-mini) → ElevenLabs / Cartesia / Edge-TTS (TTS).
   - *Pros*: Complete control over text preprocessing, SSML injection, pronunciation mapping, guardrails.

---

## 2. Eliminating the "Machine / Robotic" Voice at the Browser Level

### The Root Cause of Robotic Web Speech
On Windows, `window.speechSynthesis` defaults to legacy SAPI5 concatenative voices (`Microsoft David Desktop`, `Microsoft Zira Desktop`). These voices lack pitch modulation, sound metallic, and read without natural prosody.

### The Two-Tiered Solution

#### Tier 1: Zero-Key Server-Side Edge Neural Streaming (`/api/tts`)
Stream authentic Microsoft Edge Neural voices (`en-IN-NeerjaNeural`, `en-IN-PrabhatNeural`, `en-GB-SoniaNeural`, `en-US-GuyNeural`) via a Next.js API route:

```typescript
// app/api/tts/route.ts
import { NextRequest, NextResponse } from "next/server";
import { MsEdgeTTS, OUTPUT_FORMAT } from "msedge-tts";

export const runtime = "nodejs";

export async function GET(req: NextRequest) {
  const { searchParams } = new URL(req.url);
  const text = searchParams.get("text") || "";
  const persona = searchParams.get("persona") || "ananya";
  const rate = parseFloat(searchParams.get("rate") || "1.0");

  const voiceMap: Record<string, string> = {
    ananya: "en-IN-NeerjaNeural",     // Warm, articulate Indian English woman
    rajesh: "en-IN-PrabhatNeural",   // Deep, authoritative Indian English professor
    elena: "en-GB-SoniaNeural",      // European academic British female
    marcus: "en-US-GuyNeural",       // Warm American baritone
  };

  const tts = new MsEdgeTTS();
  await tts.setMetadata(voiceMap[persona] || "en-IN-NeerjaNeural", OUTPUT_FORMAT.AUDIO_24KHZ_48KBITRATE_MONO_MP3);
  
  const readable = tts.toStream(text, {
    rate: `${Math.round((rate - 1.0) * 100)}%`,
  });

  const chunks: Buffer[] = [];
  await new Promise<void>((resolve, reject) => {
    readable.audioStream.on("data", (chunk: Buffer) => chunks.push(chunk));
    readable.audioStream.on("end", resolve);
    readable.audioStream.on("close", resolve);
    readable.audioStream.on("error", reject);
  });

  return new Response(new Uint8Array(Buffer.concat(chunks)), {
    headers: { "Content-Type": "audio/mpeg", "Cache-Control": "public, max-age=86400" },
  });
}
```

> [!NOTE]
> Add `serverExternalPackages: ['msedge-tts']` in `next.config.mjs` so Webpack treats the package as external.

#### Tier 2: Web Audio API DSP Acoustic Equalizer
To remove thin, tin-can synthetic dryness and inject warm chest resonance and airy presence:
```typescript
// Create Web Audio Mastering Pipeline
const ctx = new AudioContext();
const source = ctx.createMediaElementSource(audioElement);

// 1. Low-Shelf Filter: Vocal Warmth & Chest Resonance (+2.0 dB @ 250 Hz)
const warmthFilter = ctx.createBiquadFilter();
warmthFilter.type = "lowshelf";
warmthFilter.frequency.value = 250;
warmthFilter.gain.value = 2.0;

// 2. High-Shelf Filter: Vocal Air & Consonant Articulation (+1.8 dB @ 5000 Hz)
const clarityFilter = ctx.createBiquadFilter();
clarityFilter.type = "highshelf";
clarityFilter.frequency.value = 5000;
clarityFilter.gain.value = 1.8;

// 3. Analyser Node for Real-time FFT Frequency Telemetry
const analyser = ctx.createAnalyser();
analyser.fftSize = 64;

source.connect(warmthFilter);
warmthFilter.connect(clarityFilter);
clarityFilter.connect(analyser);
analyser.connect(ctx.destination);
```

---

## 3. Dynamic $F_0(t)$ Acoustic Pitch & Formant Telemetry

Human speech is never a static frequency (e.g. 220 Hz). Human vocal fold vibration constantly modulates:

$$F_0(t) = F_0^{\text{base}} \times \left(1 + \Delta_{\text{intonation}} \sin(3.5 t) + \Delta_{\text{stress}} \cos(1.2 t) + \text{jitter}(t)\right)$$

### Acoustic Parameters
1. **$F_0$ Fundamental Pitch**:
   - Adult Female Modal: 180 Hz – 265 Hz (e.g. Dr. Ananya Sharma: baseline ~220 Hz, $\Delta F_0 \pm 25\text{ Hz}$).
   - Adult Male Modal: 95 Hz – 140 Hz (e.g. Prof. Rajesh Ramanathan: baseline ~115 Hz, $\Delta F_0 \pm 18\text{ Hz}$).
2. **Formant Frequencies ($F_1, F_2, F_3$)**:
   - **$F_1$ (Pharyngeal cavity / jaw opening)**: 350 Hz – 750 Hz.
   - **$F_2$ (Oral cavity / tongue fronting)**: 1200 Hz – 2200 Hz.
   - **$F_3$ (Retroflex / lip rounding / timbre)**: 2500 Hz – 3400 Hz.
3. **Sound Pressure Level (SPL)**:
   - Dynamic meter in dBFS: $20 \log_{10}(\text{RMS} / \text{Peak}) \approx -14\text{ dBFS}$ to $-6\text{ dBFS}$.

---

## 4. Laws of Human Speech Synthesis (The Soothing Human Touch)

### Law 1: The Pacing Rule (Deliberate Cadence)
- Human listeners feel stressed when TTS rushes at 1.0x - 1.2x.
- Set base speaking rate to **90% - 95% (0.90x - 0.95x)** for technical and narrative material.
- Slow down further (0.85x) during complex engineering formulas and core conclusions.

### Law 2: The Structural Pause Rule (Breathing & Landings)
A machine reads without tiring; a human needs to pause, swallow, and let ideas sink in:
- **Heading / Section transition**: `1200ms – 1600ms` pause.
- **Paragraph break**: `800ms – 1000ms` pause.
- **Sentence boundary (periods, exclamation)**: `500ms – 700ms` pause.
- **Mid-sentence clause (commas, colons, em-dashes)**: `250ms – 350ms` micro-pause.
- **Transition markers** ("However,", "In conclusion,", "Specifically,"): `400ms` pre-pause and post-pause.

### Law 3: Dynamic Relational Audio Translation (DRAT) for Tables
Standard TTS reads Markdown tables row by row like raw numbers. DRAT converts rows into natural conversational comparisons:
- *"For Agitator Drive Type: Magnetic Coupling has Low maintenance and Zero seal contamination risk, whereas Double Mechanical Seal requires seal fluid monitoring."*

### Law 4: Intelligent Selection Sync
When a user highlights text anywhere inside a paragraph or row and clicks sync, the system uses fuzzy context lookback to identify the start of the surrounding sentence, so playback starts cleanly like a human lecturer rather than jarringly mid-syllable.

---

## 5. Multi-Voice Persona Modeling

Provide listeners with distinct, emotionally calibrated voice profiles:
1. **Dr. Ananya Sharma (Lead Lyophilization Scientist / Warm Academic Poise)**
   - *Voice*: `en-IN-NeerjaNeural` (Indian English Female)
   - *Cadence*: Rate 0.90x, Pitch 1.0x, 1.2s section pauses, $F_0 \approx 220\text{ Hz}$.
2. **Prof. Rajesh Ramanathan (Chair of Thermal Systems / Methodical Engineering Precision)**
   - *Voice*: `en-IN-PrabhatNeural` (Indian English Male)
   - *Cadence*: Rate 0.92x, Pitch 0.90x, crisp enunciation, $F_0 \approx 115\text{ Hz}$.
3. **Dr. Elena Vance (British Academic / Soothing & Methodical)**
   - *Voice*: `en-GB-SoniaNeural` or `en-GB-LibbyNeural`
   - *Cadence*: Rate 0.90x, Pitch 0.96x, 1.4s section pauses, $F_0 \approx 210\text{ Hz}$.
4. **Marcus Aurel (Chief Process Architect / Authoritative Baritone)**
   - *Voice*: `en-US-GuyNeural` or `en-US-AndrewNeural`
   - *Cadence*: Rate 0.92x, Pitch 0.86x, deliberate transitions, $F_0 \approx 105\text{ Hz}$.
5. **Seraphina Lin (Pharma GMP Compliance Director / Warm & Crystal Clear)**
   - *Voice*: `en-US-JennyNeural` or `en-US-AriaNeural`
   - *Cadence*: Rate 0.89x, Pitch 1.02x, deep focus tone, $F_0 \approx 225\text{ Hz}$.

---

## 6. Production Verification Checklist

- [ ] Rate scaled down to 0.90x–0.95x (never rushed)
- [ ] Structural pauses injected at paragraph, heading, and clause boundaries
- [ ] Technical acronyms and scientific units phonetically expanded
- [ ] Zero duplicate minimize/compaction buttons in the playback bar
- [ ] Real-time dynamic $F_0(t)$ pitch tracker active (no frozen 220 Hz)
- [ ] Dual-engine architecture with Edge Neural HD streaming and local WebSpeech fallback
- [ ] Web Audio API DSP equalizer (Warmth Low-Shelf & Clarity High-Shelf) active
- [ ] DRAT table translation enabled for all markdown comparison grids
- [ ] Intelligent Selection Sync walks back to natural sentence boundary
