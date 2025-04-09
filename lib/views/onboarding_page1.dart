import 'package:figma_task/views/onboarding_page2.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gap/gap.dart';
import '../components/elevated_button.dart';

import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomSheet: BottomSheet(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        backgroundColor: Colors.white,
        builder: (context2) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Row(
                      children: List.generate(
                        3,
                        (int index) => Container(
                          margin: const EdgeInsets.only(right: 5),
                          height: 6,
                          width: 6,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: pageIndex == index
                                ? const Color.fromRGBO(0, 111, 253, 1)
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        onPageChanged: (index, _) {
                          setState(() {
                            pageIndex = index;
                          });
                        },
                        viewportFraction: 1,
                        //enlargeCenterPage: false,
                        enableInfiniteScroll: false,
                        height: 190,
                        autoPlay: false,
                        scrollDirection: Axis.horizontal,
                        initialPage: 0,
                      ),
                      items: const [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Gap(24),
                            Text("Create a prototype in just a few minutes",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                )),
                            SizedBox(height: 20),
                            Text(
                              "Enjoy these pre-made components and worry only about creating the best product ever.",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Gap(24),
                            Text("Create a prototype in just a few minutes",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                )),
                            SizedBox(height: 20),
                            Text(
                              "Enjoy these pre-made components and worry only about creating the best product ever.",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Gap(24),
                            Text("Create a prototype in just a few minutes",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                )),
                            SizedBox(height: 20),
                            Text(
                              "Enjoy these pre-made components and worry only about creating the best product ever.",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
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
                          builder: (context) => const OnBoarding2(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
        onClosing: () {},
      ),
      body: Column(
        children: [
          Image.asset("assets/splash_screen.jpg"),
        ],
      ),
    );
  }
}
