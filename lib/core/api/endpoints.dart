class Endpoints {
  static const String login = 'v2/global/login';
  static String getPackages(
          String operatorUid, String userId, String deviceClass) =>
      'v1/$operatorUid/users/$userId/packages?device_class=$deviceClass';
  static String getChannels(String operatorUid, String packagesIds) =>
      'v2/$operatorUid/channels?packages=$packagesIds';
}
