import 'package:figma_task/views/subscription_tile.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  bool isSelected;
  OptionItem(this.title, this.isSelected);
}

class _YourBagState extends State<YourBag> {
  List<Map<String, dynamic>> allProducts = [
    {
      'name': 'Amazing T-Shirt',
      'price': '\u{20AC} ${12}',
      'description':
          'The perfect T-shirt for when you want to feel comfortable but still stylish.Made of 100% cotton fabric in four colours. Perfect for the warmest days.'
    },
    {
      'name': 'Fabulous Pants',
      'price': '\u{20AC} ${15}',
      'description':
          'Stylish and comfortable, perfect for any occasion. Made from premium fabric for a sleek look.'
    },
    {
      'name': 'Fantastic Jacket',
      'price': '\u{20AC} ${17}',
      'description':
          'A modern jacket with a perfect fit, great for layering. Lightweight yet warm.'
    },
    {
      'name': 'Spectacular Dress',
      'price': '\u{20AC} ${12}',
      'description':
          'A versatile and elegant dress that complements any style. Flows beautifully with every step.'
    },
    {
      'name': 'Elegant Shoes',
      'price': '\u{20AC} ${18}',
      'description':
          'Chic and comfortable footwear designed for all-day wear. Enhances any outfit effortlessly.'
    },
    {
      'name': 'Classic Crop Top',
      'price': '\u{20AC} ${20}',
      'description':
          'A trendy and breathable crop top, ideal for casual and stylish looks. Perfect for warm days.'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SizedBox(
          height: 50,
          width: 380,
          child: PrimaryButton(
            buttonText: "Next",
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
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Your bag",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 24, left: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: allProducts.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        title: const Text(""),
                        leading: SizedBox(
                          height: 100,
                          width: 90,
                          child: Image.asset("assets/project_image.png"),
                        ),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Color(0xFFE0E1E7)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        tileColor: Colors.white,
                        selectedTileColor: const Color(0xFFEAF2FF),
                        onTap: () {
                          setState(() {});
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
