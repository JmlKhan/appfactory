// getup design tokens — mirrors docs/DESIGN.md exactly. Do not add raw values in screens.

export type ColorScheme = {
  background: string;
  surface: string;
  surfaceAlt: string;
  text: string;
  textMuted: string;
  primary: string; // green — action + selection
  onPrimary: string;
  brand: string; // orange — identity + attention
  onBrand: string;
  brandText: string;
  brandTint: string;
  success: string;
  warning: string;
  danger: string;
  onDanger: string;
  border: string;
  overlay: string;
};

export const colors: { light: ColorScheme; dark: ColorScheme } = {
  // Dark: never use primary (green) as text — 3.99:1 on black. Success text uses `text`.
  dark: {
    background: '#000000',
    surface: '#1C1C1E',
    surfaceAlt: '#2C2C2E',
    text: '#FFFFFF',
    textMuted: '#98989F',
    primary: '#007E14',
    onPrimary: '#FFFFFF',
    brand: '#E26150',
    onBrand: '#000000',
    brandText: '#E26150', // not on surfaceAlt (4.02:1)
    brandTint: 'rgba(226,97,80,0.16)',
    success: '#007E14',
    warning: '#FFD60A',
    danger: '#FF453A',
    onDanger: '#000000',
    border: '#38383A',
    overlay: 'rgba(0,0,0,0.60)',
  },
  // Light: never use brand (orange) as small text — 3.47:1 on white. Use brandText.
  light: {
    background: '#F2F2F7',
    surface: '#FFFFFF',
    surfaceAlt: '#E5E5EA',
    text: '#000000',
    textMuted: '#636366',
    primary: '#007E14',
    onPrimary: '#FFFFFF',
    brand: '#E26150',
    onBrand: '#000000',
    brandText: '#B23A2A',
    brandTint: 'rgba(226,97,80,0.12)',
    success: '#007E14',
    warning: '#8A5600',
    danger: '#D70015',
    onDanger: '#FFFFFF',
    border: '#C6C6C8',
    overlay: 'rgba(0,0,0,0.30)',
  },
};

export const gradients = {
  ember: {
    dark: { colors: ['#000000', '#2A0F0B', '#E26150'] as const, locations: [0, 0.5, 1] as const },
    light: { colors: ['#FFFFFF', '#F9D3CD', '#E26150'] as const, locations: [0, 0.5, 1] as const },
  },
};

// Font family names as registered by @expo-google-fonts/manrope and /unbounded.
export const fonts = {
  ui500: 'Manrope_500Medium',
  ui600: 'Manrope_600SemiBold',
  ui700: 'Manrope_700Bold',
  ui800: 'Manrope_800ExtraBold',
  num500: 'Unbounded_500Medium',
  num700: 'Unbounded_700Bold',
} as const;

export type TextStyleToken = {
  fontFamily: string;
  fontSize: number;
  fontWeight: '500' | '600' | '700' | '800';
  lineHeight: number;
  fontVariant?: ['tabular-nums'];
  maxFontSizeMultiplier?: number;
};

export const typography: Record<
  'numeric' | 'numericSm' | 'display' | 'title' | 'heading' | 'body' | 'bodyStrong' | 'label' | 'caption',
  TextStyleToken
> = {
  numeric: { fontFamily: fonts.num500, fontSize: 72, fontWeight: '500', lineHeight: 80, fontVariant: ['tabular-nums'], maxFontSizeMultiplier: 1.3 },
  numericSm: { fontFamily: fonts.num500, fontSize: 40, fontWeight: '500', lineHeight: 48, fontVariant: ['tabular-nums'] },
  display: { fontFamily: fonts.ui800, fontSize: 34, fontWeight: '800', lineHeight: 40 },
  title: { fontFamily: fonts.ui700, fontSize: 28, fontWeight: '700', lineHeight: 34 },
  heading: { fontFamily: fonts.ui700, fontSize: 20, fontWeight: '700', lineHeight: 26 },
  body: { fontFamily: fonts.ui500, fontSize: 17, fontWeight: '500', lineHeight: 24 },
  bodyStrong: { fontFamily: fonts.ui700, fontSize: 17, fontWeight: '700', lineHeight: 24 },
  label: { fontFamily: fonts.ui700, fontSize: 16, fontWeight: '700', lineHeight: 20 },
  caption: { fontFamily: fonts.ui600, fontSize: 13, fontWeight: '600', lineHeight: 18 },
};

export const spacing = {
  xxs: 2,
  xs: 4,
  sm: 8,
  md: 12,
  lg: 16,
  xl: 20,
  xxl: 24,
  xxxl: 32,
  huge: 48,
  giant: 64,
} as const;

export const radius = {
  xs: 6,
  sm: 10,
  md: 14,
  lg: 20,
  xl: 28,
  pill: 999,
} as const;

type Shadow = {
  shadowColor: string;
  shadowOffset: { width: number; height: number };
  shadowOpacity: number;
  shadowRadius: number;
};

const none: Shadow = { shadowColor: '#000000', shadowOffset: { width: 0, height: 0 }, shadowOpacity: 0, shadowRadius: 0 };

// Dark mode: no drop shadows — depth comes from surface colours (+ 1px border at level 1).
export const shadow: { light: Record<'level0' | 'level1' | 'level2' | 'glow', Shadow>; dark: Record<'level0' | 'level1' | 'level2' | 'glow', Shadow> } = {
  light: {
    level0: none,
    level1: { shadowColor: '#000000', shadowOffset: { width: 0, height: 1 }, shadowOpacity: 0.08, shadowRadius: 3 },
    level2: { shadowColor: '#000000', shadowOffset: { width: 0, height: 6 }, shadowOpacity: 0.12, shadowRadius: 16 },
    glow: { shadowColor: '#007E14', shadowOffset: { width: 0, height: 0 }, shadowOpacity: 0.35, shadowRadius: 24 },
  },
  dark: {
    level0: none,
    level1: none,
    level2: none,
    glow: { shadowColor: '#007E14', shadowOffset: { width: 0, height: 0 }, shadowOpacity: 0.55, shadowRadius: 24 },
  },
};

export const motion = {
  duration: {
    fast: 120,
    base: 240,
    slow: 400,
    ringPulse: 1600,
  },
  // cubic-bezier control points [x1, y1, x2, y2] — use with Easing.bezier(...)
  easing: {
    standard: [0.2, 0, 0, 1] as const,
    decelerate: [0, 0, 0, 1] as const,
    accelerate: [0.3, 0, 1, 1] as const,
  },
  pressed: { opacity: 0.85, scale: 0.98 },
  disabledOpacity: 0.4,
} as const;

export const layout = {
  gutter: spacing.lg,
  minTapTarget: 44,
  buttonHeight: { lg: 56, md: 48, sm: 36 },
} as const;

export const theme = { colors, gradients, fonts, typography, spacing, radius, shadow, motion, layout };
export default theme;
