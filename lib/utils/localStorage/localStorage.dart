import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static SharedPreferencesService? _instance;
  static late SharedPreferences _preferences;

  SharedPreferencesService._internal();

  factory SharedPreferencesService() {
    if (_instance == null) {
      _instance = SharedPreferencesService._internal();
    }
    return _instance!;
  }

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Save data to shared preferences
  Future<void> saveData(String key, dynamic value) async {
    if (value is int) {
      await _preferences.setInt(key, value);
    } else if (value is double) {
      await _preferences.setDouble(key, value);
    } else if (value is bool) {
      await _preferences.setBool(key, value);
    } else if (value is String) {
      await _preferences.setString(key, value);
    } else if (value is List<String>) {
      await _preferences.setStringList(key, value);
    } else {
      throw Exception("Unsupported value type");
    }
  }

static Future<void> saveAuthToken(String token)async{
  await _preferences.setString('token', token);
}

 static  getAuthToken(){
 return  _preferences.getString('token');
}
  

  // Retrieve data from shared preferences
  dynamic getData(String key) {
    return _preferences.get(key);
  }

  // Clear all data from shared preferences
static Future<void> clearAllData() async {
    await _preferences.clear();
  }
}
