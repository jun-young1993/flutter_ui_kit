import 'package:url_launcher/url_launcher.dart';

/// 이메일 작성기를 여는 서비스.
abstract final class EmailService {
  static Future<void> openEmailComposer({
    required String email,
    String subject = '',
    String body = '',
  }) async {
    final params = <String, String>{};
    if (subject.isNotEmpty) params['subject'] = subject;
    if (body.isNotEmpty) params['body'] = body;

    final uri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: params.isEmpty ? null : params,
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
