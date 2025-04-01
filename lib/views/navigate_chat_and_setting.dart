import 'package:figma_task/views/chat_list.dart';
import 'package:figma_task/views/settings_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatAndSettingNavigation extends StatefulWidget {
  const ChatAndSettingNavigation({super.key});

  @override
  State<ChatAndSettingNavigation> createState() =>
      _ChatAndSettingNavigationState();
}

class _ChatAndSettingNavigationState extends State<ChatAndSettingNavigation> {
  List<Widget> pageList = [
    const ChatList(),
    const Center(child: Text("Friends Page")),
    const Settings(),
  ];

  int _selectedInd = 0;
  void _onChatTapped(int ind) {
    setState(
      () {
        _selectedInd = ind;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
          elevation: 0,
          onDestinationSelected: _onChatTapped,
          selectedIndex: _selectedInd,
          backgroundColor: Colors.white,
          indicatorColor: Colors.white,
          destinations: <Widget>[
            NavigationDestination(
              icon: SvgPicture.asset(
                "assets/Icon.svg",
                colorFilter:
                    const ColorFilter.mode(Color(0xFFD4D6DD), BlendMode.srcIn),
              ),
              selectedIcon: SvgPicture.asset(
                "assets/Icon.svg",
                colorFilter:
                    const ColorFilter.mode(Color(0xFF006FFD), BlendMode.srcIn),
              ),
              label: 'Chats',
            ),
            NavigationDestination(
                icon: SvgPicture.asset(
                  "assets/friends.svg",
                  colorFilter: const ColorFilter.mode(
                      Color(0xFFD4D6DD), BlendMode.srcIn),
                ),
                selectedIcon: SvgPicture.asset(
                  "assets/friends.svg",
                  colorFilter: const ColorFilter.mode(
                      Color(0xFF006FFD), BlendMode.srcIn),
                ),
                label: 'Friends'),
            NavigationDestination(
                icon: SvgPicture.asset(
                  "assets/settings.svg",
                  colorFilter: const ColorFilter.mode(
                      Color(0xFFD4D6DD), BlendMode.srcIn),
                ),
                selectedIcon: SvgPicture.asset(
                  "assets/settings.svg",
                  colorFilter: const ColorFilter.mode(
                      Color(0xFF006FFD), BlendMode.srcIn),
                ),
                label: 'Settings')
          ]),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: const Color(0xFF006FFD),
          ),
          child: const Text("Edit",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
          onPressed: () {},
        ),
        centerTitle: true,
        title: const Text(
          "Chats",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/chat-edit.svg",
              colorFilter:
                  const ColorFilter.mode(Color(0xFF006FFD), BlendMode.dst),
            ),
          )
        ],
      ),
      body: pageList[_selectedInd],
    );
  }
}
