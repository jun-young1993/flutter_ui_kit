import 'package:flutter/material.dart';
import 'package:flutter_ui_kit_theme/flutter_ui_kit_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final controller = DsThemeController();
  await controller.init();
  runApp(ShowcaseApp(controller: controller));
}

// ═══════════════════════════════════════════════════════════════════════════════
// App root — DsThemeController owns ThemeMode + Brand state with persistence
// ═══════════════════════════════════════════════════════════════════════════════

class ShowcaseApp extends StatelessWidget {
  const ShowcaseApp({super.key, required this.controller});

  final DsThemeController controller;

  @override
  Widget build(BuildContext context) {
    return DsThemeBuilder(
      controller: controller,
      builder: (light, dark, mode) => MaterialApp(
        title: 'Design System Showcase',
        debugShowCheckedModeBanner: false,
        theme: light,
        darkTheme: dark,
        themeMode: mode,
        home: _ShowcasePage(controller: controller),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// Showcase page
// ═══════════════════════════════════════════════════════════════════════════════

class _ShowcasePage extends StatelessWidget {
  const _ShowcasePage({required this.controller});

  final DsThemeController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Design System'),
        actions: [
          DsBrandToggle(
            brand: controller.brand,
            onChanged: controller.setBrand,
          ),
          const SizedBox(width: AppSpacing.x1),
          DsThemeToggle(
            themeMode: controller.themeMode,
            onChanged: controller.setThemeMode,
            sizedBoxDimension: 40,
            iconSize: 18,
          ),
          const SizedBox(width: AppSpacing.x1),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.x2,
          vertical: AppSpacing.x2,
        ),
        children: [
          _ThemeModeIndicator(themeMode: controller.themeMode),
          const SizedBox(height: AppSpacing.x3),

          const _SectionHeader(
            title: 'Surface Levels',
            subtitle: 'M3 layered surface container hierarchy',
          ),
          const SizedBox(height: AppSpacing.x1_5),
          const _SurfaceSection(),
          const SizedBox(height: AppSpacing.x4),

          const _SectionHeader(
            title: 'Buttons',
            subtitle: 'filled · outlined · ghost + loading state',
          ),
          const SizedBox(height: AppSpacing.x1_5),
          const _ButtonSection(),
          const SizedBox(height: AppSpacing.x4),

          const _SectionHeader(
            title: 'Cards',
            subtitle: 'DsCard — surface-aware, tap ripple',
          ),
          const SizedBox(height: AppSpacing.x1_5),
          const _CardSection(),
          const SizedBox(height: AppSpacing.x4),

          const _SectionHeader(
            title: 'Typography',
            subtitle: 'Material 3 type scale — 12 styles',
          ),
          const SizedBox(height: AppSpacing.x1_5),
          const _TypographySection(),
          const SizedBox(height: AppSpacing.x4),

          const _SectionHeader(
            title: 'Color Scheme',
            subtitle: 'All ColorScheme roles from the active brand',
          ),
          const SizedBox(height: AppSpacing.x1_5),
          const _ColorSchemeSection(),
          const SizedBox(height: AppSpacing.x6),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// Shared helpers
// ═══════════════════════════════════════════════════════════════════════════════

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, this.subtitle});

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: tt.titleMedium),
        if (subtitle != null) ...[
          const SizedBox(height: AppSpacing.x0_5),
          Text(
            subtitle!,
            style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
          ),
        ],
        const SizedBox(height: AppSpacing.x1),
        Divider(color: cs.outlineVariant, height: 1, thickness: 1),
      ],
    );
  }
}

// ─── Theme mode indicator ─────────────────────────────────────────────────────

class _ThemeModeIndicator extends StatelessWidget {
  const _ThemeModeIndicator({required this.themeMode});

  final ThemeMode themeMode;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final platformBrightness = MediaQuery.platformBrightnessOf(context);

