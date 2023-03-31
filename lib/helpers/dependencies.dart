import 'package:get/get.dart';
import 'package:intern_assesment/controllers/auth_controller.dart';
import 'package:intern_assesment/data/api/api_client.dart';
import 'package:intern_assesment/data/repository/auth_repo.dart';
import 'package:intern_assesment/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  //SharedPreference
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  //Api Client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstant.BASE_URL, sharedPreferences: Get.find()));

  //repos
  Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  //Controllers
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
}
