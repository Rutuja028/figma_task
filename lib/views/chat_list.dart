import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class ChatItems {
  final String name;
  final String message;

  ChatItems(this.name, this.message);
}

class _ChatListState extends State<ChatList> {
  int _selectedInd = 0;
  void _onChatTapped(int ind) {
    setState(() {
      _selectedInd = ind;
    });
  }

  List<ChatItems> chatItems = [
    ChatItems("Haley James", "Stand up for what you believe in"),
    ChatItems("Nathan Scott",
        "One day you’re seventeen and planning for\nsomeday. And then quietly and without..."),
    ChatItems("Haley James", "Stand up for what you believe in"),
    ChatItems("Nathan Scott",
        "One day you’re seventeen and planning for\nsomeday. And then quietly and without..."),
    ChatItems("Haley James", "Stand up for what you believe in"),
    ChatItems("Nathan Scott",
        "One day you’re seventeen and planning for\nsomeday. And then quietly and without..."),
    ChatItems("Haley James", "Stand up for what you believe in"),
    ChatItems("Nathan Scott",
        "One day you’re seventeen and planning for\nsomeday. And then quietly and without..."),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            leading: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Color(0xFF006FFD),
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
                      ColorFilter.mode(Color(0xFF006FFD), BlendMode.dst),
                ),
              )
            ]),
        body: Padding(
          padding: EdgeInsets.only(
            top: 19.5,
            bottom: 16,
            left: 16,
            right: 16,
          ),
          child: Column(
            children: [
              SearchBar(
                elevation: WidgetStatePropertyAll(0),
                backgroundColor: WidgetStatePropertyAll(Color(0xFFF8F9FE)),
                leading: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                  ),
                ),
                hintText: "Search",
                controller: TextEditingController(),
              ),
              Expanded(
                child: ListView(
                  children: chatItems.asMap().entries.map(
                    (e) {
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: ListTile(
                          tileColor: Colors.white,
                          onTap: () {},
                          leading: Image.asset("assets/chat_profile.png"),
                          title: Text(
                            e.value.name,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          subtitle: Text(
                            e.value.message,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF71727A),
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          onTap: _onChatTapped,
          currentIndex: _selectedInd,
          backgroundColor: Colors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/Icon.svg"),
              activeIcon: SvgPicture.asset(
                "assets/Icon.svg",
                colorFilter:
                    ColorFilter.mode(Color(0xFF006FFD), BlendMode.srcIn),
              ),
              label: "Chats",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/friends.svg",
              ),
              activeIcon: SvgPicture.asset(
                "assets/friends.svg",
                colorFilter: ColorFilter.mode(
                  Color(0xFF006FFD),
                  BlendMode.srcIn,
                ),
              ),
              label: "Settings",
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                "assets/settings.svg",
              ),
              icon: SvgPicture.asset(
                "assets/settings.svg",
                colorFilter: ColorFilter.mode(
                  Color(0xFF006FFD),
                  BlendMode.srcIn,
                ),
              ),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}
