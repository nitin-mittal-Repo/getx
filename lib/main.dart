import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_model/backend/helper/sharedPref.dart';
import 'package:getx_model/utils/appTranslate.dart';
import 'package:getx_model/utils/connectivity.dart';
import 'package:getx_model/utils/constants.dart';
import 'backend/helper/appRoute.dart';
import 'backend/helper/mainBinding.dart';

void main() async{
  await MainBinding().dependencies();
  Get.put(ConnectivityController());

  String currentLanguage = Get.find<SharedPrefManger>().getString('language') ?? Constants.defaultLanguageApp;

  runApp(MyApp(currentLanguage : currentLanguage));
}

class MyApp extends StatelessWidget {
  final String currentLanguage;
   const MyApp({super.key, required this.currentLanguage});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: Get.key,
        initialRoute: AppRouter.splash,
        getPages: AppRouter.routes,
        defaultTransition: Transition.fadeIn,
        translations: AppTranslation(),
        locale: Locale(currentLanguage),
        fallbackLocale: Locale(currentLanguage),
        builder: (context, child) {
          return Obx(() {
            var isConnected = Get.find<ConnectivityController>().isConnected.value;
            return isConnected ? child ?? const SizedBox.shrink() : SizedBox();
          });
        },
      ),
    );
  }
}