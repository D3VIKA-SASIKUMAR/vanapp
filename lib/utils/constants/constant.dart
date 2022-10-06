import 'package:shared_preferences/shared_preferences.dart';
import '/utils/constants/strings.dart';

class Constants {
  Constants._();
  static const BASE_URL = "https://api.drxtx.com/auth/";

  static Future<String> get UserId async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_id') ?? "0";
  }

  static Future logout() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove("user_id");
  }

  saveToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(token_key, token);
  }

  Future<String> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(token_key) ?? "";
  }
}
