import 'package:package_info_plus/package_info_plus.dart';

/// 앱 버전 정보를 제공하는 서비스.
abstract final class AppInfoService {
  static Future<String> getVersion() async {
    final info = await PackageInfo.fromPlatform();
    return info.version;
  }

  static Future<String> getBuildNumber() async {
    final info = await PackageInfo.fromPlatform();
    return info.buildNumber;
  }

  static Future<({String version, String buildNumber})> getVersionInfo() async {
    final info = await PackageInfo.fromPlatform();
    return (version: info.version, buildNumber: info.buildNumber);
  }
}
