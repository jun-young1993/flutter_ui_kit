import 'package:flutter/material.dart';

/// 설정 화면으로 이동하는 기어 아이콘 버튼.
///
/// AppBar actions나 FloatingActionButton 대체로 활용한다.
///
/// ```dart
/// AppBar(
///   actions: [
///     SettingGearButton(
///       onPressed: () => Navigator.push(
///         context,
///         MaterialPageRoute(builder: (_) => const SettingScreen(...)),
///       ),
///     ),
///   ],
/// )
/// ```
class SettingGearButton extends StatelessWidget {
  const SettingGearButton({
    super.key,
    required this.onPressed,
    this.iconSize = 24.0,
    this.color,
    this.tooltip = 'Settings',
    this.animate = false,
  });

  final VoidCallback onPressed;
  final double iconSize;

  /// 아이콘 색상. null이면 테마의 [ColorScheme.onSurface]를 사용한다.
  final Color? color;

  final String tooltip;

  /// true이면 탭할 때 기어 회전 애니메이션을 적용한다.
  final bool animate;

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? Theme.of(context).colorScheme.onSurface;

    final icon = Icon(
      Icons.settings_outlined,
      size: iconSize,
      color: iconColor,
    );

    return Tooltip(
      message: tooltip,
      child: animate
          ? _AnimatedGearButton(onPressed: onPressed, iconSize: iconSize, color: iconColor)
          : IconButton(
              icon: icon,
              onPressed: onPressed,
              tooltip: tooltip,
            ),
    );
  }
}

class _AnimatedGearButton extends StatefulWidget {
  const _AnimatedGearButton({
    required this.onPressed,
    required this.iconSize,
    required this.color,
  });

  final VoidCallback onPressed;
  final double iconSize;
  final Color color;

  @override
  State<_AnimatedGearButton> createState() => _AnimatedGearButtonState();
}

class _AnimatedGearButtonState extends State<_AnimatedGearButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap() {
    Future.delayed(const Duration(milliseconds: 400), (){
      _controller.forward(from: 0.0);
      widget.onPressed();
    });
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween<double>(begin: 0.0, end: 0.25).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
      ),
      child: IconButton(
        icon: Icon(Icons.settings_outlined, size: widget.iconSize, color: widget.color),
        onPressed: _onTap,
      ),
    );
  }
}
