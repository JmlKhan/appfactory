# PROMPTS — getup mockups for Claude Design

> Architect, 2026-11-20. Inputs: BRIEF.md (approved v3), DESIGN.md (approved), FLOWS.md.
> **Copy language: English** (the factory default). v1 ships in en only. ru/uz arrive in v2, so the layouts must leave room for longer text (see checklist).
> **(A)** = Architect assumption. FLOWS.md has no capture for it, so it's our own design. Confirm or change it in Claude Design.

How to use this file:
1. Open claude.ai/design and start a new project called **getup**.
2. Paste **Prompt 0** and attach `docs/DESIGN.md` and `docs/brand/getup-icon.svg`. Check the design system it builds against DESIGN.md.
3. Paste **Prompt 1** (round 1). Review it with the checklist (§4). Iterate in Claude Design until you're happy.
4. Paste **Prompt 2** (round 2) in the same project, so it reuses the round-1 patterns.
5. Export with **Handoff to Claude Code** (or as standalone HTML/zip) into `apps/getup/docs/mockups/` and tell the Architect.

---

## Prompt 0 — design system

```
Set up the design system for "getup", an iOS alarm clock app that won't stop ringing until you finish a wake-up mission. The attached DESIGN.md is the source of truth. If anything below disagrees with it, DESIGN.md wins.

BRAND
- Name: getup, always lowercase in the wordmark. Concept "Daybreak": native iOS black/grey base; the brand orange is the rising sun, and green means "go".
- Personality: bright, bold, encouraging. Never shaming. At most one exclamation mark per screen.
- Default theme is dark. Light is a full, equal theme. Every component needs both.
- Must look original. No red/pink CTAs, no cyan/teal, no red alarm-clock icon, no 3D/glossy mascots, no ALL-CAPS "PRO" pills.

TWO ACCENTS, ONE JOB EACH
- primary GREEN #007E14 = action + selection: filled buttons (WHITE text), toggles on, selected chips/radios/plan cards, success ticks.
- brand ORANGE #E26150 = identity + attention: active tab, icons, highlights, Pro tag, ringing screen, progress bars, countdown rings. Text on filled orange is always BLACK.

COLOR TOKENS (dark / light)
background #000000 / #F2F2F7   (native iOS base)
surface #1C1C1E / #FFFFFF
surfaceAlt #2C2C2E / #E5E5EA
text #FFFFFF / #000000
textMuted #98989F / #636366
primary #007E14 / #007E14, onPrimary #FFFFFF
brand #E26150 / #E26150, onBrand #000000
brandText #E26150 / #B23A2A   (orange TEXT: links, ghost buttons, selected tab label, "Rings in…")
brandTint rgba(226,97,80,0.16) / rgba(226,97,80,0.12)   (soft highlight behind hero/selected cards)
success = primary #007E14
warning #FFD60A / #8A5600
danger #FF453A / #D70015, onDanger #000000 / #FFFFFF
border #38383A / #C6C6C8
overlay rgba(0,0,0,0.60) / rgba(0,0,0,0.30)
TEXT RULES (hard):
1. NO green text in dark mode (fails contrast for small text). In dark, success text is white with a green icon beside it.
2. NO #E26150 as small text in light mode. Use #B23A2A. Orange icons may use #E26150 in both themes.
3. Filled orange → black text. Filled green → white text. Never the reverse.
4. Errors always show an icon + text (red and orange are close in hue).
Gradient "ember" (ringing, onboarding hero, paywall header, mission complete), top → bottom:
- dark: #000000 (0) → #2A0F0B (0.5) → #E26150 (1). White text only in the top 50%; any text on the orange part is black.
- light: #FFFFFF (0) → #F9D3CD (0.5) → #E26150 (1). Black text.

TYPE
- Manrope (500/600/700/800) for UI. Unbounded (500/700) only for clock digits, big counters and the wordmark. Digits are tabular.
- numeric Unbounded 72/80 500 · numericSm Unbounded 40/48 500
- display Manrope 34/40 800 · title 28/34 700 · heading 20/26 700
- body 17/24 500 · bodyStrong 17/24 700 · label 16/20 700 (sentence case) · caption 13/18 600

SPACING (4-pt): xxs2 xs4 sm8 md12 lg16 xl20 xxl24 xxxl32 huge48 giant64. Screen gutter 16, card gap 12, section gap 24.
RADIUS: xs6 sm10 md14 lg20 xl28 pill999. Buttons 14, cards 20, sheet top corners 28, inputs 10, chips pill. Max 28 (except pill).
ELEVATION: dark mode uses no shadows; depth comes from surface colour (#000 → #1C1C1E → #2C2C2E; cards = surface + 1px border, sheets = surfaceAlt). Light mode uses soft black shadows at 8–12%. "glow" = green 0 0 24 rgba(0,126,20,0.55), only on the primary CTA of the ringing, paywall and onboarding screens.

COMPONENTS (build each, with default / pressed / disabled / loading states, light + dark)
- Button: primary (green fill, white text) / secondary (surfaceAlt) / ghost (brandText) / destructive (danger). Sizes lg 56 full width, md 48, sm 36 pill. One primary per screen.
- Card, and AlarmCard: time in numericSm with AM/PM in caption; label + repeat days in caption/textMuted; up to 5 mission icons (16pt); toggle on the right. Inactive alarm = muted text. Swipe-left Delete action (danger, 80 wide).
- ListRow (≥52 tall): optional 32×32 icon tile, title + subtitle, trailing value/chevron/toggle/check. Grouped inside a card with inset hairlines.
- Toggle (iOS switch: green #007E14 track when on).
- TimePicker wheel: hour/minute (+AM/PM). Selected value in Unbounded 48 on a surfaceAlt band (radius 14). Live helper below: "Rings in 7 h 20 min" in caption/brandText.
- Sheet: top radius 28, grabber 36×5, centred heading title, close X top right, medium/large detents.
- Chip (36 tall, pill; off surfaceAlt/text, on green/white); day chips are 40 circles with one letter.
- Tag (22 tall, pill, caption 700): pro (orange fill, black text, reads "Pro" + a small sun icon), new (green, white text), neutral.
- EmptyState: 160×160 illustration, heading, 2-line muted body, optional md button.
- PaywallPlanCard: radio, plan name + sub-line, price right-aligned, optional tag on the top edge. Selected = 2px green border + brandTint background + green radio with white check.
- ProgressBar: linear 6 tall + "1 of 3" caption. Linear fill is orange. Countdown ring: stroke 6, orange, turns warning-yellow in the last 5 s, number in the centre in numericSm.
- Toast (sheet-level surface, bottom, auto-dismiss), Banner (warning, inline on lists).
- Tab bar: 2 tabs, Alarm and Settings (SF Symbols alarm / gearshape, filled when selected). Active = orange icon + brandText label.

ICONS: SF Symbols, semibold, 20/24/28. Mission icons (orange) in 40×40 surfaceAlt tiles (radius 14): Math "function", Typing "keyboard", Shake "iphone.radiowaves.left.and.right", Memory tiles "square.grid.3x3.fill".
ILLUSTRATION: flat geometric scenes: horizon lines, a rising sun disc, stars, soft hills. Orange sun + its tints, greys from the surfaces, green hills only. No outlines, no characters.
APP ICON / LOGO: final, attach docs/brand/getup-icon.svg. A tilted orange (#E26150) ringing bell with two green (#007E14) sound arcs on black. Use it as-is; don't redraw it.
```

