import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SearchPage1 extends StatefulWidget {
  const SearchPage1({super.key});

  @override
  State createState() => _SearchPage1state();
}

class _SearchPage1state extends State<SearchPage1> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> allProducts = [
    {'name': 'Amazing Shoes', 'price': 12.00},
    {'name': 'Fabulous Shoes', 'price': 15.00},
    {'name': 'Fantastic Shoes', 'price': 15.00},
    {'name': 'Spectacular Shoes', 'price': 12.00},
    {'name': 'Elegant Shoes', 'price': 18.00},
    {'name': 'Classic Shoes', 'price': 20.00},
  ];
  List<Map<String, dynamic>> filteredProducts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: SearchBar(
          // elevation:,
          hintText: 'Search',
          leading: const Icon(Icons.search_rounded),
          controller: _searchController,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: filteredProducts.length,
          itemBuilder: (context, index) {
            final product = filteredProducts[index];
            return Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.image,
                    size: 50,
                    color: Colors.grey,
                  ),
                  const Gap(10),
                  Text(
                    product['name'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Gap(5),
                  Text(
                    '\u{20AC} ${product['price'].toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
