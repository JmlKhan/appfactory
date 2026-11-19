# DESIGN — getup ("Daybreak")

> Status: **APPROVED by human 2026-11-19.** Source of truth for all UI. Tokens are mirrored exactly in `app/src/theme/theme.ts`.
> Builders: use tokens only. No raw hex, no raw font sizes, no magic spacing numbers in screens.

## 1. Brand

- **Name:** getup (always lowercase in the wordmark; "getup" in running text).
- **Concept:** the moment night turns into sunrise. The UI lives in deep indigo night; actions glow like the sun coming up.
- **Personality:** **bright, bold, encouraging.**
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

| Token | Dark (default) | Light | Use |
|---|---|---|---|
| background | `#0F1230` | `#FFF8F0` | screen background |
| surface | `#1A1F4A` | `#FFFFFF` | cards, sheets, list groups |
| surfaceAlt | `#252B5E` | `#FFEEDC` | inputs, chips, pressed rows, nested cards |
| text | `#F5F3FF` | `#14173A` | primary text |
| textMuted | `#A9ADD6` | `#555A80` | secondary text, captions |
| primary | `#FF9F1C` | `#FF9F1C` | primary button fill, active toggle, selected plan, progress fill |
| onPrimary | `#1A1206` | `#1A1206` | text/icons on primary |
| primaryText | `#FFB347` | `#A84E00` | primary-coloured **text/icons** on background (links, selected tab) |
| accent | `#FFC8A2` | `#E8743B` | decorative highlights, badges, illustration. **Light: not for text** (fails AA). |
| success | `#3DDC97` | `#17744B` | success states, "done" ticks |
| warning | `#FFD166` | `#8A5600` | warnings ("won't ring") |
| danger | `#FF6B6B` | `#B32D2D` | destructive actions, errors |
| onDanger | `#1A1206` | `#FFFFFF` | text on danger fill |
| border | `#2F3670` | `#EADFD2` | hairlines, card outlines (decorative, not text) |
| overlay | `rgba(6,8,24,0.64)` | `rgba(20,23,58,0.40)` | scrim behind sheets/modals |

**Gradients** (ringing, onboarding hero, paywall header, mission complete):
- `sunrise`: `#0F1230` → `#3A2A6B` → `#FF7A45` → `#FFB347` (top → bottom, stops 0 / 0.45 / 0.8 / 1)
- `dawn` (subtle, for cards): `#1A1F4A` → `#2A2560`

### Contrast check (text on background, ≥ 4.5:1 required)
| Pair | Dark | Light |
|---|---|---|
| text / background | 16.66 ✅ | 16.43 ✅ |
| text / surfaceAlt | 12.07 ✅ | 15.26 ✅ |
| textMuted / background | 8.38 ✅ | 6.31 ✅ |
| textMuted / surfaceAlt | 6.08 ✅ | 5.86 ✅ |
| primaryText / background | 10.26 ✅ | 5.31 ✅ |
| primaryText / surfaceAlt | 7.44 ✅ | 4.93 ✅ |
| onPrimary / primary | 9.03 ✅ | 9.03 ✅ |
| success / background | 10.34 ✅ | 5.48 ✅ |
| warning / background | 12.67 ✅ | 5.84 ✅ |
| danger / background | 6.58 ✅ | 5.99 ✅ |
| onDanger / danger | 6.68 ✅ | 6.31 ✅ |
| accent / background | 12.21 ✅ | 2.85 ❌ (decorative only in light) |

Text over the `sunrise` gradient is always `#F5F3FF` and sits in the top (indigo) 45%. A builder must never place text over the orange stops.

### Distinctness from reference
The reference uses near-black surfaces with a red/pink CTA (FLOWS §6). getup uses indigo surfaces with an amber CTA and dark text on buttons. We never use red as a primary or brand colour; red appears only in `danger`.

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
| glow | primary shadow `0 0 24 rgba(255,159,28,0.45)` | same, at 0.30 | only the primary CTA on ringing, paywall and onboarding |

Dark mode never uses black drop shadows. Depth comes from the surface colour.

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
  | ghost | transparent | `primaryText` | — |
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
- Native `Switch`. On = `primary` track, off = `surfaceAlt` (dark) / `border` (light) track, thumb `#FFFFFF`.
- Haptic: selection on change.
- The hit area is the whole row when it's inside a ListRow.

### TimePicker
- A wheel picker with hour and minute columns (plus AM/PM when the locale is 12h). The selected value is in `numeric` at 0.66 scale (48pt) on `text`; values above and below are `textMuted` at 60% opacity.
- A selection band behind the centre row: `surfaceAlt`, radius `md`.
- Helper text under the wheel: "Rings in 7 h 20 min" in `caption` / `primaryText`. It updates live.
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
  - Variants: `pro` (`accent` fill + `#1A1206` text), `new` (`success` fill + `#0F1230` text), `neutral` (`surfaceAlt` + `textMuted`).
  - Our Pro badge reads "Pro" in sentence case with a small sun icon. It must not look like the reference's "PRO" pill.

