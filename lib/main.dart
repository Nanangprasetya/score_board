
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:score_board/core/config/environment.dart';
import 'package:score_board/core/config/production.dart';
import 'package:score_board/core/routes/routes.dart';

void main() {
  Production();
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Score Board',
      theme: ThemeData(
        primaryColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: Environment.value.printResponse,
      initialRoute: '/',
      getPages: routes,
    );
  }
}
