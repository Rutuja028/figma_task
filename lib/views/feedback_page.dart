import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

class ProjFeedback extends StatefulWidget {
  const ProjFeedback({super.key});

  @override
  State<ProjFeedback> createState() => _ProjFeedbackState();
}

class _ProjFeedbackState extends State<ProjFeedback> {
  bool selectedStar = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Feedback"),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Your project is finished.",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            const Text(
              "How would you rate the prototyping kit? ",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF71727A)),
            ),

            /// 5 star in row

            Row(children: [
              GestureDetector(
                onTap: () {
                  selectedStar = !selectedStar;
                },
                child: selectedStar
                    ? SvgPicture.asset("assets/star_outlined.svg")
                    : SvgPicture.asset("assets/star_filled.svg"),
              ),
              GestureDetector(
                onTap: () {
                  selectedStar = !selectedStar;
                },
                child: selectedStar
                    ? SvgPicture.asset("assets/star_outlined.svg")
                    : SvgPicture.asset("assets/star_filled.svg"),
              ),
              GestureDetector(
                onTap: () {
                  selectedStar = !selectedStar;
                },
                child: selectedStar
                    ? SvgPicture.asset("assets/star_outlined.svg")
                    : SvgPicture.asset("assets/star_filled.svg"),
              ),
              GestureDetector(
                onTap: () {
                  selectedStar = !selectedStar;
                },
                child: selectedStar
                    ? SvgPicture.asset("assets/star_outlined.svg")
                    : SvgPicture.asset("assets/star_filled.svg"),
              ),
              GestureDetector(
                onTap: () {
                  selectedStar = !selectedStar;
                },
                child: selectedStar
                    ? SvgPicture.asset("assets/star_outlined.svg")
                    : SvgPicture.asset("assets/star_filled.svg"),
              ),
            ]),

            const Text(
              "What did you like about it?",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
            ),

            ///TextButtons next to each other
            ///
            ///
            ///
            const Text(
              "What could be improved?",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
            ),

            ///            ///TextButtons next to each other

            const Text(
              "Anything else?",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
            ),

            ////TextField
            ///
            ///primary button
          ],
        ));
  }
}
