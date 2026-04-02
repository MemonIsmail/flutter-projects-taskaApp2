
import 'package:get/get.dart';
import 'package:taska_app/screens/task_screen.dart';
import 'package:taska_app/screens/signup_screen.dart';
import 'package:taska_app/screens/splash_screen.dart';
import 'package:taska_app/screens/login_screen.dart';
import 'package:taska_app/model/constants.dart';
import 'package:taska_app/routing/screen_bindings.dart';

import '../screens/dashboard_screen.dart';
import '../screens/signup_screen.dart';

class RouteManagement {
  static List<GetPage> getPages(){
    return[
      GetPage(
          name: kSplashScreenRoute,
          page: () => SplashScreen(),
          binding: ScreenBindings()
      ),

      GetPage(
          name: kLoginScreenRoute,
          page: () => LoginScreen(),
          binding: ScreenBindings()
      ),

      GetPage(
          name: kSignupScreenRoute,
          page: () => SignUpScreen(),
          binding: ScreenBindings()
      ),

      GetPage(
          name: kDashboardScreenRoute,
          page: () => DashboardScreen(),
          binding: ScreenBindings()
      ),

      GetPage(
          name: kTaskScreenRoute,
          page: () => TaskScreen(),
          binding: ScreenBindings()
      ),
    ];
  }
}
