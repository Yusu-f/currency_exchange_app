
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  Future<SharedPreferences> _getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  Future<String?> getToken(String token) async {
    return await _getPrefs().then((pref) {
      return pref.getString(token);
    });
  }

  Future<void> saveToken(String token, String value) async {
    await _getPrefs().then((pref) {
      pref.setString(token, value);
    });
  }

}