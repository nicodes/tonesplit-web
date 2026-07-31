# tonesplit-web

The splash page at [tonesplit.app](https://tonesplit.app). One static page.

```sh
mise install
bun install
bun run dev      # http://localhost:4321
bun run build    # -> dist/
```

## What is here

```
src/layouts/Full.astro   <head>, meta, structured data
src/pages/index.astro    the page, its data and its styles
src/styles/global.css    palette, fonts, resets
```

Plain Astro with scoped CSS. No component framework and no CSS framework: this
is one page with no interactivity, and the scaffold's Qwik and Tailwind were a
runtime and a build step to produce markup that is written out directly.
Removing them is why the built page ships **no JavaScript at all** — the single
`<script>` in `dist/index.html` is the structured-data block.

## The app on the page is markup, not a screenshot

The phone in the hero is HTML and one inline SVG, so it stays sharp on any
display, scales with the reader's font size, and never renders blurry on a
device it was not captured for.

More to the point, the parts that could be wrong are computed rather than drawn:

- **The scope** runs the app's own `sample()` — the same four-waveform
  oscillator — over the four voices Tone Split opens with (108 and 111 Hz hard
  left, 114 and 117 hard right). Cycles across the screen and amplitude come
  off each voice's frequency and level, so 111 Hz really is drawn a little
  tighter than 108, and one channel of the SVG is 330 × 128, which is the app's
  own channel height at the width the frame renders.
- **Every dial** is placed by the app's angle formula, `((value − min) / (max −
  min)) × 270 − 135`, rather than by eye. A dial reading `108 Hz` points where
  the app would point it.
- **The chord count** is the library built the way the app builds it — eleven
  roots against eight voicings, plus five extended chords on A — so the "93
  presets" on the page is counted, not remembered. Amin7's frequencies are
  equal temperament off A440, worked out on the page.

If the app changes, these go stale in the source, where a reader can see the
formula that produced them.

## The palette is the app's

Tone Split is a dark instrument accented in `#d9ff57` — the transport button,
the active voice, the waveform glyphs. The site wears the same lime on its dark
surfaces. On paper that colour reads at 1.2:1, so headings and links use
`--lime-deep` (`#55701c`), the same hue at 5.1:1. Fonts are the platform's own
and nothing is fetched from a third party.

## Related

- ormos.dev and komizo.dev — same shape, same house
