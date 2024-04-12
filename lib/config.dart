import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static String get fileName =>
      kDebugMode ? '.env.development' : '.env.production';
  static String get baseUrl => dotenv.env['BASE_URL']!;
  static String get logoBaseUrl => dotenv.env['LOGO_BASE_URL']!;
  static String get logoAccessKey => dotenv.env['LOGO_ACCESS_KEY']!;
  static String get base64EncodedVideoUrl =>
      dotenv.env['BASE64_ENCODED_VIDEO_URL']!;
}
