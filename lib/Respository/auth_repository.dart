import 'package:mvvm/Data/Network/baseApiService.dart';
import 'package:mvvm/Data/Network/networkApiService.dart';
import 'package:mvvm/Res/auth_url.dart';

class AuthRepository {
  BaseApiService _apiService = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiService.getPostApiResponse(AuthUrl.loginUrl, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
          await _apiService.getPostApiResponse(AuthUrl.registerUrl, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
