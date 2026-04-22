import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taska_app/routing/routes.dart';
import 'package:taska_app/routing/route_management.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: kSplashScreenRoute,
      getPages: RouteManagement.getPages(),
    );
  }
}
