import 'package:flutter/material.dart';

import '../components/elevated_button.dart';

class OnBoarding2 extends StatefulWidget {
  const OnBoarding2({super.key});

  @override
  State<OnBoarding2> createState() => _OnBoarding2State();
}

class _OnBoarding2State extends State<OnBoarding2> {
  List<String> options = [
    "User Interface",
    "User Experience",
    "User Research",
    "UX Writing",
    "User Testing",
    "Service Design",
    "Strategy",
    "Design Systems"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const Text("Personalise your experience",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
            )),
        const SizedBox(height: 30),
        const Text("Choose your interests.",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            )),
        ListView.builder(
            itemCount: options.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: InkWell(
                  child: Container(
                    decoration: const BoxDecoration(),
                    height: 52,
                    width: 327,
                    child: Text("$options"),
                  ),
                ),
              );
            }),
        PrimaryButton(buttonText: "Next", onTap: () {}),
      ]),
    );
  }
}
