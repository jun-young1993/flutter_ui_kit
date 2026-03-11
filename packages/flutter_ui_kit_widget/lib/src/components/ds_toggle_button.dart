import 'package:flutter/material.dart';

/// [DsIconToggle] · [DsTextToggle]의 공통 뼈대.
///
/// Material + StadiumBorder + InkWell + AnimatedSwitcher 조합을 제공하며,
/// [child]로 아이콘·텍스트 등 임의의 위젯을 넣을 수 있다.
///
/// 직접 사용하기보다는 [DsIconToggle] · [DsTextToggle]을 통해 사용한다.
class DsToggleButton extends StatelessWidget {
  const DsToggleButton({
    super.key,
    required this.child,
    required this.onTap,
    required this.semanticLabel,
    required this.tooltipMessage,
    this.backgroundColor,
    this.sizedBoxDimension = 48,
  });

  /// 토글 버튼 안에 표시할 위젯 (Icon, Text 등).
  /// [AnimatedSwitcher]로 감싸므로, 전환 시 [Key]를 바꿔 줘야 애니메이션이 작동한다.
  final Widget child;

  /// 탭 시 호출되는 콜백.
  final VoidCallback onTap;

  /// 접근성 레이블 (스크린리더용).
  final String semanticLabel;

  /// 툴팁 메시지.
  final String tooltipMessage;

  /// 버튼 배경색. null이면 `colorScheme.surfaceContainerHigh`를 사용한다.
  final Color? backgroundColor;

  /// 탭 영역(정사각형)의 한 변 크기. 기본값 48.
  final double sizedBoxDimension;

  // ─── Animation constants ──────────────────────────────────────────────────

  static const Duration kDuration = Duration(milliseconds: 300);
  static const Curve kSwitchInCurve = Curves.easeOutCubic;
  static const Curve kSwitchOutCurve = Curves.easeInCubic;

  /// Incoming: fades in + scales up + rotates from 90° to 0°.
  /// Outgoing: fades out + scales down + rotates from 0° to 90°.
  static Widget buildTransition(Widget child, Animation<double> animation) {
    return ScaleTransition(
      scale: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
      child: RotationTransition(
        turns: Tween<double>(begin: 0.25, end: 0.0).animate(animation),
        child: FadeTransition(opacity: animation, child: child),
      ),
    );
  }

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
                duration: kDuration,
                switchInCurve: kSwitchInCurve,
                switchOutCurve: kSwitchOutCurve,
                transitionBuilder: buildTransition,
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
