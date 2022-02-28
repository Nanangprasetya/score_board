import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:score_board/core/config/environment.dart';
import 'package:score_board/core/config/production.dart';
import 'package:score_board/core/routes/routes.dart';
import 'package:score_board/utils/localizations.dart';

void main() {
  Production();
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Score Board',
      translations: AppLocalizations(),
      supportedLocales: [Locale('id', ''), Locale('en', '')],
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
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
