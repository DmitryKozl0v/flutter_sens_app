import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  
  static final LocalData _instancia = new LocalData._internal();

  factory LocalData(){
    return _instancia;
  }

  LocalData._internal();

  SharedPreferences _prefs;

  initPrefs() async {

    this._prefs = await SharedPreferences.getInstance();
  }
}