---

## Prompt 1 — round 1: the 7 screens that define the look

```
Using the getup design system, design these 7 key screens. iPhone artboards 393×852 with a real status bar and home indicator. Make every screen in BOTH dark and light. For screen 1 (Alarm list) and screen 4 (Ringing), make 2 distinct layout variations each (A and B), both in dark and light. Use only design-system tokens and components. All copy is English, short and encouraging; use the exact copy below. Use 12-hour time (US locale) in the mockups.

1. ALARM LIST (home, tab "Alarm")
Purpose: see all alarms at a glance and toggle them.
- Large title "Alarms", top-right "⋯" icon button (sort menu, not opened here).
- Next-alarm summary line under the title: "Next alarm in 7 h 20 min".
- 4 AlarmCards:
  • 6:30 AM · "Gym" · Mon Wed Fri · Math + Shake icons · ON
  • 7:15 AM · "Work" · Weekdays · Math + Typing + Memory tiles icons · ON
  • 9:00 AM · "Weekend" · Sat Sun · Shake icon · OFF (muted)
  • 11:45 PM · no label · Once · no mission · OFF
- Floating "+" button (primary, round, bottom right, above the tab bar), label "New alarm" for VoiceOver.
- Tab bar: Alarm (selected), Settings.
Variation A: classic list of cards. Variation B: a hero "next alarm" card at the top (brandTint background with an orange sun mark, big numericSm time, "Rings in 7 h 20 min") followed by the list.

2. CREATE / EDIT ALARM (pushed screen, title "New alarm", Save in a sticky bottom bar)
Purpose: set everything about one alarm on one scrolling screen.
- TimePicker at the top showing 7:15 AM, helper "Rings in 7 h 20 min".
- Repeat: 7 day chips S M T W T F S, with M–F selected; caption "Weekdays".
- Label row: "Work".
- Section "Wake-up missions": 3 filled slots (Math "Medium · 3 problems", Typing "2 phrases", Memory tiles "3×3 · 3 rounds"), each with a remove control, plus an "Add mission" row. Counter "3 of 5".
- Section "Sound": Sound "Rising chime" ›, Volume slider at 80%, Gentle wake-up "1 min" ›, Vibration toggle ON.
- Section "Snooze": Interval "5 min" ›, Max snoozes "3 times" ›.
- Section "Wake-up check": toggle ON, subtitle "Confirm you're up 5 min after dismissing". Pro tag next to the title.
- Sticky primary lg button "Save alarm".
State to also show: a second artboard scrolled to the bottom.

3. MISSION PICKER (sheet, large detent, title "Choose a mission")
Purpose: pick what you must do to turn the alarm off.
- Grid or list of 4 missions, each with its icon tile, name and one-line description:
  • Math — "Solve problems to prove your brain is on."
  • Typing — "Type a short phrase, letter for letter." — Pro tag
  • Shake — "Shake your phone until the bar fills."
  • Memory tiles — "Repeat the pattern of lit tiles."
- A free-user state: Typing shows a lock + Pro tag (tapping it opens the paywall).
- Footer caption: "Free plan: 1 mission per alarm. Pro: up to 5."

4. ALARM RINGING (full-screen, in-app)
Purpose: impossible to ignore, easy to act on while half-asleep.
- Full-bleed ember gradient; a pulsing orange sun disc in the lower part. White text only in the top half (dark); black text in light.
- Clock "7:15" in numeric with "AM" small, date "Thursday, November 20" in heading, label "Work" in body. All in the top 45%.
- Primary lg button with glow: "Start mission".
- Secondary lg button: "Snooze · 5 min" with a count tag "3 left".
- Small caption under the buttons: "3 missions to turn this off".
Variation A: buttons stacked at the bottom. Variation B: a different composition of your choice (e.g. a big round "Start mission" sun button), still reachable with one thumb.
State to also show: Snooze hidden when 0 snoozes are left (caption "No snoozes left").

5. MISSION IN PROGRESS — MATH (full screen)
Purpose: wake the brain up; clear, big, hard to mis-tap.
- Top bar: "1 of 3" progress on the left, countdown ring "14" in the centre, mute toggle (speaker icon) on the right.
- Problem card: "27 + 48 × 2 = ?" in numericSm.
- Answer: number keypad (3×4, big keys ≥ 64pt) with an input field showing "12" and a primary "Check" button. (A: the reference used 3 answer choices; we use a keypad.)
- Bottom: ghost sm button "Emergency exit" with the hint "Hold 10 s".
States to also show: (a) wrong answer: field shakes, danger text "Not quite. Try again." with an icon; (b) countdown in its last 5 s (ring turns warning-yellow).

6. WAKE-UP SUCCESS (full screen, after the last mission)
Purpose: reward the user; make getting up feel good.
- Ember gradient with the sun fully "risen" above the horizon, green success tick.
- Display "You're up. Nice work." 
- Body: "3 missions done in 1 min 42 s."
- Then a greeting block: "Good morning" + "Thursday, November 20".
- Wake-up check note (when on): "We'll check on you in 5 min." with a small countdown ring icon.
- Primary lg button "Start my day".

7. PAYWALL (full-screen modal, closable)
Purpose: an honest, clear upgrade at the end of onboarding and on locked items.
- Close X top right (always visible).
- Header on the ember gradient: wordmark "getup" + "Pro", display title "Wake up for real", subtitle "Unlock every mission and sound."
- Benefits list with check icons: "All missions, including Typing" · "Up to 5 missions per alarm" · "Wake-up check" · "Every alarm sound".
- 3 PaywallPlanCards: Yearly $39.99 "$3.33/mo, billed yearly" with tag "7-day free trial" (selected) · Monthly $6.99 "Billed monthly" · Lifetime $79.99 "Pay once".
- Primary lg button with glow: "Start free trial".
- Caption below: "7 days free, then $39.99/year. Cancel anytime in Settings."
- Footer ghost links: "Restore purchases" · "Terms" · "Privacy".
States to also show: Monthly selected (CTA "Continue", trial line hidden); the inline error "Purchase didn't go through. You weren't charged." under the CTA.
No fake urgency, no strike-through prices, no "% OFF", no ratings or download claims.
```

