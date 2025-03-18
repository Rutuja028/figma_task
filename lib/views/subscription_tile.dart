import 'package:figma_task/components/elevated_button.dart';
import 'package:figma_task/views/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class Subscription extends StatefulWidget {
  const Subscription({super.key});

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class RadioOption {
  final String titleUp;
  final String titleDown;
  final String trailTextUp;
  final String trailTextDown;
  bool isSelected;

  RadioOption(this.titleUp, this.titleDown, this.trailTextUp,
      this.trailTextDown, this.isSelected);
}

class _SubscriptionState extends State<Subscription> {
  List<RadioOption> radioOptions = [
    RadioOption(
      'Yearly',
      '-66% discount',
      '#94.89',
      'every year',
      false,
    ),
    RadioOption('Monthly', '-55% discount', '#84.89', 'every month', false),
    RadioOption(
      'Yearly',
      '-44% discount',
      '#74.89',
      'every week',
      false,
    ),
  ];

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
                      itemCount: radioOptions.length,
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
                            selected: radioOptions.elementAt(index).isSelected,
                            onTap: () {
                              setState(() {
                                radioOptions.elementAt(index).isSelected =
                                    !radioOptions.elementAt(index).isSelected;
                              });
                            },
                            leading: radioOptions.elementAt(index).isSelected
                                ? SvgPicture.asset("assets/RadioButtonOn.svg")
                                : SvgPicture.asset("assets/RadioButtonOff.svg"),
                            title: Column(children: [
                              Text(
                                radioOptions.elementAt(index).titleUp,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                radioOptions.elementAt(index).titleDown,
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF006FFD),
                                ),
                              ),
                            ]),
                            trailing: Column(
                              children: [
                                Text(
                                  radioOptions.elementAt(index).trailTextUp,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  radioOptions.elementAt(index).trailTextDown,
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                PrimaryButton(
                  buttonText: "Next",
                  buttonHeight: 50,
                  buttonWidth: 380,
                  onTap: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Settings(),
                          ));
                    });
                  },
                ),
              ]),
        ),
      ),
    );
  }
}
