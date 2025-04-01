import 'package:flutter/material.dart';

import 'package:figma_task/views/chat_list.dart';
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

class NavigationIndex {
  final Widget pageName;
  NavigationIndex(this.pageName);
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
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
            Stack(
              children: [
                const CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage(
                    "assets/Avatar.png",
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: SvgPicture.asset(
                    "assets/Edit.svg",
                  ),
                ),
              ],
            ),
            const Align(
              alignment: Alignment.center,
              child: Text("Lucas Scott",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  )),
            ),
            const Align(
              alignment: Alignment.center,
              child: Text("@lucasscott3",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF71727A),
                  )),
            ),
            const Gap(41),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: Color(0xFFD4D6DD),
                  );
                },
                itemCount: options.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      options[index].title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    trailing: SvgPicture.asset("assets/forwardArrow.svg"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
