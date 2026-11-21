# DESIGN — getup ("Daybreak")

> Status: **APPROVED by human 2026-11-19.** Colours replaced by human decision 2026-11-20 (final): green `#007E14` primary, orange `#E26150` brand, native iOS base. Source of truth for all UI. Tokens are mirrored exactly in `app/src/theme/theme.ts`.
> Builders: use tokens only. No raw hex, no raw font sizes, no magic spacing numbers in screens.

## 1. Brand

- **Name:** getup (always lowercase in the wordmark; "getup" in running text).
- **Concept:** the moment night turns into sunrise. The UI sits on the native iOS black/grey base; the brand orange is the rising sun, and green means "go".
- **Personality:** **bright, bold, encouraging.**
- **Logo / app icon (final, human 2026-11-20):** `docs/brand/getup-icon.svg` (master) and `docs/brand/getup-icon-1024.png` (App Store / Expo `icon`). A tilted, ringing bell in brand orange `#E26150` with two green `#007E14` sound arcs, on black `#000000`. Use the files as they are: never redraw, recolour or add text to the mark. The wordmark "getup" (Unbounded 700, lowercase) sits beside or below it, in `text`.
- **Default theme:** dark (phones are used in dark bedrooms). Light theme is a full equal option in Settings.

### Tone of voice
| Lang | Phase | Voice | Example (alarm saved) | Example (mission done) |
|---|---|---|---|---|
| en | v1 | Short, energetic, playful coach. Second person, contractions OK. Max ~8 words per headline. | "Set. Rings in 7 h 20 min." | "You're up. Nice work." |
| ru | v2 | Same energy, «вы», no slang, no exclamation spam. | «Готово. Зазвонит через 7 ч 20 мин.» | «Вы встали. Отлично!» |
| uz | v2 | Warm, «siz», Latin script, short. | "Tayyor. 7 soat 20 daqiqadan keyin jiringlaydi." | "Turdingiz. Barakalla!" |

**Do**
- "Solve 3 problems to turn off the alarm."
- "Hold 10 s to stop without a mission."
- "Pro unlocks Wake-up check and all sounds."

**Don't**
- Shame: ~~"Lazy again?"~~, ~~"Overslept AGAIN?"~~
- Unprovable claims: ~~"No.1 alarm app"~~, ~~"Scientifically proven"~~
- Fake urgency: ~~"Only today! 80% OFF"~~
- More than one exclamation mark per screen.

## 2. Color

Semantic tokens. Contrast ratios are WCAG 2.1 and were calculated, not estimated.

Two accent colours, each with one job:
- **primary green `#007E14` = action + selection.** Filled buttons (white text), toggles on, selected chips/radios/plan, success ticks.
- **brand orange `#E26150` = identity + attention.** Active tab, icons, highlights, Pro tag, ringing screen, progress bars and countdown rings. Text on filled orange is always **black**.

| Token | Dark (default) | Light | Use |
|---|---|---|---|
| background | `#000000` | `#F2F2F7` | screen background (native iOS grouped base) |
| surface | `#1C1C1E` | `#FFFFFF` | cards, sheets, list groups |
| surfaceAlt | `#2C2C2E` | `#E5E5EA` | inputs, chips off, pressed rows, nested cards |
| text | `#FFFFFF` | `#000000` | primary text |
| textMuted | `#98989F` | `#636366` | secondary text, captions |
| primary | `#007E14` | `#007E14` | filled button, toggle on, selected chip/radio/plan, success fill/icon |
| onPrimary | `#FFFFFF` | `#FFFFFF` | text/icons on primary |
| brand | `#E26150` | `#E26150` | active tab icon, icons, highlights, progress fill, countdown ring, Pro tag fill, ringing |
| onBrand | `#000000` | `#000000` | text/icons on brand fill |
| brandText | `#E26150` | `#B23A2A` | orange **text** (links, ghost buttons, selected tab label, "Rings in…") |
| brandTint | `rgba(226,97,80,0.16)` | `rgba(226,97,80,0.12)` | soft highlight behind selected/hero cards |
| success | `#007E14` | `#007E14` | success ticks and fills (= primary) |
| warning | `#FFD60A` | `#8A5600` | warnings ("won't ring") |
| danger | `#FF453A` | `#D70015` | destructive actions, errors |
| onDanger | `#000000` | `#FFFFFF` | text on danger fill |
| border | `#38383A` | `#C6C6C8` | hairlines, card outlines (decorative, not text) |
| overlay | `rgba(0,0,0,0.60)` | `rgba(0,0,0,0.30)` | scrim behind sheets/modals |

