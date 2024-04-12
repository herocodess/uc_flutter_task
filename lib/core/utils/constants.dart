import 'package:uc_flutter_task/config.dart';

class StringConstants {
  static const String $userId = 'user_id';
  static const String $operatorUid = 'operator_uid';
  static const String $accessToken = 'access_token';
  static const String $defaultLogoId = '5628';
  static String $base64EncodedString = Config.base64EncodedVideoUrl;

  static String getChannelLogoFromId(int logoId) =>
      '${Config.logoBaseUrl}/$logoId?accessKey=${Config.logoAccessKey}';
}
