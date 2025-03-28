import 'package:figma_task/components/expansion_tile.dart';
import 'package:flutter/material.dart';

import 'package:figma_task/constants.dart';
import 'package:flutter/services.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: TextButton(
          onPressed: () {},
          child: const Center(
            child: Text(
              "Cancel",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF006FFD),
              ),
            ),
          ),
        ),
        title: const Text(
          "Filter",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1F1F1F),
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Clear All",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF006FFD),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            FilterExpansionTile(
              filterTitle: "Category",
              filterValues: Constants.colorFilters,
            ),
            FilterExpansionTile(
              filterTitle: "Price Range",
              filterValues: Constants.priceList,
            ),
            FilterExpansionTile(
              filterTitle: "Color",
              filterValues: Constants.colorFilters,
            ),
            FilterExpansionTile(
              filterTitle: "Size",
              filterValues: Constants.colorFilters,
            ),
            FilterExpansionTile(
              filterTitle: "Customer Review",
              filterValues: Constants.colorFilters,
            ),
          ],
        ),
      ),
    );
  }
}
