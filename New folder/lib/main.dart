import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taska_app/model/constants.dart';
import 'package:taska_app/routing/route_management.dart';

void main(){
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
