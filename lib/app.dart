import 'package:flutter/material.dart';

//import 'package:figma_task/views/onboarding_page1.dart';
//import 'package:figma_task/views/onboarding_page2.dart';
import 'package:figma_task/views/projects_page.dart';
import 'package:figma_task/views/feedback_page.dart';
import 'package:figma_task/views/subscription_tile.dart';
// import 'package:figma_task/views/settings_page.dart';
// import 'package:figma_task/views/sign_in.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Inter',
      ),
      //home: const SignIn(),
      debugShowCheckedModeBanner: false,
      //home: const ProjFeedback(),
      home: Projects(),
      //home: const Settings(),
      //home: const Subscription(),
      //home: const OnBoarding2(),
      //home: OnBoarding(),
      //home: PersonalizePage(),
    );
  }
}
