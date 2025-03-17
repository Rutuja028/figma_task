import 'package:figma_task/views/onboarding_page2.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../components/elevated_button.dart';

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
      bottomSheet: BottomSheet(
        builder: (context2) {
          return Stack(
            children: [
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
                  height: 250,
                  autoPlay: false,
                  scrollDirection: Axis.horizontal,
                  initialPage: 0,
                ),
                items: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 10),
                        const Text("Create a prototype in just a few minutes",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            )),
                        const SizedBox(height: 20),
                        const Text(
                            "Enjoy these pre-made components and worry only about creating the best product ever.",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            )),
                        const SizedBox(height: 30),
                        PrimaryButton(
                          buttonText: "Next",
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const OnBoarding2(),
                                ));
                          },
                          buttonHeight: 40,
                          buttonWidth: 350,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 10),
                        const Text("Create a prototype in just a few minutes",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            )),
                        const SizedBox(height: 20),
                        const Text(
                            "Enjoy these pre-made components and worry only about creating the best product ever.",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            )),
                        const SizedBox(height: 30),
                        PrimaryButton(
                          buttonText: "Next",
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const OnBoarding2()));
                          },
                          buttonHeight: 40,
                          buttonWidth: 350,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 10),
                        const Text("Create a prototype in just a few minutes",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            )),
                        const SizedBox(height: 20),
                        const Text(
                            "Enjoy these pre-made components and worry only about creating the best product ever.",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            )),
                        const SizedBox(height: 30),
                        PrimaryButton(
                          buttonText: "Next",
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const OnBoarding2()));
                          },
                          buttonHeight: 40,
                          buttonWidth: 350,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
            ],
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
