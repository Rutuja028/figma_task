import 'package:figma_task/components/elevated_button.dart';
import 'package:figma_task/views/settings_2.dart';
import 'package:figma_task/views/your_bag_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class Subscription extends StatefulWidget {
  const Subscription({super.key});

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class RadioOption {
  final String cardName;
  final String cardNum;

  RadioOption(
    this.cardName,
    this.cardNum,
  );
}

class _SubscriptionState extends State<Subscription> {
  int? groupValue;
  List<RadioOption> radioOptions = [
    RadioOption(
      'Mastercard',
      'xxxx xxxx xxxx 1234',
    ),
    RadioOption(
      'Visa',
      'xxxx xxxx xxxx 9876',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: TextButton(
            child: const Text(
              "Cancel",
              style: TextStyle(
                  color: Color(0xFF006FFD),
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
            ),
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) => const YourBag(),
                ),
              );
            },
          ),
          centerTitle: true,
          title: const Text(
            "Checkout",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(right: 24, left: 24),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Column(
                  children: [
                    SvgPicture.asset("assets/tickicon_checkout.svg"),
                    const Text("Your Bag"),
                  ],
                ),
                Column(
                  children: [
                    SvgPicture.asset("assets/tickicon_checkout.svg"),
                    const Text("Shipping"),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 24,
                      width: 24,
                      color: const Color(0xFF006FFD),
                      child: const Text("3"),
                    ),
                    const Text("Payment"),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 24,
                      width: 24,
                      color: const Color(0xFFF8F9FE),
                      child: const Text("4"),
                    ),
                    const Text("Review"),
                  ],
                ),
              ],
            ),
            const Gap(33),
            const Text("Choose a payment method",
                style: TextStyle(
                  letterSpacing: 0.01,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                )),
            const Gap(16),
            const Text(
              "You won't be charged until you review the order on the next page",
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
                      e.value.cardName,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      e.value.cardNum,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF006FFD),
                      ),
                    ),
                    trailing: Flexible(
                      child: Text(
                        e.value.cardNum,
                        style: const TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const Gap(26),
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
