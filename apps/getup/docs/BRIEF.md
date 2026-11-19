# BRIEF — getup

> Status: **APPROVED by human 2026-11-19 (v3).** Open questions in §7 taken as accepted where unanswered (prices hypothesis, iOS 26+, name "getup"); Q5 resolved: en default for getup only; AGENTS.md updated with the exception.
> Human decisions (2026-11-19):
> - Feature parity with the reference (Alarmy), delivered in **phases**. v1 = main functionality only.
> - **English first.** Default language is en. Other languages come in a later phase. This overrides the AGENTS.md default of uz for this app.
>
> Hard rule (AGENTS.md): copy **behaviour, not looks**. Name, mascot, art, icons, sounds, colours and all copy are original.
> `#n` = screen number in FLOWS.md. **(A)** = Architect assumption.

## 1. One-liner
An alarm clock that won't stop until you finish a wake-up mission, so you actually get out of bed.

## 2. Phases

| Phase | Theme | Contents (FLOWS refs) | Stack additions needed |
|---|---|---|---|
| **v1** | Core alarm | Onboarding, alarm list + editor, ringing, snooze, 4 missions, Wake-up check, settings basics, paywall (§3) | none |
| v2 | More missions + reports | Step, Squat, QR/Barcode, Photo, Missing symbol, Lucky ticket; quick + habit alarms (#40–#42); reports + daily history (F8); rating flow (#54–#55); multiple languages (ru, uz) | none |
| v3 | Morning | Morning tab: weather (#86–#88), morning feeling (#108–#110), quotes view/theme/share (#118–#123), daily tarot + money (#111–#115); wallpapers (#9–#10) | weather API (Open-Meteo) |
| v4 | Engagement | Points, pet care + evolution + collection (#89–#104), points → Pro pass shop (#116–#117), rewarded ads + ATT (#16–#17, #93–#94), promo banner | AdMob |
| v5 | Sleep | Sleep tracking, snore detection, sleep sounds + timer, sleep report (F7, #77) | background audio, SoundAnalysis |
| v6 | Account + hardcore | Sign in with Apple backup/sync (#24–#25, #126), Household item hunt with object detection (#27–#32), prevent uninstall (#129), self-penalty (#130) | CloudKit, Core ML, Family Controls entitlement, Stripe + backend (self-penalty, review risk) |

Each phase ships to the App Store on its own. Stack additions are approved phase by phase, when that phase starts.

## 3. v1 scope
1. **Onboarding** (F1, #1–#15): splash → 3 intro cards → setup steps 1/3 alarm time, 2/3 sound + volume + gentle wake-up, 3/3 wake-up mission (with mission explainer) → alarm + notification permission (soft prompt → iOS alerts) → "Almost ready" → paywall.
   - The intro cards use original, honest claims. No rank, download or medical claims.
   - The wallpaper step and ATT are not in v1.
2. **Alarm list** (F4, #26, #39, #58–#62):
   - alarm cards with a toggle; "rings in X" toast on toggle/save;
   - swipe-to-delete + confirmation;
   - card menu: Delete / Preview / Skip once / Duplicate;
   - top menu: Sort (Default / Active first) + Delete inactive;
   - FAB creates an alarm directly (there's no Quick/Habit menu in v1);
   - empty state.
3. **Alarm editor** (F3, #30, #36–#38):
   - label, time, repeat days;
   - up to 5 missions;
   - sound (original bundled set), volume, gentle wake-up ramp, vibration;
   - snooze: interval + max count;
   - Wake-up check toggle.
4. **Ringing + dismiss** (F5, #43, #48–#49):
   - AlarmKit alarm;
   - Snooze button with the remaining count; Start mission;
   - missions run in sequence;
   - "Good job" screen → greeting.
5. **Missions** (F6), each with a setup screen + Preview:
   - **Math:** difficulty 5 levels + 1–5 problems (#33, #46).
   - **Typing:** phrase count; English phrases are original.
   - **Shake:** shake count.
   - **Memory tiles:** grid size + rounds. The reference's version wasn't captured, so this is our design **(A)**.
   - **Mission chrome on every mission:** time limit (20 s default, #131), mute toggle, Emergency exit.
6. **Wake-up check** (#34–#35, #50–#52): set a follow-up delay → after dismissal, a countdown notification appears → tap to confirm, or the alarm rings again with its missions.
7. **Settings** (F12 subset):
   - Pro status + Restore;
   - advanced alarm settings (mission time limit);
   - theme (dark / light / system);
   - notification permission status;
   - about (version, terms, privacy, rate).
8. **Paywall + Pro** (F2, #18–#22): Yearly with a 7-day trial, Monthly, Lifetime → App Store sheet → success → Welcome Pro. Built on RevenueCat.
9. **Analytics:** PostHog without IDFA. Events: onboarding steps, alarm saved, ring, snooze, mission done, emergency, paywall view and purchase.
10. **i18n:** every string goes through i18n. v1 ships en only.

Tab bar in v1: **Alarm** + **Settings**. Tabs are added as their phases arrive. The full layout is 5 tabs (#26).

### v1 behaviour the teardown didn't capture: our definitions (A)
1. **Alarm/notification permission denied:** a banner on the alarm list with an "Open Settings" button. Alarms can be saved but are marked "won't ring".
2. **Paywall:** the X goes to the alarm list. Cancel or failure shows an inline message and stays on the paywall. Restore is on the paywall and in Settings.
3. **Locked item tapped by a free user:** opens the paywall.
4. **Wrong answer** (Math/Typing/Tiles): shake + retry. **Time limit runs out:** the alarm volume returns and the mission restarts.
5. **Snooze:** re-rings after the interval; the count decreases. At 0 the Snooze button is hidden.
6. **Emergency exit:** hold for 10 s → confirm → alarm stops. It is logged for v2 reports.
7. **Wake-up check, no tap before 0:00:** re-ring with the missions.

## 4. Monetization (v1; prices are hypotheses)
- **Free:** unlimited alarms; Math, Shake, Memory tiles; basic sounds (about 5); 1 mission per alarm; snooze settings.
- **Pro:** Typing; Wake-up check; all sounds; up to 5 missions per alarm. Later phases add their Pro missions and the snoring report. The reference lists these as Pro benefits (#22).
- **Plans:** same structure as the reference (#18): Yearly with a 7-day trial, Monthly, Lifetime.
  - Hypothesis: **Yearly $39.99, Monthly $6.99, Lifetime $79.99**.
  - Reference: $69.99 / $8.99 / $167.99.
- **Paywall placements:** end of onboarding (closable); tapping a Pro item; Settings → Pro.

## 5. Localization
- v1: **en only**, written natively and original (not the reference's copy). All strings still go through i18n.
- **Tone:** short, energetic, a bit playful, never shaming.
- **Formats:** time format follows the device locale (12h/24h). Week start follows the locale.
- v2 adds ru and uz.

## 6. App Store risks
- **4.1 Copycat** (main risk of a parity app):
  - original name, icon, mascot, illustrations, sounds and copy;
  - our own colour system (not the reference's dark + red/pink CTA);
  - layouts built from DESIGN.md tokens, not traced from screenshots;
  - the reference is never named in metadata.
- **4.3 Spam** (crowded alarm category): v1 needs one visible point of distinction in brand and identity. The design-system step must deliver it.
- **2.3 Accuracy:** no "No.1", download-count or medical claims.
- **3.1.2 Subscriptions:** the paywall shows price, period, trial terms, Restore and links, and can be closed.
- **AlarmKit (iOS 26+ only).** The spike must prove:
  1. the lock-screen Stop button can't bypass the mission, or what we do if it can;
  2. ringing in silent mode and Focus;
  3. repeat + skip-once scheduling;
  4. re-ring for snooze, mission timeout and Wake-up check.

## 7. Open questions for the human
1. Approve v1 = §3 and the phase split in §2?
2. Prices: hypothesis $39.99 / $6.99 / $79.99, or something else?
3. Is iOS 26+ only (AlarmKit) acceptable?
4. Is "getup" the final store name?
5. AGENTS.md says the default language is uz. Should I update it to en for getup only, or factory-wide?
