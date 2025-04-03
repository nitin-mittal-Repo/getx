import 'package:get/get.dart';

class AppRouter {
  static const String splash = '/splash_screen';

  static String getSplashRoute() => splash;

  static List<GetPage> routes = [
    // GetPage(
    //   name: splash,
    //   page: () => const SplashScreen(),
    //   binding: SplashBinding(),
    //   transition: Transition.fadeIn,
    //   transitionDuration: const Duration(milliseconds: 300),
    // ),
  ];
}