### EmptyState
- **Anatomy:** illustration 160×160 → title (`heading`) → body (`body`, `textMuted`, max 2 lines, centred) → optional primary Button `md`.
- Vertically centred in the available space.

### PaywallPlanCard
- **Anatomy:** radio indicator → plan name (`bodyStrong`) + sub-line (`caption`, e.g. "$3.33/mo, billed yearly") → price (`heading`, right-aligned) → optional Tag (e.g. "7-day free trial", `pro` variant) pinned to the top edge.
- **Default:** `surface`, 1px `border`, radius `lg`, padding `lg`.
- **Selected:** 2px `primary` border, `dawn` gradient background, radio filled `primary`.
- **Rules:** prices always come from RevenueCat (never hard-coded). The trial terms line is below the CTA in `caption`.

### ProgressBar
- **Linear:** height 6, radius `pill`, track `surfaceAlt`, fill `primary`. Used for onboarding "1/3" and mission progress. Onboarding shows a label "1 of 3" in `caption`.
- **Countdown ring** (mission time limit, Wake-up check): circular, stroke 6, track `surfaceAlt`. The fill is `primary`, and it switches to `warning` in the last 5 s. The number in the centre is `numericSm`.
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

- **Icons:** SF Symbols via `expo-symbols`. Weight `semibold`, size 20 / 24 / 28. Colour `text` or `textMuted`; `primaryText` when active. The tab bar uses filled symbols when selected.
- **Mission icons:** each mission has its own symbol, shown in a 40×40 `surfaceAlt` tile with radius `md`:
  - Math: `function`
  - Typing: `keyboard`
  - Shake: `iphone.radiowaves.left.and.right`
  - Memory tiles: `square.grid.3x3.fill`
- **Illustration style:** flat geometric scenes built from horizon lines, a rising sun disc, stars and soft hills. Palette is limited to indigo, `accent`, `primary` and `success`. No outlines, no gradients inside shapes except `sunrise` skies, no characters in v1.
- **Mascot (v4):** a small round sun with sleepy half-closed eyes. It's designed in v4.
- **Must not resemble the reference:**
  - no mascot in the reference's style (FLOWS #90–#104);
  - no 3D or glossy pet style;
  - no red alarm-clock icon;
  - no screenshot-traced layouts;
  - an original app icon: a sun disc rising over a horizon line on indigo.
- **Sounds:** an original or licensed (royalty-free, commercial) set. Names are descriptive ("Morning birds", "Rising chime"). Never reuse the reference's sound names.

## 8. Layout patterns

- **Tab bar (v1):** Alarm, Settings.
  - Background `surface` with a top `border` hairline.
  - Active item uses `primaryText`; inactive uses `textMuted`.
  - Label in `caption`.
- **Navigation:** large title (`title`) on the tab roots; standard title (`heading`) on pushed screens. Back is a chevron; modals close with an X at the top right.
- **Sticky CTA:** primary actions on onboarding, mission setup, editor Save and the paywall sit at the bottom, on a `background` fade.
- **Ringing screen:**
  - full-bleed `sunrise` gradient;
  - clock in `numeric`, date in `heading`;
  - label in `body`;
  - "Start mission" uses primary `lg` + glow;
  - Snooze is secondary `lg`, with a count Tag.
- **Mission screens:**
  - top bar: progress ("2 of 3") on the left, countdown ring in the centre, mute toggle on the right;
  - the body in between;
  - "Emergency" is a ghost `sm` button at the bottom, using hold-to-confirm.

## 9. Accessibility

- **Dynamic Type:** all text tokens scale (`allowFontScaling` on). Layouts must reflow up to AX3, so test at the largest size. `numeric` caps at 1.3×. Rows grow in height; text is never truncated in a way that hides meaning.
- **Tap targets:** at least 44×44pt everywhere, including chips (36 visual height + hitSlop), the close X and steppers.
- **Contrast:** use only the token pairs in §2. Don't put `accent` text on light backgrounds.
- **VoiceOver:**
  - Every icon-only button has a `accessibilityLabel` that names the action: "Delete alarm", not "Trash".
  - An AlarmCard reads as one element: "7:30 AM, Weekdays, Math mission, on". The toggle state is exposed as `accessibilityState`.
  - Time pickers expose adjustable actions (increment/decrement).
  - Mission screens announce the progress and the remaining time every 10 s.
  - Decorative illustrations use `accessibilityElementsHidden`.
- **Colour is never the only signal:** selected states also change border width or show a check; errors show icon + text.
- **Reduce Motion / Reduce Transparency:** respected (§6). Under Reduce Transparency the scrim is solid `background` at 0.9.
