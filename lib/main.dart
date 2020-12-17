import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:aDot/components.dart';
import 'package:aDot/home.dart';

void main() {
  runApp(
    EasyLocalization(
      child: SolarSystem(),
      supportedLocales: [
        Locale('en', 'US'),
        Locale('bn', 'BN'),
        Locale('ar', 'SA'),
        Locale('es', 'ES')
      ],
      path: 'assets/translations',
      fallbackLocale: Locale('en', 'US'),
      saveLocale: false,
    ),
  );
}

class SolarSystem extends StatefulWidget {
  @override
  _SolarSystemState createState() => _SolarSystemState();
}

class _SolarSystemState extends State<SolarSystem> {
  String fontFamily = 'Raleway';

  @override
  Widget build(BuildContext context) {
    if (context.locale == Locale('bn', 'BN')) {
      fontFamily = 'Solaiman';
    } else
      fontFamily = 'Raleway';

    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: true,
      theme: ThemeData(fontFamily: fontFamily),
      home: Scaffold(
        backgroundColor: gradientEndColor,
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  gradientStartColor,
                  gradientEndColor,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3, 0.7],
              ),
            ),
            child: HomePage()),
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }
}
