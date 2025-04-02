import 'package:figma_task/models/e_com_model.dart';
import 'package:figma_task/views/your_bag_page.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:figma_task/components/elevated_button.dart';
import 'package:figma_task/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ECommercePg2 extends StatefulWidget {
  final ProductModel model;
  const ECommercePg2({
    super.key,
    required this.model,
  });

  @override
  State<ECommercePg2> createState() => _ECommercePg2State();
}

class _ECommercePg2State extends State<ECommercePg2> {
  int pageIndex = 0;
  bool isLiked = false;
  Color? selectBadge;
  List<String> selectedSizeChips = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
        child: SizedBox(
          height: 48,
          child: PrimaryButton(
            buttonText: "+ Add to bag",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const YourBag(),
                ),
              );
            },
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    onPageChanged: (ind, _) {
                      setState(() {
                        pageIndex = ind;
                      });
                    },
                    height: 375,
                    viewportFraction: 1,
                    initialPage: 1,
                  ),
                  items: [
                    Image.asset(
                      "assets/ecom_carousel.png",
                      fit: BoxFit.fitHeight,
                    ),
                    Image.asset(
                      "assets/ecom_carousel.png",
                      fit: BoxFit.fitHeight,
                    ),
                    Image.asset(
                      "assets/ecom_carousel.png",
                      fit: BoxFit.fitHeight,
                    ),
                    Image.asset(
                      "assets/ecom_carousel.png",
                      fit: BoxFit.fitHeight,
                    ),
                    Image.asset(
                      "assets/ecom_carousel.png",
                      fit: BoxFit.fitHeight,
                    ),
                  ],
                ),
                Positioned(
                  bottom: 15,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                      (int ind) => Container(
                        height: 8,
                        margin: const EdgeInsets.only(right: 5),
                        width: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: pageIndex == ind
                              ? const Color(0xFF006FFD)
                              : const Color(0xFFC5C6CC),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Gap(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.model.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                  icon: isLiked
                      ? const Icon(Icons.favorite_outlined, color: Colors.red)
                      : const Icon(Icons.favorite_outline_rounded),
                ),
              ],
            ),
            const Gap(8),
            Text(
              widget.model.price,
              // '\u{20AC} ${12}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const Gap(24),
            Text(
              widget.model.description,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF71727A),
              ),
            ),
            const Gap(40),
            const Text(
              "Size",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
            ),
            Wrap(
              alignment: WrapAlignment.start,
              children: Constants.sizeChips.map(
                (value) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
                    child: InkWell(
                      onTap: () {
                        if (selectedSizeChips.contains(value)) {
                          // unselectIt
                          selectedSizeChips.remove(value);
                          setState(() {});
                        } else {
                          // selectIt
                          selectedSizeChips.add(value);
                          setState(() {});
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 12),
                        decoration: BoxDecoration(
                          color: selectedSizeChips.contains(value)
                              ? const Color(0xFF006FFD)
                              : const Color(0xFFEAF2FF),
                          shape: BoxShape.rectangle,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                        child: Text(
                          value,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                            color: selectedSizeChips.contains(value)
                                ? Colors.white
                                : const Color(0xFF006FFD),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
            const Gap(32),
            const Text(
              "Color",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
            ),
            Wrap(
              alignment: WrapAlignment.start,
              children: Constants.colorChips.map(
                (value) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectBadge = value;
                        });
                      },
                      child: selectBadge == value
                          ? Badge(
                              backgroundColor: Colors.transparent,
                              label: SvgPicture.asset("assets/badge.svg",
                                  height: 16),
                              isLabelVisible: true,
                              child: Container(
                                height: 32,
                                width: 32,
                                decoration: BoxDecoration(
                                  color: value,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(16),
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              height: 32,
                              width: 32,
                              decoration: BoxDecoration(
                                color: value,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(16),
                                ),
                              ),
                            ),
                    ),
                  );
                },
              ).toList(),
            ),
            const Gap(24),
          ],
        ),
      ),
    );
  }
}
