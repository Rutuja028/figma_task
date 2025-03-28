import 'package:flutter/material.dart';

class FilterExpansionTile extends StatefulWidget {
  final String filterTitle;
  final List<String> filterValues;
  const FilterExpansionTile(
      {super.key, required this.filterTitle, required this.filterValues});

  @override
  State<FilterExpansionTile> createState() => _FilterExpansionTileState();
}

class _FilterExpansionTileState extends State<FilterExpansionTile> {
  List<String> selectedValues = [];
  bool isExpansionTrue = true;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      onExpansionChanged: (isExpansionTrue) {},
      childrenPadding: const EdgeInsets.only(bottom: 10),
      tilePadding: const EdgeInsets.all(0),
      title: Text(widget.filterTitle),
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
        Wrap(
          runSpacing: 10,
          spacing: 10,
          children: widget.filterValues.map<Widget>((element) {
            return InkWell(
              onTap: () {
                if (selectedValues.contains(element)) {
                  selectedValues.remove(element);
                  setState(() {});
                } else {
                  selectedValues.add(element);
                  setState(() {});
                }
                setState(() {});
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 8,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(16),
                  color: selectedValues.contains(element)
                      ? const Color(0xFF006FFD)
                      : const Color(0xFFEAF2FF),
                ),
                child: Text(
                  element,
                  style: TextStyle(
                    letterSpacing: 0.05,
                    color: selectedValues.contains(element)
                        ? const Color(0xFFEAF2FF)
                        : const Color(0xFF006FFD),
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
