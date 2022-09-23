import 'package:shared_preferences/shared_preferences.dart';

putUsertoLocal() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.setBool('loggedIn', true);
}

Future<bool?> getUserFromLocal() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? loggedIn;
  if (prefs.containsKey('loggedIn')) {
    loggedIn = prefs.getBool('loggedIn');
  }
  return loggedIn;
}

removeUserFromLocal() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  if (preferences.containsKey('loggedIn')) {
    preferences.remove('loggedIn');
  }
}
