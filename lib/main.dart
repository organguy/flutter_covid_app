import 'package:covid_info/src/app.dart';
import 'package:covid_info/src/controllers/covid_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(() {
        Get.put(CovidController());
      }),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0
        ),
        primaryColor: Colors.white,
      ),
      home: App(),
    );
  }
}