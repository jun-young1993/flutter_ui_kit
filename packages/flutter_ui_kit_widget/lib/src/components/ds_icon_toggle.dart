import 'package:flutter/material.dart';

/// 아이콘 하나를 표시하고, 탭하면 상태를 전환하는 범용 토글 버튼.
///
/// [DsThemeToggle], [DsBrandToggle] 등 아이콘 스왑 토글의 공통 뼈대로 활용한다.
///
/// 버튼 영역은 [StadiumBorder] 형태의 [Material] + [InkWell]로 구성되며,
/// 아이콘 전환은 **rotate + scale + fade** 애니메이션으로 처리된다.
///
/// ```dart
/// DsIconToggle(
///   icon: Icons.wb_sunny_rounded,
///   onTap: () { /* 상태 변경 */ },
///   semanticLabel: 'Light is active. Tap to switch to Dark.',
///   tooltipMessage: 'light',
/// )
/// ```
class DsIconToggle extends StatelessWidget {
  const DsIconToggle({
    super.key,
    required this.icon,
    required this.onTap,
    required this.semanticLabel,
    required this.tooltipMessage,
    this.iconKey,
    this.iconColor,
    this.backgroundColor,
    this.sizedBoxDimension = 48,
    this.iconSize = 22,
  });

  /// 현재 표시할 아이콘.
  final IconData icon;

  /// 탭 시 호출되는 콜백.
  final VoidCallback onTap;

  /// 접근성 레이블 (스크린리더 용).
  final String semanticLabel;

  /// 툴팁 메시지.
  final String tooltipMessage;

  /// [AnimatedSwitcher]가 아이콘 교체 애니메이션을 트리거하는 데 쓰이는 키.
  /// 보통 현재 상태 값을 넘긴다. null이면 [icon] 자체를 키로 사용한다.
  final Key? iconKey;

  /// 아이콘 색상. null이면 `colorScheme.primary`를 사용한다.
  final Color? iconColor;

  /// 버튼 배경색. null이면 `colorScheme.surfaceContainerHigh`를 사용한다.
  final Color? backgroundColor;

  /// 탭 영역(정사각형)의 한 변 크기. 기본값 48.
  final double sizedBoxDimension;

  /// 아이콘 크기. 기본값 22.
  final double iconSize;

  // ─── Duration & Curve 상수 ────────────────────────────────────────────────

  static const Duration _kDuration = Duration(milliseconds: 300);
  static const Curve _kSwitchInCurve = Curves.easeOutCubic;
  static const Curve _kSwitchOutCurve = Curves.easeInCubic;

  // ─── Build ────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Semantics(
      button: true,
      label: semanticLabel,
      excludeSemantics: true,
      child: Tooltip(
        message: tooltipMessage,
        child: Material(
          color: backgroundColor ?? cs.surfaceContainerHigh,
          shape: const StadiumBorder(),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap,
            customBorder: const StadiumBorder(),
            child: SizedBox.square(
              dimension: sizedBoxDimension,
              child: AnimatedSwitcher(
                duration: _kDuration,
                switchInCurve: _kSwitchInCurve,
                switchOutCurve: _kSwitchOutCurve,
                transitionBuilder: _buildTransition,
                child: Icon(
                  icon,
                  key: iconKey ?? ValueKey(icon),
                  color: iconColor ?? cs.primary,
                  size: iconSize,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ─── Transition ───────────────────────────────────────────────────────────

  /// Incoming icon: fades in + scales up + rotates from 90° to 0°.
  /// Outgoing icon: fades out + scales down + rotates from 0° to 90°.
  static Widget _buildTransition(Widget child, Animation<double> animation) {
    return ScaleTransition(
      scale: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
      child: RotationTransition(
        turns: Tween<double>(begin: 0.25, end: 0.0).animate(animation),
        child: FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    );
  }
}
