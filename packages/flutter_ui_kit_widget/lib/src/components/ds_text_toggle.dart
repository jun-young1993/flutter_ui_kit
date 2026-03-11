import 'package:flutter/material.dart';

import 'ds_toggle_button.dart';

/// 텍스트 레이블을 표시하고, 탭하면 상태를 전환하는 범용 토글 버튼.
///
/// [DsIconToggle]과 동일한 [DsToggleButton] 기반으로 구현되며,
/// 아이콘 대신 짧은 텍스트(예: "EN", "KO")를 표시하는 경우에 활용한다.
///
/// ```dart
/// DsTextToggle(
///   label: 'EN',
///   labelKey: ValueKey('en'),
///   onTap: () { /* 상태 변경 */ },
///   semanticLabel: 'EN is active. Tap to switch to KO.',
///   tooltipMessage: 'EN',
/// )
/// ```
class DsTextToggle extends StatelessWidget {
  const DsTextToggle({
    super.key,
    required this.label,
    required this.onTap,
    required this.semanticLabel,
    required this.tooltipMessage,
    this.labelKey,
    this.labelColor,
    this.backgroundColor,
    this.sizedBoxDimension = 48,
    this.fontSize = 12,
    this.fontWeight = FontWeight.bold,
  });

  /// 현재 표시할 텍스트 레이블.
  final String label;

  /// 탭 시 호출되는 콜백.
  final VoidCallback onTap;

  /// 접근성 레이블 (스크린리더용).
  final String semanticLabel;

  /// 툴팁 메시지.
  final String tooltipMessage;

  /// [AnimatedSwitcher]가 텍스트 교체 애니메이션을 트리거하는 데 쓰이는 키.
  /// 보통 현재 상태 값을 넘긴다. null이면 [label] 자체를 키로 사용한다.
  final Key? labelKey;

  /// 텍스트 색상. null이면 `colorScheme.primary`를 사용한다.
  final Color? labelColor;

  /// 버튼 배경색. null이면 `colorScheme.surfaceContainerHigh`를 사용한다.
  final Color? backgroundColor;

  /// 탭 영역(정사각형)의 한 변 크기. 기본값 48.
  final double sizedBoxDimension;

  /// 텍스트 크기. 기본값 12.
  final double fontSize;

  /// 텍스트 굵기. 기본값 [FontWeight.bold].
  final FontWeight fontWeight;

  // ─── Build ────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return DsToggleButton(
      onTap: onTap,
      semanticLabel: semanticLabel,
      tooltipMessage: tooltipMessage,
      backgroundColor: backgroundColor,
      sizedBoxDimension: sizedBoxDimension,
      child: Text(
        label,
        key: labelKey ?? ValueKey(label),
        style: tt.labelMedium?.copyWith(
          color: labelColor ?? cs.primary,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
