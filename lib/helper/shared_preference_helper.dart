import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static String userIdKey = "USERKEY";
  static String userAlamatKey = "USERBALAMAT";
  static String userBankKey = "USERBANK";
  static String userTokoKey = "USERTOKO";
  static String userRekeningKey = "USERREKENING";
  static String userTelpKey = "USERTELP";
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

  Future<bool> saveLogedIn(String getLogedIn) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(logedInKey, getLogedIn);
  }

  Future<bool> saveAlamat(String getAlamat) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(userAlamatKey, getAlamat);
  }

  Future<bool> saveBank(String getBank) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(userBankKey, getBank);
  }

  Future<bool> saveToko(String getToko) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(userTokoKey, getToko);
  }

  Future<bool> saveRekening(String getRekening) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(userRekeningKey, getRekening);
  }

  Future<bool> saveTelp(String getTelp) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(userTelpKey, getTelp);
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

//
  Future<String> getLogedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(logedInKey);
  }

  Future<String> getAlamat() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userAlamatKey);
  }

  Future<String> getBank() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userBankKey);
  }

  Future<String> getToko() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userTokoKey);
  }

  Future<String> getRekening() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userRekeningKey);
  }

  Future<String> getTelp() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userTelpKey);
  }
}