**Text rules (hard):**
1. **No green text in dark mode** (green on black = 3.99, fails AA for small text). In dark, success/positive text uses `text`; the green appears only as the icon/fill beside it. Green text is allowed in light mode only on `background`/`surface`, never on `surfaceAlt`.
2. **No `brand` as small text in light mode** (3.47 on white). Use `brandText` (`#B23A2A`). Orange icons ≥ 20pt may use `brand` in both themes (≥ 3:1 for UI graphics).
3. In dark, `brandText` is not used on `surfaceAlt` (4.02). Use it on `background` or `surface`.
4. Filled orange → black text. Filled green → white text. Never the other way round (white on orange = 3.47 ❌).
5. `danger` and `brand` are close in hue. Errors must always carry an icon + text; orange is never used to mean "error".

**Gradients** (ringing, onboarding hero, paywall header, mission complete):
- `ember` dark: `#000000` → `#2A0F0B` → `#E26150` (top → bottom, stops 0 / 0.5 / 1)
- `ember` light: `#FFFFFF` → `#F9D3CD` → `#E26150` (stops 0 / 0.5 / 1)
- Text over `ember`: dark uses `text` (white) and sits in the top 50%; light uses `text` (black) and may sit anywhere. Any text on the bottom (orange) part is black.

### Contrast check (WCAG 2.1, calculated; ≥ 4.5:1 for text)
| Pair | Dark | Light |
|---|---|---|
| text / background | 21.0 ✅ | 18.82 ✅ |
| text / surface | 17.01 ✅ | 21.0 ✅ |
| text / surfaceAlt | 13.94 ✅ | 16.73 ✅ |
| textMuted / background | 7.33 ✅ | 5.37 ✅ |
| textMuted / surface | 5.94 ✅ | 5.99 ✅ |
| textMuted / surfaceAlt | 4.86 ✅ | 4.77 ✅ |
| onPrimary / primary (white on green) | 5.26 ✅ | 5.26 ✅ |
| onBrand / brand (black on orange) | 6.06 ✅ | 6.06 ✅ |
| brandText / background | 6.06 ✅ | 5.33 ✅ |
| brandText / surface | 4.91 ✅ | 5.95 ✅ |
| brandText / surfaceAlt | 4.02 ❌ (don't) | 4.74 ✅ |
| primary as text / background | 3.99 ❌ (rule 1) | 4.71 ✅ |
| primary as text / surface | 3.24 ❌ | 5.26 ✅ |
| brand as text / background | 6.06 ✅ (= brandText) | 3.11 ❌ (rule 2) |
| warning / background | 14.88 ✅ | 5.52 ✅ |
| danger / background | 6.16 ✅ | 4.83 ✅ |
| onDanger / danger | 6.16 ✅ | 5.38 ✅ |
| text (white) / ember dark mid stop `#2A0F0B` | 17.92 ✅ | — |
| text (black) / ember light mid stop `#F9D3CD` | — | 15.23 ✅ |

### Distinctness from reference
The human chose the native iOS dark base (black / `#1C1C1E`), which the reference also uses (FLOWS §6). That base is the iOS system default, not the reference's brand. getup's distinction comes from the accents: the reference's CTA is red/pink with cyan secondary; getup's CTA is **green with white text** and the brand colour is **orange with black text**. Rules that keep it distinct:
- No red or pink CTA anywhere. Orange is never the main filled button on list/editor/settings screens.
- No cyan/teal.
- The ringing screen uses the `ember` gradient + sun illustration, not a flat black screen with a red button.
- **Risk (4.1):** black base + a red-orange accent is closer to the reference than the old indigo/amber system. Keep the illustrations, icon, layouts and copy fully original.

## 3. Typography

- **UI font:** **Manrope** (SIL OFL, free for commercial use; Latin Extended + Cyrillic). Package: `@expo-google-fonts/manrope`. Weights loaded: 500, 600, 700, 800.
- **Numeric / display font:** **Unbounded** (SIL OFL; Latin Extended + Cyrillic). Package: `@expo-google-fonts/unbounded`. Weights loaded: 500, 700. Used only for clock digits, big counters and the wordmark.
- **Uzbek check (v2):** the Uzbek letters oʻ / gʻ use U+02BB. Before v2 ships, verify that Manrope renders U+02BB. If it doesn't, the fallback is the system font for that glyph.
- **Numbers:** clock and countdown digits use `fontVariant: ['tabular-nums']`.

| Token | Font | Size (pt) | Weight | Line height | Use |
|---|---|---|---|---|---|
| numeric | Unbounded | 72 | 500 | 80 | ringing clock, time picker selected value, onboarding time |
| numericSm | Unbounded | 40 | 500 | 48 | alarm card time |
| display | Manrope | 34 | 800 | 40 | onboarding headlines, paywall title, "You're up" |
| title | Manrope | 28 | 700 | 34 | screen titles (large nav title) |
| heading | Manrope | 20 | 700 | 26 | section headers, sheet titles, card titles |
| body | Manrope | 17 | 500 | 24 | body text, list row title |
| bodyStrong | Manrope | 17 | 700 | 24 | emphasised body, row values |
| label | Manrope | 16 | 700 | 20 | button labels, chips (sentence case, never ALL CAPS) |
| caption | Manrope | 13 | 600 | 18 | helper text, row subtitles, day letters, badges |

All sizes scale with Dynamic Type (§9). `numeric` caps at 1.3× so the clock fits on one line.

## 4. Spacing & shape

**Spacing (4-pt grid):** `xxs 2 · xs 4 · sm 8 · md 12 · lg 16 · xl 20 · xxl 24 · xxxl 32 · huge 48 · giant 64`
- Screen side gutter: `lg` (16). Space between cards: `md` (12). Section gap: `xxl` (24).
- Sticky bottom CTA area: padding `lg`, plus the safe-area bottom inset.

**Radius:** `xs 6 · sm 10 · md 14 · lg 20 · xl 28 · pill 999`
- Buttons `md` (14). Cards `lg` (20). Sheets: top corners `xl` (28). Chips, toggles and tags: `pill`. Inputs: `sm` (10).
- Distinctness: the reference goes up to 40+ on its pet UI (FLOWS §6). Our maximum is 28.

**Elevation:**
| Level | Dark | Light | Use |
|---|---|---|---|
| 0 | flat, `background` | flat, `background` | screen |
| 1 | `surface` + 1px `border` | `surface` + shadow `0 1 3 rgba(20,23,58,0.08)` | cards, list groups |
| 2 | `surfaceAlt`, no border | `surface` + shadow `0 6 16 rgba(20,23,58,0.12)` | sheets, menus, toasts |
| glow | primary shadow `0 0 24 rgba(0,126,20,0.55)` | same, at 0.35 | only the primary CTA on ringing, paywall and onboarding |

Dark mode never uses drop shadows. Depth comes from the surface colour (`#000000` → `#1C1C1E` → `#2C2C2E`).

## 5. Components

States, for every interactive component:
- **default**
- **pressed:** opacity 0.85 + scale 0.98, `fast` duration
- **disabled:** opacity 0.4, no haptic
- **loading:** spinner replaces the label and the width stays fixed
- **focused:** VoiceOver focus uses the system ring

### Button
- **Anatomy:** container → optional leading icon (20pt) → label (`label`) → optional trailing icon.
- **Variants:**

  | Variant | Fill | Text | Border |
  |---|---|---|---|
  | primary | `primary` | `onPrimary` | — |
  | secondary | `surfaceAlt` | `text` | — |
  | ghost | transparent | `brandText` | — |
  | destructive | `danger` | `onDanger` | — |

- **Sizes:**

  | Size | Height | Horizontal padding | Radius |
  |---|---|---|---|
  | lg | 56 | `xxl` | `md` (sticky CTAs; full width) |
  | md | 48 | `xl` | `md` |
  | sm | 36 | `lg` | `pill` (inline actions); label uses `caption` 600 |

- **Rule:** at most one primary button per screen.

### Card
- **Anatomy:** container (`surface`, radius `lg`, padding `lg`, elevation 1) → optional header (`heading`) → content → optional footer actions.
- **States:** default; pressed (if tappable); selected = 2px `primary` border.
- **AlarmCard** (a specific card):
  - Left side: time in `numericSm` with AM/PM in `caption`; below it, the label + repeat days in `caption`/`textMuted`; then mission icons (16pt, up to 5).
  - Right side: a Toggle.
  - Inactive alarm: time and text use `textMuted`.
  - Swipe left reveals a destructive "Delete" action (`danger` fill, 80 wide).

### ListRow
- **Anatomy:** height ≥ 52 → leading icon (24pt in a 32×32 `surfaceAlt` rounded `sm` tile, optional) → title (`body`) + optional subtitle (`caption`, `textMuted`) → trailing: value (`body`, `textMuted`) / chevron / Toggle / check.
- **Grouping:** rows sit inside a Card with `border` hairline dividers inset by `lg`.
- **States:** pressed = `surfaceAlt` background; disabled.

### Toggle
- Native `Switch`. On = `primary` (green) track, off = `surfaceAlt` (dark) / `border` (light) track, thumb `#FFFFFF`.
- Haptic: selection on change.
- The hit area is the whole row when it's inside a ListRow.

### TimePicker
- A wheel picker with hour and minute columns (plus AM/PM when the locale is 12h). The selected value is in `numeric` at 0.66 scale (48pt) on `text`; values above and below are `textMuted` at 60% opacity.
- A selection band behind the centre row: `surfaceAlt`, radius `md`.
- Helper text under the wheel: "Rings in 7 h 20 min" in `caption` / `brandText`. It updates live.
- Haptic: selection tick per step.

### Sheet
- Bottom sheet. Background `surface` (dark: `surfaceAlt` for level 2), top radius `xl`, grabber 36×5 `border`, scrim `overlay`.
- **Anatomy:** grabber → title (`heading`, centred) → close X (top-right, 44pt hit area) → content → sticky actions.
- **Detents:** medium and large. Swipe down or tapping the scrim dismisses it, unless it is a destructive confirm.
- **Confirm dialogs** (delete, quit) use the native iOS `Alert`, not a Sheet.

### Tag / Chip
- **Chip** (selectable, e.g. repeat days, sound categories):
  - height 36, padding `lg`, radius `pill`, text `label`;
  - off = `surfaceAlt` / `text`; on = `primary` / `onPrimary`.
  - Day chips are circles of 40 with a single letter.
- **Tag** (non-interactive badge):
  - height 22, padding `sm`, radius `pill`, text `caption` 700.
  - Variants: `pro` (`brand` fill + `onBrand` text), `new` (`primary` fill + `onPrimary` text), `neutral` (`surfaceAlt` + `textMuted`).
  - Our Pro badge reads "Pro" in sentence case with a small sun icon. It must not look like the reference's "PRO" pill.

### EmptyState
- **Anatomy:** illustration 160×160 → title (`heading`) → body (`body`, `textMuted`, max 2 lines, centred) → optional primary Button `md`.
- Vertically centred in the available space.

### PaywallPlanCard
- **Anatomy:** radio indicator → plan name (`bodyStrong`) + sub-line (`caption`, e.g. "$3.33/mo, billed yearly") → price (`heading`, right-aligned) → optional Tag (e.g. "7-day free trial", `pro` variant) pinned to the top edge.
- **Default:** `surface`, 1px `border`, radius `lg`, padding `lg`.
- **Selected:** 2px `primary` border, `brandTint` background, radio filled `primary` with a white check.
- **Rules:** prices always come from RevenueCat (never hard-coded). The trial terms line is below the CTA in `caption`.

### ProgressBar
- **Linear:** height 6, radius `pill`, track `surfaceAlt`, fill `brand`. Used for onboarding "1/3" and mission progress. Onboarding shows a label "1 of 3" in `caption`.
- **Countdown ring** (mission time limit, Wake-up check): circular, stroke 6, track `surfaceAlt`. The fill is `brand`, and it switches to `warning` in the last 5 s. The number in the centre is `numericSm`.
- Fill changes animate with `base` duration, `standard` easing.

## 6. Motion

| Token | ms | Use |
|---|---|---|
| fast | 120 | press feedback, toggles |
| base | 240 | most transitions, sheets, progress |
| slow | 400 | screen-level hero transitions, mission complete |
| ringPulse | 1600 | ringing-screen sun glow pulse (loop) |

**Easing:**
- `standard` = cubic-bezier(0.2, 0, 0, 1)
- `decelerate` = (0, 0, 0, 1), for things entering
- `accelerate` = (0.3, 0, 1, 1), for things leaving

**Reduce Motion:** if it's on, replace scale/slide with fade, and stop `ringPulse`.

**Haptics** (`expo-haptics`):
| Event | Haptic |
|---|---|
| Toggle, chip, picker tick | selection |
| Button press (primary) | impact light |
| Correct mission answer | impact medium |
| Wrong answer | notification error |
| Mission complete / alarm dismissed / purchase success | notification success |
| Emergency hold progress | impact light every 1 s |

## 7. Iconography & illustration

- **Icons:** SF Symbols via `expo-symbols`. Weight `semibold`, size 20 / 24 / 28. Colour `text`, `textMuted`, or `brand` for highlighted/active icons. The tab bar uses filled symbols when selected.
- **Mission icons:** each mission has its own symbol in `brand`, shown in a 40×40 `surfaceAlt` tile with radius `md`:
  - Math: `function`
  - Typing: `keyboard`
  - Shake: `iphone.radiowaves.left.and.right`
  - Memory tiles: `square.grid.3x3.fill`
- **Illustration style:** flat geometric scenes built from horizon lines, a rising sun disc, stars and soft hills. Palette is limited to `brand` orange (sun), tints of it, `surface`/`surfaceAlt` greys and `primary` green (hills). No outlines, no gradients inside shapes except `ember` skies, no characters in v1.
- **Mascot (v4):** a small round sun with sleepy half-closed eyes. It's designed in v4.
- **Must not resemble the reference:**
  - no mascot in the reference's style (FLOWS #90–#104);
  - no 3D or glossy pet style;
  - no red alarm-clock icon;
  - no screenshot-traced layouts;
  - the app icon is the original bell mark in `docs/brand/` (§1), not a clock face.
- **Sounds:** an original or licensed (royalty-free, commercial) set. Names are descriptive ("Morning birds", "Rising chime"). Never reuse the reference's sound names.

## 8. Layout patterns

- **Tab bar (v1):** Alarm, Settings.
  - Background `surface` with a top `border` hairline.
  - Active item: icon in `brand`, label in `brandText`; inactive uses `textMuted`.
  - Label in `caption`.
- **Navigation:** large title (`title`) on the tab roots; standard title (`heading`) on pushed screens. Back is a chevron; modals close with an X at the top right.
- **Sticky CTA:** primary actions on onboarding, mission setup, editor Save and the paywall sit at the bottom, on a `background` fade.
- **Ringing screen:**
  - full-bleed `ember` gradient with an orange sun disc (pulsing with `ringPulse`);
  - clock in `numeric`, date in `heading`;
  - label in `body`;
  - "Start mission" uses primary `lg` + glow;
  - Snooze is secondary `lg`, with a count Tag (`pro`-style orange fill, black text).
- **Mission screens:**
  - top bar: progress ("2 of 3") on the left, countdown ring in the centre, mute toggle on the right;
  - the body in between;
  - "Emergency" is a ghost `sm` button at the bottom, using hold-to-confirm.

## 9. Accessibility

- **Dynamic Type:** all text tokens scale (`allowFontScaling` on). Layouts must reflow up to AX3, so test at the largest size. `numeric` caps at 1.3×. Rows grow in height; text is never truncated in a way that hides meaning.
- **Tap targets:** at least 44×44pt everywhere, including chips (36 visual height + hitSlop), the close X and steppers.
- **Contrast:** use only the token pairs in §2 marked ✅, and follow the §2 text rules (no green text in dark, no `brand` small text in light).
- **VoiceOver:**
  - Every icon-only button has a `accessibilityLabel` that names the action: "Delete alarm", not "Trash".
  - An AlarmCard reads as one element: "7:30 AM, Weekdays, Math mission, on". The toggle state is exposed as `accessibilityState`.
  - Time pickers expose adjustable actions (increment/decrement).
  - Mission screens announce the progress and the remaining time every 10 s.
  - Decorative illustrations use `accessibilityElementsHidden`.
- **Colour is never the only signal:** selected states also change border width or show a check; errors show icon + text.
- **Reduce Motion / Reduce Transparency:** respected (§6). Under Reduce Transparency the scrim is solid `background` at 0.9.
