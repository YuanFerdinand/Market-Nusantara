import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static String userIdKey = "USERKEY";
  static String userCredentialIdKey = "USERCREDENTIALKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";
  static int userTotalCheckoutKey = 0;
  static String userProfilePict = "USERPROFILEKEY";
  static String logedInKey = "LOGEDINKEY";

  //save data
  Future<bool> saveUserId(String getUserId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(userIdKey, getUserId);
  }

  Future<bool> saveUserCredentialId(String getUserCredentialId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(userCredentialIdKey, getUserCredentialId);
  }

  Future<bool> saveUserName(String getUserName) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(userNameKey, getUserName);
  }

  Future<bool> saveUserEmail(String getUserEmail) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(userEmailKey, getUserEmail);
  }

  Future<bool> saveProfilePicture(String getProfilePicture) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(userProfilePict, getProfilePicture);
  }

  Future<bool> saveTotal(int getTotal) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(
        userTotalCheckoutKey.toString(), getTotal.toString());
  }

  Future<bool> saveLogedIn(String getLogedIn) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(logedInKey, getLogedIn);
  }

  //get data
  Future<String> getUserId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userIdKey);
  }

  Future<String> getUserCredentialId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userCredentialIdKey);
  }

  Future<String> getUserName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userNameKey);
  }

  Future<String> getUserEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userEmailKey);
  }

  Future<String> getUserProfilePicture() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userProfilePict);
  }

  Future<String> getTotal() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userTotalCheckoutKey.toString());
  }

//
  Future<String> getLogedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(logedInKey);
  }
}
