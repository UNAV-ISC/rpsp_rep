import 'package:shared_preferences/shared_preferences.dart';

class StoragePrefs {
  static final StoragePrefs _instancia = StoragePrefs._internal();

  factory StoragePrefs() {
    return _instancia;
  }

  StoragePrefs._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

/////////////////////////////////////////////////

  String get token {
    return _prefs.getString('token') ?? '';
  }

  set token(String value) {
    _prefs.setString('token', value);
  }

  int get id {
    return _prefs.getInt('id') ?? 0;
  }

  set id(int value) {
    _prefs.setInt('id', value);
  }

  bool get darkTheme {
    return _prefs.getBool('darkTheme') ?? false;
  }

  bool get isDarkMode{
    return _prefs.getBool('isDarkMode') ?? false;
  }

  set isDarkMode (bool value){
_prefs.setBool('isDarkMode', value);
  }
  set darkTheme(bool value) {
    _prefs.setBool('darkTheme', value);
  }
}
