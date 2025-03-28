import 'dart:developer';

import 'package:flutter/material.dart';

class RangeExpansionTile extends StatefulWidget {
  final String rangeTitle;
  // final List<String> rangeValues;
  const RangeExpansionTile({super.key, required this.rangeTitle});

  @override
  State<RangeExpansionTile> createState() => _RangeExpansionTileState();
}

class _RangeExpansionTileState extends State<RangeExpansionTile> {
  List<String> selectedValues = [];
  bool isExpansionTrue = true;
  RangeValues currentRange = const RangeValues(900, 5000);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      onExpansionChanged: (isExpansionTrue) {},
      childrenPadding: const EdgeInsets.only(bottom: 10),
      tilePadding: const EdgeInsets.all(0),
      // title: Text(widget.rangeTitle),
      title: const Text("Price Range"),
      collapsedShape: const Border.symmetric(
        horizontal: BorderSide(
          color: Color(0xFFD4D6DD),
          width: 0,
        ),
      ),
      shape: const Border.symmetric(
        horizontal: BorderSide(
          color: Color(0xFFD4D6DD),
          width: 0,
        ),
      ),
      trailing: selectedValues.isEmpty
          ? null
          : Container(
              height: 24,
              width: 24,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF006FFD),
              ),
              child: Center(
                  child: Text(
                "${selectedValues.length}",
                style: const TextStyle(color: Colors.white),
              )),
            ),
      expandedAlignment: Alignment.centerLeft,
      children: [
        RangeSlider(
          values: currentRange,
          divisions: 10,
          labels: RangeLabels(
            currentRange.start.round().toString(),
            currentRange.end.round().toString(),
          ),
          onChanged: (RangeValues values) {
            log(values.toString());
            setState(
              () {
                currentRange = values;
              },
            );
          },
          // min: 900,
          max: 10000,
        ),
      ],
    );
  }
}
