
import 'package:dio/src/response.dart';
import 'package:getx_model/backend/helper/sharedPref.dart';
import 'package:getx_model/backend/repo/api.dart';
import 'package:getx_model/backend/repo/socket_service.dart';

class TestState {
  ApiService apiService;
  SharedPrefManger sharedPreferencesManager;
  SocketService socketService;
  TestState({required this.apiService, required this.sharedPreferencesManager, required this.socketService});



  Future<Response> getPrivate(Map<String, dynamic> queryParams) async {
    return await apiService.getPrivate('/profile', queryParams);
  }

}
