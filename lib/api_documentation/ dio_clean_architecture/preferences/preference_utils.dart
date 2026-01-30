import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {
  static SharedPreferences? _preferences;
  static String sharedPreferencesUserLoggedInKey = "ISLOGGEDIN";
  static String sharedPreferencesUserEmailKey = "USEREMAILKEY";
  static String sharedPreferencesuserNameKey = "USERNAMEKEY";
  static String sharedpreferencesFirstName = "FIRSTNAMEKEY";
  static String sharedPreferencesDisplayPictureKey = 'DISPLAYPICTUREKEY';
  static String sharedpreferencesLastName = "LASTNAMEKEY";
  static String sharedPreferencesBiography = " BIOGRAPHY";
  static String sharedPreferencesAccessToken = "ACCESSTOKEN";
  static String loginCreds = "LOGIN_CREDS";
  static const _keyToken = 'Token';
  static const _keyUserId = 'UserID';
  static const _keyUserImg = 'UserImgURL';
  static const _keyIsWelcome = 'isWelcome';
  static const _keyFCMToken = 'token';
  static const String permissionAllowCount = "PERMISSION_ALLOW_COUNT";
  static const String ID = "id";
  static const String REG_CMP_NAME = "reg_cmp_name";


  static const _keyIsSocialSignIn = 'isSocialSignIn';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setToken(String token) async =>
      await _preferences?.setString(_keyToken, token);

  static String getToken() => _preferences?.getString(_keyToken) ?? "";

  static Future saveUserLoggedInSharedPreference(bool isUserLoggedIn) async =>
      await _preferences?.setBool(
          sharedPreferencesUserLoggedInKey, isUserLoggedIn);

  static bool getUserLoggedInSharedPreference() =>
      _preferences?.getBool(sharedPreferencesUserLoggedInKey) ?? false;

  static Future saveUserEmailSharedPreference(String email) async =>
      await _preferences?.setString(sharedPreferencesUserEmailKey, email);

  static String getUserEmailSharedPreference() =>
      _preferences?.getString(sharedPreferencesUserEmailKey) ?? '';

  static Future saveUserNameSharedPreference(String userName) async =>
      await _preferences?.setString(sharedPreferencesuserNameKey, userName);

  static String getUserNameSharedPreference() =>
      _preferences?.getString(sharedPreferencesuserNameKey) ?? "";

  static Future setIsWelcome(bool amount) async =>
      await _preferences?.setBool(_keyIsWelcome, amount);

  static bool getIsWelcome() => _preferences?.getBool(_keyIsWelcome) ?? false;

  static Future setPermissionCount(int count) async =>
      await _preferences?.setInt(permissionAllowCount, count);

  static int getPermissionCount() =>
      _preferences?.getInt(permissionAllowCount) ?? 0;

  static Future saveIdSharedPreference(String id) async =>
      await _preferences?.setString(ID, id);

  static String getIdSharedPreference() =>
      _preferences?.getString(ID) ?? "";

  static Future saveCompanySharedPreference(String id) async =>
      await _preferences?.setString(REG_CMP_NAME, id);

  static String getCompanySharedPreference() =>
      _preferences?.getString(REG_CMP_NAME) ?? "";

  static clearPreference({bool isFromDelete = false}) {
    var isWelcome = getIsWelcome();
    _preferences?.clear();

    setIsWelcome(isWelcome);
  }

  static Future saveUserImageSharedPreference(String userImage) async =>
      await _preferences?.setString(sharedPreferencesDisplayPictureKey, userImage);

  static String getUserImageSharedPreference() =>
      _preferences?.getString(sharedPreferencesDisplayPictureKey) ?? "";

}
