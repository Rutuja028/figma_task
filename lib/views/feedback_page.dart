import "package:figma_task/components/elevated_button.dart";
import "package:figma_task/constants.dart";
import "package:figma_task/views/projects_page.dart";
import "package:figma_task/views/searchPage.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:gap/gap.dart";
import '../components/elevated_button.dart';

class ProjFeedback extends StatefulWidget {
  const ProjFeedback({super.key});

  @override
  State<ProjFeedback> createState() => _ProjFeedbackState();
}

class _ProjFeedbackState extends State<ProjFeedback> {
  final TextEditingController _anythingElseController = TextEditingController();
  int rating = 0;

  List<String> selectedLikes = [];
  List<String> selectedImproves = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Feedback",
          style: TextStyle(
            height: 17,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) => const Projects(),
                ));
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xFF006FFD),
          ),
        ),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: ListView(
            children: [
              const Text(
                "Your project is finished.",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Gap(10),
              const Text(
                "How would you rate the prototyping kit? ",
                style: TextStyle(fontSize: 14, color: Color(0xFF71727A)),
              ),
              const Gap(20),
              Row(
                children: List.generate(
                  5,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          setState(
                            () {
                              rating = index + 1;
                            },
                          );
                        },
                        child: rating <= index
                            ? SvgPicture.asset(
                                "assets/star_outlined.svg",
                                height: 30,
                              )
                            : SvgPicture.asset(
                                "assets/star_filled.svg",
                                height: 30,
                              ),
                      ),
                    );
                  },
                ),
              ),
              const Gap(56),
              const Text(
                "What did you like about it?",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Gap(16),
              Wrap(
                alignment: WrapAlignment.start,
                children: Constants.likeList.map(
                  (value) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(top: 8, bottom: 8, right: 8),
                      child: InkWell(
                        onTap: () {
                          if (selectedLikes.contains(value)) {
                            // unselectIt
                            selectedLikes.remove(value);
                            setState(() {});
                          } else {
                            // selectIt
                            selectedLikes.add(value);
                            setState(() {});
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 12),
                          decoration: BoxDecoration(
                            color: selectedLikes.contains(value)
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
                              color: selectedLikes.contains(value)
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
              const Gap(56),
              const Text(
                "What could be improved?",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              ),
              Wrap(
                alignment: WrapAlignment.start,
                children: Constants.improvedList.map(
                  (value) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(top: 8, bottom: 8, right: 8),
                      child: InkWell(
                        onTap: () {
                          if (selectedImproves.contains(value)) {
                            // unselectIt
                            selectedImproves.remove(value);
                            setState(() {});
                          } else {
                            // selectIt
                            selectedImproves.add(value);
                            setState(() {});
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 12),
                          decoration: BoxDecoration(
                            color: selectedImproves.contains(value)
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
                              color: selectedImproves.contains(value)
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
              const Gap(56),
              const Text(
                "Anything else?",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              ),
              const Gap(16),
              SizedBox(
                height: 94,
                child: TextField(
                  controller: _anythingElseController,
                  cursorColor: const Color(0xFF006FFD),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFFC5C6CC))),
                    hintText: 'Tell us everything',
                    hintStyle: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF8F9098),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFFC5C6CC))),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
        child: SizedBox(
          height: 48,
          child: PrimaryButton(
            buttonText: "Submit",
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SearchPage1()));
            },
          ),
        ),
      ),
    );
  }
}
