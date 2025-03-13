import 'package:flutter/material.dart';

//import 'package:figma_task/views/onboarding_page1.dart';
//import 'package:figma_task/views/onboarding_page2.dart';
//import 'package:figma_task/views/subscription_page.dart';
import 'package:figma_task/views/settings_page.dart';


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Inter',
      ),
      home: const Settings(),
      //home: const Subscription(),
      //home: const OnBoarding2(),
      //home: OnBoarding(),
      //home: PersonalizePage(),
    );
  }
}
