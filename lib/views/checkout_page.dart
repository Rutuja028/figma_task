import 'package:figma_task/components/elevated_button.dart';
import 'package:figma_task/views/your_bag_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class CreditCard {
  final String cardName;
  final String cardNum;

  CreditCard(
    this.cardName,
    this.cardNum,
  );
}

class _CheckoutPageState extends State<CheckoutPage> {
  int selectedPayMethod = 0;
  bool isCardChecked = false;
  bool isAppleChecked = false;

  int? groupValue;
  List<CreditCard> creditCards = [
    // CreditCard(
    //   'Mastercard',
    //   'xxxx xxxx xxxx 1234',
    // ),
    // CreditCard(
    //   'Visa',
    //   'xxxx xxxx xxxx 9876',
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          leading: TextButton(
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            child: const Text(
              "Cancel",
              maxLines: 1,
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
          padding: const EdgeInsets.only(right: 24, left: 24, top: 16),
          child: ListView(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    SvgPicture.asset("assets/tickicon_checkout.svg"),
                    const Text(
                      "Your Bag",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: Color(0xFF8F8F8F),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SvgPicture.asset("assets/tickicon_checkout.svg"),
                    const Text(
                      "Shipping",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: Color(0xFF8F8F8F),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 24,
                      width: 24,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF006FFD),
                      ),
                      child: const Center(
                          child: Text(
                        "3",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                    ),
                    const Text(
                      "Payment",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 24,
                      width: 24,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFF8F9FE),
                      ),
                      child: const Center(
                        child: Text(
                          "4",
                          style: TextStyle(
                            color: Color(0xFF8F8F8F),
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      "Review",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: Color(0xFF8F8F8F),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Gap(48),
            const Text(
              "Choose a payment method",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.005,
              ),
            ),
            const Gap(10),
            const Text(
              "You won't be charged until you review the order on the next page",
              style: TextStyle(
                letterSpacing: 0.01,
                fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Gap(38),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: const Color(0xFFD4D6DD),
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    16,
                  ),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedPayMethod = 1;
                          });
                        },
                        child: selectedPayMethod == 1
                            ? SvgPicture.asset(
                                "assets/RadioButtonOn.svg",
                              )
                            : SvgPicture.asset(
                                "assets/RadioButtonOff.svg",
                              ),
                      ),
                      const Gap(8),
                      const Text(
                        "Credit Card",
                        style: TextStyle(
                          color: Color(0xFF71727A),
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const Gap(16),
                  ////////////////////////////////////////////////
                  ...creditCards.asMap().entries.map(
                    (e) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 8,
                        ),
                        child: ListTile(
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
                          trailing: e.key == groupValue
                              ? SvgPicture.asset("assets/cardSelectTick.svg")
                              : null,
                          horizontalTitleGap: 9.5,
                          title: Text(
                            e.value.cardName,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                          subtitle: Row(
                            children: [
                              Text(
                                e.value.cardNum,
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF006FFD),
                                ),
                              ),
                              TextButton(
                                child: const Text(
                                  "Delete",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    creditCards.removeAt(e.key);
                                    if (groupValue == e.key) {
                                      groupValue = null;
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  TextButton(
                    style: TextButton.styleFrom(),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          final GlobalKey<FormState> formKey =
                              GlobalKey<FormState>();

                          TextEditingController nameController =
                              TextEditingController();
                          TextEditingController numberController =
                              TextEditingController();

                          return AlertDialog(
                            backgroundColor: Colors.white,
                            title: const Text("Add New Card"),
                            content: Form(
                              key: formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextFormField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[a-zA-z]'))
                                    ],
                                    maxLength: 20,
                                    controller: nameController,
                                    decoration: const InputDecoration(
                                      hintText: "Card Name",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(16),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  TextFormField(
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return "Enter card number";
                                      }
                                      return null;
                                    },
                                    maxLength: 20,
                                    controller: numberController,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      hintText: "Card Number",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(16),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(
                                    color: Color(0xFF006FFD),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    setState(
                                      () {
                                        creditCards.add(
                                          CreditCard(
                                            nameController.text.trim(),
                                            numberController.text.trim(),
                                          ),
                                        );
                                        Navigator.pop(context);
                                      },
                                    );
                                  }
                                },
                                child: const Text(
                                  "Add",
                                  style: TextStyle(
                                    color: Color(0xFF006FFD),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text(
                      "+  Add new card",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF006FFD),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        // fillColor: WidgetStatePropertyAll(Colors.white),
                        // Color.fromARGB(255, 128, 128, 128)),
                        checkColor: Colors.white,
                        value: isCardChecked,
                        activeColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          // side: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        side: const BorderSide(
                            color: Color(0xFF72717A),
                            width: 2,
                            strokeAlign: -1),
                        onChanged: (value) {
                          setState(
                            () {
                              isCardChecked = !isCardChecked;
                            },
                          );
                        },
                      ),
                      const Text(
                        "My billing address is the same as my \nshipping address",
                        style: TextStyle(
                          letterSpacing: 0.01,
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Gap(16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: const Color(0xFFD4D6DD),
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    16,
                  ),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedPayMethod = 2;
                          });
                        },
                        child: selectedPayMethod == 2
                            ? SvgPicture.asset(
                                "assets/RadioButtonOn.svg",
                              )
                            : SvgPicture.asset(
                                "assets/RadioButtonOff.svg",
                              ),
                      ),
                      const Gap(8),
                      const Text(
                        "Apple Pay",
                        style: TextStyle(
                          color: Color(0xFF71727A),
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    style: TextButton.styleFrom(),
                    onPressed: () {},
                    child: const Text(
                      "+  Add new card",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF006FFD),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                          checkColor: Colors.white,
                          value: isAppleChecked,
                          activeColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          side: const BorderSide(
                              color: Color(0xFF72717A),
                              width: 2,
                              strokeAlign: -1),
                          onChanged: (value) {
                            setState(() {
                              isAppleChecked = !isAppleChecked;
                            });
                          }),
                      const Text(
                        "My billing address is the same as my \nshipping address",
                        style: TextStyle(
                          letterSpacing: 0.01,
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ],
              ),
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
              buttonText: "Continue",
              onTap: () {
                setState(
                  () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => const Settings(),
                    //     ));
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
