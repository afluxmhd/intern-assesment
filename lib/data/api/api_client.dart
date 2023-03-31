import 'package:get/get_connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intern_assesment/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient extends GetConnect implements GetxService {
  ApiClient({required this.appBaseUrl, required this.sharedPreferences}) {
    token = sharedPreferences.getString(AppConstant.TOKEN) ?? " ";
  }

  late String token;
  final String appBaseUrl;
  final SharedPreferences sharedPreferences;

  Future<Response> postData(String uri, dynamic body) async {
    print('POST Body : $body');
    try {
      Response response = await post(AppConstant.BASE_URL + uri, body);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
