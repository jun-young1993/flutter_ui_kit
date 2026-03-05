import 'package:flutter/material.dart';

import '../services/app_info_service.dart';

/// 앱 버전을 자동으로 가져와 표시하는 타일.
///
/// [package_info_plus]를 통해 버전 정보를 비동기로 읽어온다.
///
/// ```dart
/// SettingAppVersionTile()
/// SettingAppVersionTile(label: '앱 버전', showBuildNumber: true)
/// ```
class SettingAppVersionTile extends StatefulWidget {
  const SettingAppVersionTile({
    super.key,
    this.label = 'App Version',
    this.leading,
    this.showBuildNumber = false,
  });

  final String label;
  final Widget? leading;

  /// true이면 빌드 번호를 함께 표시한다. (e.g. "1.0.0 (42)")
  final bool showBuildNumber;

  @override
  State<SettingAppVersionTile> createState() => _SettingAppVersionTileState();
}

class _SettingAppVersionTileState extends State<SettingAppVersionTile> {
  String? _version;
  String? _buildNumber;

  @override
  void initState() {
    super.initState();
    _loadVersion();
  }

  Future<void> _loadVersion() async {
    final info = await AppInfoService.getVersionInfo();
    if (mounted) {
      setState(() {
        _version = info.version;
        _buildNumber = info.buildNumber;
      });
    }
  }

  String get _displayVersion {
    if (_version == null) return '...';
    if (widget.showBuildNumber && _buildNumber != null && _buildNumber!.isNotEmpty) {
      return '$_version ($_buildNumber)';
    }
    return _version!;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      leading: widget.leading,
      title: Text(widget.label, style: theme.textTheme.bodyLarge),
      trailing: Text(
        _displayVersion,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}
