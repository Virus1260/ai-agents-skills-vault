---
name: voice-agents
description: "Production-grade Voice Agents & Humanized Neural TTS. Covers real-time voice architectures (Speech-to-Speech vs. Pipeline STT→LLM→TTS), SSML emotional markup, human pacing rules (micro-pauses, breath intervals, structural pauses), multi-voice persona modeling, and low-latency streaming audio."
source: diegosouzapw/awesome-omni-skills & xfstudio/skills
---

# Voice Agents & Humanized Neural Narration

Production guide for voice AI agents, speech synthesis markup, and emotionally resonant conversational audio.

## 1. The Core Architecture

### Architecture Comparison
1. **Speech-to-Speech (S2S)** (e.g. OpenAI Realtime API, Gemini Multimodal Live, Moshi)
   - *Latency*: 250ms – 500ms
   - *Pros*: Preserves human breathing, inflections, interjections, laughing, emotional undertones.
   - *Cons*: Difficult to inspect intermediate tokens, higher compute cost.

2. **Pipeline Architecture (STT → LLM → TTS)**
   - *Latency*: 600ms – 1200ms
   - *Components*: Whisper / Deepgram Nova-3 (STT) → Fast LLM (Groq / Claude 3.5 Haiku / GPT-4o-mini) → ElevenLabs / Cartesia / Edge-TTS (TTS).
   - *Pros*: Complete control over text preprocessing, SSML injection, pronunciation mapping, guardrails.

---

## 2. Laws of Human Speech Synthesis (The Soothing Human Touch)

Standard TTS sounds robotic because machines read continuously without breathing or modulating emphasis. To achieve natural, emotionally intelligent speech, apply the **Four Laws of Human Voice**:

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

### Law 3: The Pitch & Emphasis Rule (Intensity over Volume)
- In human speech, profound takeaways are spoken with **lower pitch (-1st to -2st)** and calmer intensity rather than shouting.
- Use pitch drops for technical laws and load-bearing conclusions.
- Use reduced volume (-2dB) and slightly higher pitch for side-notes and footnotes.

### Law 4: Phonetic Tuning & Abbreviation Expansion
Never pass raw acronyms or engineering units to TTS. Pre-process them:
- `AFD` → *"A-F-D"*
- `mbar` → *"millibars"*
- `kJ/kg` → *"kilojoules per kilogram"*
- `W/m²K` → *"Watts per square meter Kelvin"*
- `Δv` → *"delta v"*
- `dP/dT` → *"d P by d T"*
- `dm/dt` → *"d m by d t"*
- `21 CFR Part 11` → *"21 C F R Part 11"*

---

## 3. Pre-Processing Pipeline (SSML & Segment Chunker)

```python
import re

def prepare_humanized_speech(text: str, voice_style="academic") -> str:
    # 1. Phonetic replacement of engineering terms
    substitutions = [
        (r'\bAFD\b', 'A-F-D'),
        (r'\bmbar\b', 'millibars'),
        (r'\bkJ/kg\b', 'kilojoules per kilogram'),
        (r'\bW/m²K\b', 'Watts per square meter Kelvin'),
        (r'\b°C\b', ' degrees Celsius'),
        (r'\bCIP/SIP\b', 'C-I-P and S-I-P'),
        (r'(\d+)\s*mbar', r'\1 millibars'),
    ]
    for pattern, repl in substitutions:
        text = re.sub(pattern, repl, text)

    # 2. Add structural SSML pauses
    paragraphs = [p.strip() for p in text.split('\n\n') if p.strip()]
    processed = []
    
    for para in paragraphs:
        # Punctuation pauses
        para = re.sub(r'\.\s+', '. <break time="650ms"/> ', para)
        para = re.sub(r',\s+', ', <break time="280ms"/> ', para)
        para = re.sub(r':\s+', ': <break time="400ms"/> ', para)
        para = re.sub(r'—\s*', ' <break time="350ms"/> ', para)
        processed.append(para)

    # Wrap in soothing conversational prosody
    rate = "92%" if voice_style == "academic" else "96%"
    pitch = "-1st" if voice_style == "academic" else "0st"
    
    ssml = (
        f'<speak><prosody rate="{rate}" pitch="{pitch}">'
        + '<break time="1200ms"/>'.join(processed)
        + '</prosody></speak>'
    )
    return ssml
```

---

## 4. Multi-Voice Persona Modeling

Provide listeners with distinct, emotionally calibrated voice profiles:
1. **Dr. Elena Vance (British Academic / Soothing & Methodical)**
   - *Voice*: `en-GB-SoniaNeural` or ElevenLabs *Charlotte*
   - *Cadence*: Rate 0.90x, Pitch 0.95x, 1.4s section pauses.
2. **Marcus Vance (Warm Baritone / Narrative & Authoritative)**
   - *Voice*: `en-US-ChristopherNeural` or ElevenLabs *Adam*
   - *Cadence*: Rate 0.92x, Pitch 0.88x, crisp consonants.
3. **Dr. Aris Thorne (Deep Senior Fellow / Technical Master)**
   - *Voice*: `en-GB-RyanNeural` or ElevenLabs *George*
   - *Cadence*: Rate 0.93x, Pitch 0.92x, deliberate transitions.
4. **Seraphina Lin (Warm Scholar / Gentle & Engaging)**
   - *Voice*: `en-US-JennyNeural` or ElevenLabs *Rachel*
   - *Cadence*: Rate 0.90x, Pitch 1.02x, conversational pauses.

---

## 5. Production Checklist

- [ ] Rate scaled down to 0.90x–0.95x (never rushed)
- [ ] Structural pauses injected at paragraph, heading, and clause boundaries
- [ ] Technical acronyms and scientific units phonetically expanded
- [ ] Browser natural voices filtered and prioritized over legacy synthetic voices
- [ ] Visualizer waveform reflects real-time audio playback
- [ ] Sentence-level spotlight synchronized with spoken audio
- [ ] Graceful fallback to browser speech synthesis when network/audio files are unavailable
