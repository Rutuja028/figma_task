import 'package:figma_task/components/elevated_button.dart';
import 'package:figma_task/views/settings_2.dart';
import 'package:flutter/material.dart';
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

  RadioOption(
      this.titleUp, this.titleDown, this.trailTextUp, this.trailTextDown);
}

class _SubscriptionState extends State<Subscription> {
  List<RadioOption> radioOptions = [
    RadioOption(
      'Yearly',
      '-66% discount',
      '#94.89',
      'every year',
    ),
    RadioOption(
      'Monthly',
      '-55% discount',
      '#84.89',
      'every month',
    ),
    RadioOption(
      'Yearly',
      '-44% discount',
      '#74.89',
      'every week',
    ),
  ];

  int? selectedIndex;

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
                  child: Text("Choose your \nsubscription plan",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      )),
                ),
                const Gap(16),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "And get a 7-day free trial",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF71727A),
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
                          child: RadioListTile(
                            selected: index == selectedIndex,
                            value: index,
                            groupValue: selectedIndex,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Color(0xFFE0E1E7)),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            activeColor: const Color(0xFF006FFD),
                            tileColor: Colors.white,
                            selectedTileColor: const Color(0xFFEAF2FF),
                            onChanged: (value) {
                              setState(() {
                                selectedIndex = value;
                              });
                            },
                            title: Row(
                              children: [
                                Column(
                                  children: [
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
                                  ],
                                ),
                                const Spacer(),
                                Column(
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
                                      radioOptions
                                          .elementAt(index)
                                          .trailTextDown,
                                      style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Settings(),
                      ),
                    );
                  },
                ),
              ]),
        ),
      ),
    );
  }
}
