import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  Future getString(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var item = prefs.getString(name);
    return item;
  }

  Future setString(String name, String text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(name, text);
    return true;
  }

  Future setBool(String name, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(name, value);
    return true;
  }

  Future getBool(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var item = prefs.getBool(name);
    return item;
  }

  Future remove(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(name);
    return true;
  }

  Future clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    return true;
  }
}
