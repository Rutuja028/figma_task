import 'dart:math';

import 'package:flutter/material.dart';

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
    {'name': 'Amazing Shoes', 'price': '12.00'},
    {'name': 'Fabulous Shoes', 'price': '15.00'},
    {'name': 'Fantastic Shoes', 'price': '15.00'},
    {'name': 'Spectacular Shoes', 'price': '12.00'},
    {'name': 'Elegant Shoes', 'price': '18.00'},
    {'name': 'Classic Shoes', 'price': '20.00'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: SearchBar(
          backgroundColor:
              MaterialStatePropertyAll<Color>(const Color(0xFFF8F9FE)),
          // elevation:,
          hintText: 'Search',
          elevation: MaterialStatePropertyAll<double>(0),
          leading: const Icon(Icons.search_rounded),
          controller: _searchController,
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        // childrenDelegate: SliverChildBuilderDelegate((context, index) {
        //   return Column(
        //     children: [
        //       const Icon(
        //         Icons.image,
        //       ),
        //       // ...allProducts.asMap().entries.map(e){
        //       //   return Container();
        //       // }
        //       //Text(allProducts[index].name)
        //       const Gap(16),

        //       Text(allProducts[index]['name']),
        //       const Gap(4),
        //       Text(allProducts[index]['price']),
        //     ],
        //   );
        // }),
      ),
    );
  }
}