---

## Prompt 2 — round 2: every remaining v1 screen and state

```
Continue the getup project. Reuse the round-1 screens, components and patterns exactly (same nav bars, cards, sticky CTA, sheets, mission chrome). iPhone 393×852, dark AND light for every screen. English copy as given; keep headlines ≤ 8 words.

A. ONBOARDING (progress bar "1 of 3" etc. on setup steps; sticky primary lg CTA with glow)
A1 Splash — black (light: #F2F2F7) background, the bell logo from docs/brand, wordmark "getup".
A2–A4 Intro cards (dots 1/3, 2/3, 3/3; flat sun-and-horizon illustrations; "Skip" ghost top right on A2–A3):
  A2 "Alarms that make you move" / "Turn it off by doing a quick mission, not by tapping." / Next
  A3 "Snooze, but on your terms" / "Set how long and how often. Then it's mission time." / Next
  A4 "Mornings, one win at a time" / "Start each day with something done." / Get started
A5 Step 1 of 3 — "When do you want to get up?" TimePicker (7:00 AM), helper "Rings in 8 h 5 min", CTA Next.
A6 Step 2 of 3 — "Pick a sound you'll hear" — chips (All · Calm · Bright · Loud) + radio list of sounds with play buttons: Rising chime (selected), Morning birds, Soft piano, Bright bells, Big brass (Pro tag), Rooftop rooster (Pro tag). CTA Next.
A7 Volume sheet over A6 — "Volume" slider 80%, "Gentle wake-up" toggle with subtitle "Starts quiet, gets louder over 1 min", secondary "Preview", primary "Done".
A8 Step 3 of 3 — "How will you prove you're up?" — the 4 missions as selectable cards (Math selected) + "No mission for now" ghost link. CTA Next.
A9 Mission explainer sheet (Math) — illustration of a problem card, "Math mission", "Solve 3 problems to turn off the alarm. Wrong answers just mean another try.", difficulty preview "Medium", primary "Sounds good".
A10 Permission soft prompt — illustration (bell + sun), "Let getup ring", body "getup needs alarm and notification access to wake you, even in silent mode.", two rows with icons: "Alarms" · "Notifications", primary "Allow", ghost "Not now". Also show the iOS system alert over it (dimmed).
A11 "Almost ready" — ring progress at 100%, "Your first alarm is set", summary card "7:00 AM · Math mission · Rising chime", CTA Continue → paywall.

B. PAYWALL & PRO
B1 App Store confirmation sheet over the paywall (native-looking; just show it dimmed over the paywall).
B2 Purchase success — native alert "You're all set" / "getup Pro is active." / OK.
B3 Welcome Pro — sun-rise illustration, display "Pro is on", list of what's unlocked (same 4 benefits, ticks in success), primary "Continue".
B4 Paywall loading state (CTA spinner) and "Restoring…" state; restore result "Nothing to restore on this Apple ID."

C. ALARM LIST STATES (all on the round-1 list)
C1 Empty state — illustration (moon over a quiet horizon), heading "No alarms yet", body "Set one and we'll get you up.", primary md "Set an alarm".
C2 Toast after save/toggle — "Set. Rings in 7 h 20 min." ; repeat variant "Set. Next: Friday 6:30 AM."
C3 Swipe left on a card — red Delete action revealed.
C4 Delete confirmation — native iOS alert "Delete this alarm?" / "This can't be undone." / Delete (destructive) · Cancel.
C5 Card "⋯" menu (native context menu style): Preview · Skip once · Duplicate · Delete (red).
C6 Skipped card — tag "Skips Thu, Nov 20" on the card.
C7 Top "⋯" menu: Sort by ✓ Default / Active first · divider · "Delete inactive alarms" (red) + its confirm alert "Delete 2 inactive alarms?".
C8 Permission denied — warning banner at the top of the list: "Alarms can't ring. Turn on notifications and alarms in Settings." + secondary sm "Open Settings"; affected cards show a warning tag "Won't ring".

D. ALARM EDITOR SUB-SCREENS
D1 Sound list (pushed) — category chips + list with play buttons, selected check, Pro tags; free user tapping a Pro sound → paywall.
D2 Gentle wake-up picker (sheet, radio): Off · 30 s · 1 min (selected) · 3 min · 5 min. (A: options)
D3 Snooze interval picker (sheet, radio): 1 · 3 · 5 (selected) · 10 · 15 min. Max snoozes: 1 · 3 (selected) · 5 · Unlimited. (A: options)
D4 Label edit — text field "Work", 30 char limit counter.
D5 Wake-up check explainer sheet — illustration, "Wake-up check", "After you turn the alarm off, we'll ask you to confirm you're still up. Miss it and the alarm rings again.", primary "Turn it on", ghost "Not now". Pro tag.
D6 Wake-up check settings (pushed, radio): "Check after" 3 min · 5 min (selected) · 10 min; caption "You'll have 60 s to confirm." (A: options and window)
D7 Editor with 0 missions — empty slot "Add a mission so the alarm can't be ignored", counter "0 of 5"; free user with 1 mission: "Add mission" shows the Pro tag.
D8 Unsaved changes — native alert "Discard changes?" / Discard · Keep editing.

E. MISSION SETUP (pushed from the picker; preview area at the top, config rows, sticky bar: secondary "Preview" + primary "Done")
E1 Math — difficulty slider with 5 stops: Easy "3 + 8" · Medium "27 + 48" · Hard "34 × 7 + 19" · Very hard "128 × 6 − 47" · Brutal "(47 × 13) + 289 − 64" (A: names/examples), with a live example card; "Problems" stepper 1–5 (3).
E2 Typing — "Phrases" stepper 1–5 (2), preview of an example phrase "Today I get up and go." (A: phrases are our own).
E3 Shake — "Shakes" stepper (30) with options 10–100, preview of the shake bar.
E4 Memory tiles — "Grid" chips 3×3 / 4×4, "Rounds" stepper 1–5 (3), preview of a lit pattern. (A: whole mission design)

F. MISSIONS IN PROGRESS (same chrome as round-1 Math: "n of 3", countdown ring, mute toggle, "Emergency exit")
F1 Typing — target phrase in a card; typed letters turn success colour, wrong letter in danger; iOS keyboard visible.
F2 Shake — huge counter "18 / 30" in numeric, circular fill, caption "Keep shaking".
F3 Memory tiles — 3×3 grid; state a: "Watch" (tiles light up in sequence, orange), state b: "Your turn" (user taps), state c: wrong tile → danger flash + "Not that one. Watch again."
F4 Time's up — overlay "Time's up. The alarm is back on." then the mission restarts (show the overlay).
F5 Muted state — mute toggle on, caption "Muted for 30 s". (A: mute duration)
F6 Emergency hold — the button fills over 10 s with a ring, caption "Keep holding… 6 s".
F7 Emergency confirm — native alert "Stop without a mission?" / "This will show in your history." / Stop alarm (destructive) · Keep going.
F8 Mission done between missions — short success state "1 down, 2 to go" before the next mission.

G. AFTER THE ALARM
G1 Snoozed — full screen on black with a dim orange sun low on the horizon: "Snoozed", clock showing the re-ring time "Rings again at 7:20 AM", "2 snoozes left", primary "I'm up — start mission". (A: this screen wasn't captured)
G2 Wake-up check countdown — in-app screen: countdown ring "4:32", heading "Still up?", body "Confirm before the timer ends or the alarm rings again.", primary "I'm up".
G3 Wake-up check notification — show what the iOS notification looks like on the lock screen: "getup · Still up? Tap to confirm within 60 s."
G4 Wake-up check confirmed — success tick, "Confirmed. Have a great day."

H. SETTINGS (tab "Settings", large title, grouped list cards)
H1 Settings main —
  Card: getup Pro row (free: "Get Pro" with Pro tag + chevron; Pro: "Pro · Yearly, renews Nov 20, 2027") · "Restore purchases".
  Card "Alarms": "Mission time limit" 20 s › · "Notifications" status value "On" / warning "Off" ›.
  Card "Appearance": "Theme" Dark ›.
  Card "About": "Rate getup" · "Terms of use" · "Privacy policy" · "Version 1.0.0 (1)".
H2 Mission time limit (radio): 10 s · 20 s (selected, "default") · 30 s · 60 s; caption "When time runs out, the alarm gets loud again." (A: options)
H3 Theme (radio with small previews): System · Dark (selected) · Light.
H4 Notifications — status card "Notifications are off" with warning icon + secondary "Open Settings"; and the "On" version with a success tick.
H5 Pro status (Pro user) — plan, renewal date, "Manage subscription" (opens App Store), "Restore purchases".

Also deliver a SCREEN LIST page in the project: every artboard name, its route (e.g. /alarms, /alarm/[id]/edit, /mission/math/setup, /ringing, /paywall), and which round it came from.
```

