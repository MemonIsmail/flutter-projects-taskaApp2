import 'package:get/get.dart';
import 'package:taska_app/screens/create_task_screen.dart';
import 'package:taska_app/screens/splash_screen.dart';
import 'package:taska_app/screens/login_screen.dart';
import 'package:taska_app/routing/routes.dart';
import 'package:taska_app/routing/screen_bindings.dart';
import 'package:taska_app/screens/task_details_screen.dart';

import '../screens/dashboard_screen.dart';
import '../screens/signup_screen.dart';

class RouteManagement {
  static List<GetPage> getPages(){
    return[
      GetPage(
        name: kSplashScreenRoute,
        page: () => SplashScreen(),
        binding: ScreenBindings(),
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
        name: kCreateTaskRoute,
        page: () => CreateTaskScreen(),
        binding: ScreenBindings()
      ),

      GetPage(
        name: kTaskDetailsRoute,
        page: () => TaskDetailsScreen(),
        binding: ScreenBindings()
      ),
    ];
  }
}