    final (icon, label, sub) = switch (themeMode) {
      ThemeMode.light => (
          Icons.wb_sunny_rounded,
          '라이트 모드',
          '항상 밝은 테마 사용',
        ),
      ThemeMode.dark => (
          Icons.nightlight_rounded,
          '다크 모드',
          '항상 어두운 테마 사용',
        ),
      ThemeMode.system => (
          Icons.brightness_auto_rounded,
          '시스템 기본값',
          '현재 ${platformBrightness == Brightness.dark ? "다크 ☽" : "라이트 ☀"} 모드 적용 중',
        ),
    };

    return DsSurface(
      level: SurfaceLevel.low,
      padding: const EdgeInsets.all(AppSpacing.x2),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: cs.primaryContainer,
              borderRadius: AppRadius.allMd,
            ),
            child: Icon(icon, color: cs.onPrimaryContainer, size: 20),
          ),
          const SizedBox(width: AppSpacing.x1_5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: tt.titleSmall),
                Text(
                  sub,
                  style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                ),
              ],
            ),
          ),
          Text(
            '활성',
            style: tt.labelSmall?.copyWith(color: cs.primary),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// Section: Surface Levels
// ═══════════════════════════════════════════════════════════════════════════════

class _SurfaceSection extends StatelessWidget {
  const _SurfaceSection();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    final levels = [
      (SurfaceLevel.lowest,  'lowest',  cs.surfaceContainerLowest,  '가장 어두운 — 구분 영역'),
      (SurfaceLevel.low,     'low',     cs.surfaceContainerLow,     '카드, 리스트 타일'),
      (SurfaceLevel.base,    'base',    cs.surfaceContainer,        '내비게이션 바, 사이드바'),
      (SurfaceLevel.high,    'high',    cs.surfaceContainerHigh,    '다이얼로그, 팝오버'),
      (SurfaceLevel.highest, 'highest', cs.surfaceContainerHighest, '인풋 필드, 툴팁'),
    ];

    return Column(
      children: levels.indexed.map((entry) {
        final (i, row) = entry;
        final (level, name, color, desc) = row;

        return Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.x1),
          child: DsSurface(
            level: level,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.x2,
              vertical: AppSpacing.x1_5,
            ),
            child: Row(
              children: [
                Container(
                  width: 26,
                  height: 26,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: cs.primary.withValues(alpha: 0.15),
                    borderRadius: AppRadius.allXs,
                  ),
                  child: Text(
                    '${i + 1}',
                    style: tt.labelSmall?.copyWith(color: cs.primary),
                  ),
                ),
                const SizedBox(width: AppSpacing.x1_5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: tt.labelLarge?.copyWith(color: cs.onSurface),
                      ),
                      Text(
                        desc,
                        style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: AppRadius.allXs,
                    border: Border.all(
                      color: cs.outline.withValues(alpha: 0.4),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// Section: Buttons
// ═══════════════════════════════════════════════════════════════════════════════

class _ButtonSection extends StatefulWidget {
  const _ButtonSection();

  @override
  State<_ButtonSection> createState() => _ButtonSectionState();
}

class _ButtonSectionState extends State<_ButtonSection> {
  bool _loading = false;

  Future<void> _simulateLoad() async {
    setState(() => _loading = true);
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Variants
        Wrap(
          spacing: AppSpacing.x1_5,
          runSpacing: AppSpacing.x1_5,
          children: [
            DsButton(label: 'Filled', onPressed: () {}),
            DsButton(
              label: 'Outlined',
              variant: DsButtonVariant.outlined,
              onPressed: () {},
            ),
            DsButton(
              label: 'Ghost',
              variant: DsButtonVariant.ghost,
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.x1_5),

        // With icons
        Wrap(
          spacing: AppSpacing.x1_5,
          runSpacing: AppSpacing.x1_5,
          children: [
            DsButton(
              label: 'Save',
              icon: const Icon(Icons.bookmark_outline, size: 18),
              onPressed: () {},
            ),
            DsButton(
              label: 'Share',
              variant: DsButtonVariant.outlined,
              icon: const Icon(Icons.share_outlined, size: 18),
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.x1_5),

        // Disabled
        Wrap(
          spacing: AppSpacing.x1_5,
          children: [
            DsButton(label: 'Disabled', onPressed: null),
            DsButton(
              label: 'Disabled',
              variant: DsButtonVariant.outlined,
              onPressed: null,
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.x1_5),

        // Loading (expanded)
        DsButton(
          label: '탭해서 로딩 테스트 (2초)',
          onPressed: _loading ? null : _simulateLoad,
          isLoading: _loading,
          isExpanded: true,
        ),
        const SizedBox(height: AppSpacing.x1),
        DsButton(
          label: '탭해서 로딩 테스트 (2초)',
          variant: DsButtonVariant.outlined,
          onPressed: _loading ? null : _simulateLoad,
          isLoading: _loading,
          isExpanded: true,
        ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// Section: Cards
// ═══════════════════════════════════════════════════════════════════════════════

class _CardSection extends StatelessWidget {
  const _CardSection();

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return Column(
      children: [
        // Profile card
        DsCard(
          level: SurfaceLevel.low,
          onTap: () {},
          child: Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: cs.primaryContainer,
                child: Icon(Icons.person_rounded, color: cs.onPrimaryContainer),
              ),
              const SizedBox(width: AppSpacing.x1_5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Alice Kim', style: tt.titleSmall),
                    Text(
                      'Premium Member · SurfaceLevel.low',
                      style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: cs.onSurfaceVariant),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.x1_5),

        // Stat cards row
        Row(
          children: [
            _StatCard(
              icon: Icons.trending_up_rounded,
              iconColor: cs.primary,
              value: '2,481',
              label: 'Views',
            ),
            const SizedBox(width: AppSpacing.x1_5),
            _StatCard(
              icon: Icons.favorite_rounded,
              iconColor: cs.error,
              value: '348',
              label: 'Likes',
            ),
            const SizedBox(width: AppSpacing.x1_5),
            _StatCard(
              icon: Icons.star_rounded,
              iconColor: cs.tertiary,
              value: '4.9',
              label: 'Rating',
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.x1_5),

        // Action card
        DsCard(
          level: SurfaceLevel.base,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text('Design System v0.1', style: tt.titleSmall),
                  ),
                  Chip(
                    label: const Text('New'),
                    padding: EdgeInsets.zero,
                    labelPadding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.x1,
                    ),
                    visualDensity: VisualDensity.compact,
                    backgroundColor: cs.primaryContainer,
                    labelStyle: tt.labelSmall?.copyWith(
                      color: cs.onPrimaryContainer,
                    ),
                    side: BorderSide.none,
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.x1),
              Text(
                'SurfaceLevel.base는 내비게이션 바, 사이드 패널에 어울립니다. DsCard는 InkWell + DsSurface를 조합합니다.',
                style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
              ),
              const SizedBox(height: AppSpacing.x1_5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DsButton(
                    label: '닫기',
                    variant: DsButtonVariant.ghost,
                    onPressed: () {},
                  ),
                  const SizedBox(width: AppSpacing.x1),
                  DsButton(label: '적용', onPressed: () {}),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.icon,
    required this.iconColor,
    required this.value,
    required this.label,
  });

  final IconData icon;
  final Color iconColor;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return Expanded(
      child: DsCard(
        level: SurfaceLevel.high,
        padding: const EdgeInsets.all(AppSpacing.x2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: iconColor, size: 22),
            const SizedBox(height: AppSpacing.x1),
            Text(value, style: tt.headlineSmall),
            Text(
              label,
              style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
            ),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// Section: Typography
// ═══════════════════════════════════════════════════════════════════════════════

class _TypographySection extends StatelessWidget {
  const _TypographySection();

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    final styles = [
      ('Display Small',   tt.displaySmall,   '36sp · W400'),
      ('Headline Large',  tt.headlineLarge,  '32sp · W600'),
      ('Headline Medium', tt.headlineMedium, '28sp · W600'),
      ('Title Large',     tt.titleLarge,     '22sp · W600'),
      ('Title Medium',    tt.titleMedium,    '16sp · W600'),
      ('Title Small',     tt.titleSmall,     '14sp · W600'),
      ('Body Large',      tt.bodyLarge,      '16sp · W400'),
      ('Body Medium',     tt.bodyMedium,     '14sp · W400'),
      ('Body Small',      tt.bodySmall,      '12sp · W400'),
      ('Label Large',     tt.labelLarge,     '14sp · W500'),
      ('Label Medium',    tt.labelMedium,    '12sp · W500'),
      ('Label Small',     tt.labelSmall,     '11sp · W500'),
    ];

    return DsSurface(
      level: SurfaceLevel.low,
      padding: const EdgeInsets.all(AppSpacing.x2),
      child: Column(
        children: styles.indexed.map((entry) {
          final (i, row) = entry;
          final (name, style, meta) = row;

          return Column(
            children: [
              if (i != 0)
                Divider(
                  height: AppSpacing.x2,
                  color: cs.outlineVariant.withValues(alpha: 0.5),
                ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      name,
                      style: style?.copyWith(color: cs.onSurface),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.x1_5),
                  Text(
                    meta,
                    style: tt.labelSmall?.copyWith(
                      color: cs.onSurfaceVariant,
                      fontFamily: 'monospace',
                    ),
                  ),
                ],
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// Section: Color Scheme
// ═══════════════════════════════════════════════════════════════════════════════

class _ColorSchemeSection extends StatelessWidget {
  const _ColorSchemeSection();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    final roles = [
      ('Primary',            cs.primary,             cs.onPrimary),
      ('PrimaryContainer',   cs.primaryContainer,    cs.onPrimaryContainer),
      ('Secondary',          cs.secondary,           cs.onSecondary),
      ('SecondaryContainer', cs.secondaryContainer,  cs.onSecondaryContainer),
      ('Tertiary',           cs.tertiary,            cs.onTertiary),
      ('TertiaryContainer',  cs.tertiaryContainer,   cs.onTertiaryContainer),
      ('Error',              cs.error,               cs.onError),
      ('ErrorContainer',     cs.errorContainer,      cs.onErrorContainer),
    ];

    final surfaces = [
      ('surface',                   cs.surface,                 cs.onSurface),
      ('surfaceContainerLowest',    cs.surfaceContainerLowest,  cs.onSurface),
      ('surfaceContainerLow',       cs.surfaceContainerLow,     cs.onSurface),
      ('surfaceContainer',          cs.surfaceContainer,        cs.onSurface),
      ('surfaceContainerHigh',      cs.surfaceContainerHigh,    cs.onSurface),
      ('surfaceContainerHighest',   cs.surfaceContainerHighest, cs.onSurface),
      ('inverseSurface',            cs.inverseSurface,          cs.onInverseSurface),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: AppSpacing.x1,
          crossAxisSpacing: AppSpacing.x1,
          childAspectRatio: 2.8,
          children: roles
              .map((r) => _ColorSwatch(
                    label: r.$1,
                    background: r.$2,
                    foreground: r.$3,
                  ))
              .toList(),
        ),
        const SizedBox(height: AppSpacing.x2),
        ...surfaces.map((s) {
          final (name, color, textColor) = s;
          return Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.x1),
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                color: color,
                borderRadius: AppRadius.allSm,
                border: Border.all(
                  color: cs.outline.withValues(alpha: 0.3),
                ),
              ),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.x1_5),
              child: Text(
                name,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: textColor,
                    ),
              ),
            ),
          );
        }),
      ],
    );
  }
}

class _ColorSwatch extends StatelessWidget {
  const _ColorSwatch({
    required this.label,
    required this.background,
    required this.foreground,
  });

  final String label;
  final Color background;
  final Color foreground;

  @override
  Widget build(BuildContext context) {
    final hex =
        '#${background.toARGB32().toRadixString(16).substring(2).toUpperCase()}';

    return Container(
      decoration: BoxDecoration(
        color: background,
        borderRadius: AppRadius.allSm,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.x1_5,
        vertical: AppSpacing.x1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: foreground,
                  fontWeight: FontWeight.w600,
                ),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            hex,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: foreground.withValues(alpha: 0.7),
                ),
          ),
        ],
      ),
    );
  }
}
