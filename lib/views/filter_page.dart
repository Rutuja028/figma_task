import 'package:figma_task/components/elevated_button.dart';
import 'package:figma_task/components/expansion_tile.dart';
import 'package:figma_task/components/price_range_expansion_tile.dart';
import 'package:figma_task/views/e_commerce_pg1.dart';
// import 'package:figma_task/views/searchPage.dart';
import 'package:flutter/material.dart';

import 'package:figma_task/constants.dart';
import 'package:gap/gap.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 48,
          width: 380,
          child: PrimaryButton(
            buttonText: "Apply Filters",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ECommercePg1(),
                ),
              );
            },
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          child: const Text(
            "Cancel",
            maxLines: 1,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF006FFD),
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
              filterValues: Constants.categoryFiltersList,
            ),
            RangeExpansionTile(
              rangeTitle: "Price Range",
              // rangeValues: Constants.priceList,
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
