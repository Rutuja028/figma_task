import 'package:figma_task/views/subscription_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../components/elevated_button.dart';

class OnBoarding2 extends StatefulWidget {
  const OnBoarding2({super.key});

  @override
  State<OnBoarding2> createState() => _OnBoarding2State();
}

class OptionItem {
  final String title;
  bool isSelected;
  OptionItem(this.title, this.isSelected);
}

class _OnBoarding2State extends State<OnBoarding2> {
  List<OptionItem> options = [
    OptionItem('User Interface', false),
    OptionItem('User Experience', false),
    OptionItem('User Research', false),
    OptionItem('UX Writing', false),
    OptionItem('User Testing', false),
    OptionItem('Service Design', false),
    OptionItem('Strategy', false),
    OptionItem('Design Systems', false),
  ];

  bool checkBoxValue = false;
  bool tickIcon = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(right: 24, left: 24),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 10),
                const Gap(73),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Personalise your \nexperience",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      )),
                ),
                const Gap(16),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Choose your interests.",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const Gap(41),
                Expanded(
                  child: ListView.builder(
                      itemCount: options.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Color(0xFFE0E1E7)),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            tileColor: Colors.white,
                            selectedTileColor: const Color(0xFFEAF2FF),
                            selected: options.elementAt(index).isSelected,
                            onTap: () {
                              setState(() {
                                options.elementAt(index).isSelected =
                                    !options.elementAt(index).isSelected;
                              });
                            },
                            title: Text(
                              options.elementAt(index).title,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                            trailing: options.elementAt(index).isSelected
                                ? SvgPicture.asset("assets/RightButton.svg",
                                    height: 12, width: 12)
                                : null,
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 50,
                  width: 380,
                  child: PrimaryButton(
                    buttonText: "Next",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Subscription(),
                          ));
                    },
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
