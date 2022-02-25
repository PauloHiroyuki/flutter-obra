import 'package:shared_preferences/shared_preferences.dart';

class LoginTools {
  static Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  static Future<SharedPreferences> getShared() async {
    return SharedPreferences.getInstance();
  }

  static Future<String?> getUsuario() async {
    return getShared().then((prefs) => prefs.getString("usuario"));
  }

  static void setUsuario(String usuario) async {
    return getShared().then((prefs) => prefs.setString("usuario", usuario));
  }

  static void removeUsuario() async {
    return getShared().then((prefs) => prefs.remove("usuario"));
  }
}
