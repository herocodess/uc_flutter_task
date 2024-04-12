import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart' as sp;

final sharedPrefProvider =
    Provider<SharedPreferences>((ref) => SharedPreferences());

class SharedPreferences {
  factory SharedPreferences() {
    return _instance;
  }
  SharedPreferences._internal();
  static final SharedPreferences _instance = SharedPreferences._internal();

  Future<bool> write(String key, String value) async {
    final shared = await sp.SharedPreferences.getInstance();
    return shared.setString(key, value);
  }

  Future<String?> read(String key) async {
    final shared = await sp.SharedPreferences.getInstance();
    return shared.getString(key);
  }

  Future<bool> deleteAll() async {
    final shared = await sp.SharedPreferences.getInstance();
    return shared.clear();
  }
}
