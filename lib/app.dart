import 'package:flutter/material.dart';

// import 'package:figma_task/views/navigate_chat_and_setting.dart';
import 'package:figma_task/views/navigt_e_com.dart';
// import 'package:figma_task/views/chat_list.dart';
// import 'package:figma_task/views/e_commerce_pg1.dart';
// import 'package:figma_task/views/e_commerce_pg2.dart';
//import 'package:figma_task/views/onboarding_page1.dart';
//import 'package:figma_task/views/onboarding_page2.dart';
// import 'package:figma_task/views/filter_page.dart';
// import 'package:figma_task/views/projects_page.dart';
// import 'package:figma_task/views/feedback_page.dart';
// import 'package:figma_task/views/subscription_tile.dart';
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
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: Colors.white,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const EcomBottomNavBar(),
      //home: const ChatAndSettingNavigation(),
      //home: const SignIn(),
      //home: const ECommercePg2(),
      //home: const ECommercePg1(),
      //home: const FilterPage()
      //home: const ProjFeedback(),
      //home: Projects(),
      //home: const Settings(),
      //home: const Subscription(),
      //home: const OnBoarding2(),
      //home: OnBoarding(),
      //home: PersonalizePage(),
    );
  }
}
