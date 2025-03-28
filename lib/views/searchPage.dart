import 'dart:math';

import 'package:figma_task/views/filter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:gap/gap.dart';

class SearchPage1 extends StatefulWidget {
  const SearchPage1({super.key});

  @override
  State createState() => _SearchPage1state();
}

class CardList {
  final String name;
  final String price;
  CardList(this.name, this.price);
}

class _SearchPage1state extends State<SearchPage1> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> allProducts = [
    {'name': 'Amazing Shoes', 'price': '\u{20AC} ${12}'},
    {'name': 'Fabulous Shoes', 'price': '\u{20AC} ${15}'},
    {'name': 'Fantastic Shoes', 'price': '\u{20AC} ${17}'},
    {'name': 'Spectacular Shoes', 'price': '\u{20AC} ${12}'},
    {'name': 'Elegant Shoes', 'price': '\u{20AC} ${18}'},
    {'name': 'Classic Shoes', 'price': '\u{20AC} ${20}'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size(20, 10),
          child: SearchBar(
            backgroundColor:
                const WidgetStatePropertyAll<Color>(Color(0xFFF8F9FE)),
            // elevation:,
            hintText: 'Search',
            elevation: const WidgetStatePropertyAll<double>(0),
            leading: const Icon(Icons.search_rounded),
            controller: _searchController,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFC5C6CC)),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        "assets/left_sort.svg",
                      ),
                      const Gap(10),
                      const Text(
                        "Sort",
                        style: TextStyle(color: Colors.black),
                      ),
                      const Gap(10),
                      SvgPicture.asset(
                        "assets/right_sort.svg",
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
                const Spacer(),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Color(0xFFC5C6CC),
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        "assets/left_filter.svg",
                      ),
                      const Gap(10),
                      const Text(
                        "Filter",
                        style: TextStyle(color: Colors.black),
                      ),
                      const Gap(10),
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF006FFD),
                        ),
                        height: 24,
                        width: 24,
                        child: const Center(
                          child: Text(
                            "1",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FilterPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: allProducts.map(
                  (product) {
                    return Card(
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                      color: const Color(0xFFF8F9FE),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                            child: Image.asset(
                              "assets/image.png",
                              width: double.infinity,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Text(product['name']),
                          Text(product['price']),
                        ],
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
