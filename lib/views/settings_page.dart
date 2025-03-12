import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class OptionItem {
  final String title;
  bool isSelected;
  OptionItem(this.title, this.isSelected);
}

class _SettingsState extends State<Settings> {
  List<OptionItem> options = [
    OptionItem('Saved Messages', false),
    OptionItem('Recent Calls', false),
    OptionItem('Debices', false),
    OptionItem('Notifications', false),
    OptionItem('Appearance', false),
    OptionItem('Language', false),
    OptionItem('Privacy & Security', false),
    OptionItem('Storage', false),
  ];

  bool checkBoxValue = false;
  bool tickIcon = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(right: 24, left: 24),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Gap(43),
                const Align(
                  alignment: Alignment.center,
                  child: Text("Settings",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      )),
                ),
                const Gap(16),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset("assets/Avatar.png"),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text("Lucas Scott",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      )),
                ),
                const Gap(41),
                Expanded(
                  child: ListView.builder(
                      itemCount: options.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Color(0xFFE0E1E7)),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            tileColor: Colors.white,
                            selectedTileColor: const Color(0xFFEAF2FF),
                            selected: options.elementAt(index).isSelected,
                            onTap: () {
                              setState(() {
                                options.elementAt(index).isSelected =
                                    !options.elementAt(index).isSelected;
                              });
                            },
                            title: Text(
                              options.elementAt(index).title,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.arrow_forward_ios),
                              onPressed: () {
                                setState(() {});
                              },
                            ),
                          ),
                        );
                      }),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset("assets/messages.png",
                          width: 120, height: 90),
                      Image.asset("assets/friends.png", width: 120, height: 90),
                      Image.asset("assets/settings.png",
                          width: 120, height: 90),
                    ])
              ]),
        ),
      ),
    );
  }
}
