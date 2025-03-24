import 'package:figma_task/components/elevated_button.dart';
import 'package:figma_task/views/settings_2.dart';
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

  RadioOption(
    this.titleUp,
    this.titleDown,
    this.trailTextUp,
    this.trailTextDown,
  );
}

class _SubscriptionState extends State<Subscription> {
  int? groupValue;
  List<RadioOption> radioOptions = [
    RadioOption(
      'Yearly',
      '-66% discount',
      '\u{20AC} ${94.89}',
      'every year',
    ),
    RadioOption(
      'Monthly',
      '-55% discount',
      '\u{20AC} ${84.89}',
      'every month',
    ),
    RadioOption(
      'Yearly',
      '-44% discount',
      '\u{20AC} ${74.89}',
      'every week',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(right: 24, left: 24),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Gap(48),
            const Text("Choose your\nsubscription plan",
                style: TextStyle(
                  letterSpacing: 0.01,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                )),
            const Gap(16),
            const Text(
              "And get a 7-day free trial",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const Gap(42),
            ...radioOptions.asMap().entries.map(
              (e) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Color(0xFFE0E1E7)),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    tileColor: Colors.white,
                    selectedTileColor: const Color(0xFFEAF2FF),
                    selected: e.key == groupValue,
                    onTap: () {
                      setState(() {
                        groupValue = e.key;
                      });
                    },
                    leading: e.key == groupValue
                        ? SvgPicture.asset("assets/RadioButtonOn.svg")
                        : SvgPicture.asset("assets/RadioButtonOff.svg"),
                    horizontalTitleGap: 9.5,
                    title: Text(
                      e.value.titleUp,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      e.value.titleDown,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF006FFD),
                      ),
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            e.value.trailTextUp,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            e.value.trailTextDown,
                            style: const TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const Gap(26),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F9FE),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("You'll get:",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                  const Gap(16),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/star_filled.svg",
                        colorFilter: const ColorFilter.mode(
                            Color(0xFF006FFD), BlendMode.srcIn),
                        height: 12,
                      ),
                      const Gap(12),
                      const Text(
                        "Unlimited acces",
                        style: TextStyle(
                          height: 16 / 12,
                          letterSpacing: 0.01,
                          fontSize: 12,
                          color: Color(0xFF71727A),
                        ),
                      ),
                    ],
                  ),
                  const Gap(16),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/star_filled.svg",
                        height: 12,
                      ),
                      const Gap(12),
                      const Text(
                        "200GB storage",
                        style: TextStyle(
                          height: 16 / 12,
                          letterSpacing: 0.01,
                          fontSize: 12,
                          color: Color(0xFF71727A),
                        ),
                      ),
                    ],
                  ),
                  const Gap(16),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/star_filled.svg",
                        height: 12,
                      ),
                      const Gap(12),
                      const Text(
                        "Sync all your devices",
                        style: TextStyle(
                          height: 16 / 12,
                          letterSpacing: 0.01,
                          fontSize: 12,
                          color: Color(0xFF71727A),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SizedBox(
            height: 50,
            width: 380,
            child: PrimaryButton(
              buttonText: "Subscribe",
              onTap: () {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Settings(),
                      ));
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