---

## 4. Review checklist (per screen, in Claude Design before approving)

**Every screen**
1. **Hierarchy:** one obvious primary action, and at most one primary button. Is the most important information the largest thing on the screen?
2. **Tap targets:** every tappable element is at least 44×44pt, including chips, the close X, steppers, keypad keys (≥64) and day circles.
3. **Contrast:** only DESIGN.md token pairs are used. No green text in dark mode, no #E26150 small text in light mode, no white text on orange.
4. **Both themes:** the dark and light artboards both exist and both read well.
5. **Text length:** English headlines are ≤ 8 words. Every text block can grow ~40% (ru/uz in v2) and still fit without truncation. Check the plan cards, buttons, chips and the day/value columns in rows.
6. **Dynamic Type:** imagine the text at 1.5×. Would the layout reflow instead of clipping? The clock is capped at 1.3×.
7. **Tokens only:** no stray colours, font sizes or radii outside DESIGN.md. Note any new component in the screen list.
8. **Copy tone:** encouraging, never shaming, no fake urgency, no unprovable claims, at most one "!" per screen.
9. **Originality (App Store 4.1):** nothing looks like the reference app. No red/pink CTA, no near-black surfaces, no ALL-CAPS PRO pill, no red alarm-clock icon, no traced layouts, none of the reference's sound names or copy.

**Specific screens**
10. **Ringing:** readable at arm's length half-asleep, and the "Start mission" button is reachable with one thumb.
11. **Missions:** progress, timer and Emergency exit are visible but don't compete with the task. A wrong answer shows an icon + text, not just a colour.
12. **Paywall (3.1.2):** price, period and trial terms are visible near the CTA. Restore, Terms, Privacy and the close X are all visible without scrolling, or clearly reachable.
13. **States:** empty, denied, error, loading and "Pro-locked" states exist wherever round 2 lists them.

When round 1 looks right, approve it in Claude Design and run Prompt 2. When round 2 is done, export the handoff into `apps/getup/docs/mockups/` and tell the Architect, who then files NOTES.md.
