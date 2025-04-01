import 'package:figma_task/views/settings_2.dart';
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

class ChatBottomNavigate {
  final Widget chatBottomPage;
  ChatBottomNavigate(this.chatBottomPage);
}

class _ChatListState extends State<ChatList> {
  List<ChatItems> chatItems = [
    ChatItems("Haley James", "Stand up for what you believe in"),
    ChatItems("Nathan Scott",
        "One day you’re seventeen and planning for someday. And then quietly and without..."),
    ChatItems("Haley James", "Stand up for what you believe in"),
    ChatItems("Nathan Scott",
        "One day you’re seventeen and planning for someday. And then quietly and without..."),
    ChatItems("Haley James", "Stand up for what you believe in"),
    ChatItems("Nathan Scott",
        "One day you’re seventeen and planning for someday. And then quietly and without..."),
    ChatItems("Haley James", "Stand up for what you believe in"),
    ChatItems("Nathan Scott",
        "One day you’re seventeen and planning for someday. And then quietly and without..."),
  ];

  List<ChatBottomNavigate> pageList = [
    ChatBottomNavigate(const ChatList()),
    ChatBottomNavigate(Container()),
    ChatBottomNavigate(const Settings()),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 50,
            width: 380,
            child: SearchBar(
              elevation: const WidgetStatePropertyAll(0),
              backgroundColor: const WidgetStatePropertyAll(Color(0xFFF8F9FE)),
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                ),
              ),
              hintText: "Search",
              // controller: TextEditingController(),
            ),
          ),
          Expanded(
            child: ListView(
              children: chatItems.asMap().entries.map(
                (e) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 16, left: 10, right: 10),
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
    );
  }
}
