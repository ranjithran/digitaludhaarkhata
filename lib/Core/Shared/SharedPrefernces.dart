import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefer {
  addIntToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('intValue', 123);
  }

  getIntValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return int
    int intValue = prefs.getInt('intValue');
    return intValue;
  }
}
