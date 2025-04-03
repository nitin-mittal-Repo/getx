

import 'package:get/get.dart';
import 'package:getx_model/backend/helper/sharedPref.dart';
import 'package:getx_model/backend/repo/socket_service.dart';
import 'package:getx_model/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repo/api.dart';

class MainBinding extends Bindings{

  @override
  Future<void> dependencies() async{

    final sharedPref = await SharedPreferences.getInstance();
    Get.put(SharedPrefManger(sharedPreferences: sharedPref), permanent: true);

    Get.lazyPut(() => ApiService(appBaseUrl: Constants.baseUrl));
    Get.lazyPut(() => SocketService(socketBaseUrl: Constants.baseSocketUrl));


    // Get.lazyPut(() => SplashParser(apiService: Get.find(),sharedPreferencesManager: Get.find()), fenix: true);

  }
}