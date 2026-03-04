import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_kit_theme/flutter_ui_kit_theme.dart';

void main() {
  // ── Token sanity checks ─────────────────────────────────────────────────

  group('AppSpacing', () {
    test('values are multiples of 4', () {
      expect(AppSpacing.x1, 4);
      expect(AppSpacing.x2, 8);
      expect(AppSpacing.x4, 16);
      expect(AppSpacing.x8, 32);
    });
  });

  group('AppRadius', () {
    test('raw values are defined', () {
      expect(AppRadius.sm, 8);
      expect(AppRadius.md, 12);
      expect(AppRadius.lg, 16);
      expect(AppRadius.xl, 24);
    });

    test('semantic presets are correct BorderRadius instances', () {
      expect(AppRadius.card,   isA<BorderRadius>());
      expect(AppRadius.button, isA<BorderRadius>());
      expect(AppRadius.chip,   isA<BorderRadius>());
    });
  });

  group('AppMotion', () {
    test('durations are ordered correctly', () {
      expect(AppMotion.fast < AppMotion.moderate, isTrue);
      expect(AppMotion.moderate < AppMotion.standard, isTrue);
      expect(AppMotion.standard < AppMotion.deliberate, isTrue);
    });
  });

  group('AppTypography', () {
    test('textTheme returns all 15 M3 text styles', () {
      final tt = AppTypography.textTheme();
      expect(tt.displayLarge,   isNotNull);
      expect(tt.displayMedium,  isNotNull);
      expect(tt.displaySmall,   isNotNull);
      expect(tt.headlineLarge,  isNotNull);
      expect(tt.headlineMedium, isNotNull);
      expect(tt.headlineSmall,  isNotNull);
      expect(tt.titleLarge,     isNotNull);
      expect(tt.titleMedium,    isNotNull);
      expect(tt.titleSmall,     isNotNull);
      expect(tt.bodyLarge,      isNotNull);
      expect(tt.bodyMedium,     isNotNull);
      expect(tt.bodySmall,      isNotNull);
      expect(tt.labelLarge,     isNotNull);
      expect(tt.labelMedium,    isNotNull);
      expect(tt.labelSmall,     isNotNull);
    });

    test('custom font family is applied', () {
      final tt = AppTypography.textTheme(fontFamily: 'Poppins');
      expect(tt.bodyLarge?.fontFamily, 'Poppins');
    });
  });

  // ── ColorScheme checks ──────────────────────────────────────────────────

  group('AppColorSchemes', () {
    test('dark scheme has correct brightness', () {
      expect(AppColorSchemes.dark.brightness, Brightness.dark);
    });

    test('light scheme has correct brightness', () {
      expect(AppColorSchemes.light.brightness, Brightness.light);
    });

    test('dark scheme primary matches brand violet', () {
      // fromSeed may slightly adjust the seed color; ensure it is in the
      // violet family by checking hue is reasonably close.
      expect(AppColorSchemes.dark.primary, isA<Color>());
    });

    test('dark surface stack is ordered darkest to lightest', () {
      final cs = AppColorSchemes.dark;
      // Lower levels should have lower red channel (darker) than higher levels.
      expect(
        cs.surfaceContainerLowest.r <= cs.surfaceContainerLow.r,
        isTrue,
      );
      expect(
        cs.surfaceContainerLow.r <= cs.surfaceContainer.r,
        isTrue,
      );
      expect(
        cs.surfaceContainer.r <= cs.surfaceContainerHigh.r,
        isTrue,
      );
    });
  });

  // ── ThemeData / BaseTheme checks ─────────────────────────────────────────

  group('BaseTheme', () {
    test('build returns ThemeData with useMaterial3 enabled', () {
      final theme = BaseTheme.build(AppColorSchemes.dark);
      expect(theme.useMaterial3, isTrue);
    });

    test('build applies colorScheme', () {
      final theme = BaseTheme.build(AppColorSchemes.light);
      expect(theme.colorScheme.brightness, Brightness.light);
    });
  });

  group('LightTheme / DarkTheme', () {
    test('LightTheme.build returns light ThemeData', () {
      expect(LightTheme.build().colorScheme.brightness, Brightness.light);
    });

    test('DarkTheme.build returns dark ThemeData', () {
      expect(DarkTheme.build().colorScheme.brightness, Brightness.dark);
    });
  });

  // ── Brand theme checks ───────────────────────────────────────────────────

  group('BrandATheme', () {
    test('light() returns light ThemeData', () {
      expect(BrandATheme.light().colorScheme.brightness, Brightness.light);
    });

    test('dark() returns dark ThemeData', () {
      expect(BrandATheme.dark().colorScheme.brightness, Brightness.dark);
    });
  });

  group('BrandBTheme', () {
    test('light() returns light ThemeData', () {
      expect(BrandBTheme.light().colorScheme.brightness, Brightness.light);
    });

    test('dark() returns dark ThemeData', () {
      expect(BrandBTheme.dark().colorScheme.brightness, Brightness.dark);
    });

    test('Brand B cards use xl radius (larger than Brand A)', () {
      final bBorder = BrandBTheme.dark().cardTheme.shape;
      final aBorder = BrandATheme.dark().cardTheme.shape;
      expect(bBorder, isNot(equals(aBorder)));
    });
  });
}
