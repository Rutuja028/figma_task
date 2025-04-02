import 'package:figma_task/views/e_commerce_pg1.dart';
import 'package:gap/gap.dart';
// import 'package:figma_task/views/e_commerce_pg2.dart';
import '../components/elevated_button.dart';

import 'package:flutter/material.dart';

class YourBag extends StatefulWidget {
  const YourBag({super.key});

  @override
  State<YourBag> createState() => _YourBagState();
}

class OptionItem {
  final String title;
  final String subtitle;
  final String description;
  OptionItem(this.title, this.subtitle, this.description);
}

class _YourBagState extends State<YourBag> {
  List<OptionItem> allProducts = [
    OptionItem('Amazing T-Shirt', '\u{20AC} ${12.00}', 'Black / M'),
    OptionItem('Fabulous Pants', '\u{20AC} ${15.00}', 'Blue / 42'),
    OptionItem('Fantastic Jacket', '\u{20AC} ${17.00}', 'Gold / L'),
    OptionItem('Spectacular Dress', '\u{20AC} ${12.00}', 'Blue / M'),
    OptionItem('Elegant Shoes', '\u{20AC} ${18.00}', 'Green / 32'),
    OptionItem('Classic Crop Top', '\u{20AC} ${20.00}', 'Red / 28'),
    OptionItem('Classic Crop Top', '\u{20AC} ${20.00}', 'Red / 28'),
    OptionItem('Classic Crop Top', '\u{20AC} ${20.00}', 'Red / 28'),
    OptionItem('Classic Crop Top', '\u{20AC} ${20.00}', 'Red / 28'),
    OptionItem('Classic Crop Top', '\u{20AC} ${20.00}', 'Red / 28'),
    OptionItem('Classic Crop Top', '\u{20AC} ${20.00}', 'Red / 28'),
    OptionItem('Classic Crop Top', '\u{20AC} ${20.00}', 'Red / 28'),
    OptionItem('Classic Crop Top', '\u{20AC} ${20.00}', 'Red / 28'),
    OptionItem('Classic Crop Top', '\u{20AC} ${20.00}', 'Red / 28'),
    OptionItem('Classic Crop Top', '\u{20AC} ${20.00}', 'Red / 28'),
    OptionItem('Classic Crop Top', '\u{20AC} ${20.00}', 'Red / 28'),
    OptionItem('Classic Crop Top', '\u{20AC} ${20.00}', 'Red / 28'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Row(
              children: [
                Text(
                  "Total",
                  style: TextStyle(
                    color: Color(0xFF71727A),
                  ),
                ),
                Spacer(),
                Text(
                  "\u{20AC} ${84.00}",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            const Gap(16),
            SizedBox(
              height: 50,
              width: 380,
              child: PrimaryButton(
                buttonText: "Checkout",
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const Subscription(),
                  //   ),
                  // );
                },
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) => const ECommercePg1(),
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF006FFD),
          ),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Your bag",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            letterSpacing: 0,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(24),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: allProducts.length,
        itemBuilder: (context, index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(
                "assets/project_image.png",
                fit: BoxFit.fill,
                height: 100,
                width: 90,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        allProducts[index].title,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Gap(4),
                      Text(
                        allProducts[index].description,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Gap(9),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 24,
                                  width: 24,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFFEAF2FF),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "-",
                                      style: TextStyle(
                                        color: Color(0xFF006FFD),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const Gap(4),
                              const Text(
                                "1",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              const Gap(4),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 24,
                                  width: 24,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFFEAF2FF),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "+",
                                      style: TextStyle(
                                        color: Color(0xFF006FFD),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            allProducts[index].subtitle,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
