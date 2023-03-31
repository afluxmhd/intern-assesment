import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intern_assesment/data/repository/auth_repo.dart';
import 'package:intern_assesment/models/response_model.dart';
import 'package:intern_assesment/models/sign_in_model.dart';

class AuthController extends GetxController implements GetxService {
  AuthController({required this.authRepo});
  final AuthRepo authRepo;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  //registration

  Future<ResponseModel> registration(SignInModel signInModel) async {
    _isLoading = true;
    update();
    Response response = await authRepo.registration(signInModel);
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      authRepo.saveUserToken(response.body["token"]);
      responseModel = ResponseModel(true, response.body["token"]);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> login(SignInModel signInModel) async {
    _isLoading = true;
    update();
    Response response = await authRepo.login(signInModel);
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      authRepo.saveUserToken(response.body["token"]);
      responseModel = ResponseModel(true, response.body["body"]);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  bool isUserLoggedIn() {
    return authRepo.isUserLoggedIn();
  }

  bool clearSharedData() {
    return authRepo.clearSharedData();
  }
}
