import 'package:get/get_connect/http/src/response/response.dart';
import 'package:intern_assesment/data/api/api_client.dart';
import 'package:intern_assesment/models/sign_in_model.dart';
import 'package:intern_assesment/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  AuthRepo({required this.apiClient, required this.sharedPreferences});
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  Future<Response> registration(SignInModel signInModel) async {
    return await apiClient.postData(AppConstant.REGISTRATION_URI, signInModel.toJson());
  }

  Future<Response> login(SignInModel signInModel) async {
    return await apiClient.postData(AppConstant.LOGIN_URI, signInModel.toJson());
  }

  Future<bool> saveUserToken(String token) async {
    return await sharedPreferences.setString(AppConstant.TOKEN, token);
  }

  bool isUserLoggedIn() {
    return sharedPreferences.containsKey(AppConstant.TOKEN);
  }

  bool clearSharedData() {
    sharedPreferences.remove(AppConstant.TOKEN);
    return true;
  }
}
