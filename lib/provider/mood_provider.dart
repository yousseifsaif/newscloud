import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoodProvider with ChangeNotifier {

  bool _isLightMode = true;

  bool get isLightMode => _isLightMode;

  set isLightMode(bool value) {
    _isLightMode = value;
  }

  changMode() async {
    //   if (_isLightMode == true) {
    //     _isLightMode = false;
    //     notifyListeners();
    //   }
    //   else if (_isLightMode == false) {
    //     _isLightMode = true;
    //     notifyListeners();
    //   }
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLightMode ? _isLightMode = false : _isLightMode = true;
    prefs.setBool("_isLightMode", _isLightMode);
    notifyListeners();

  }
  getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLightMode = prefs.getBool("_isLightMode")??true;
    notifyListeners();
  }
}
