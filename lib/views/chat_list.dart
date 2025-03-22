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
  int _selectedInd = 0;
  void _onChatTapped(int ind) {
    setState(() {
      _selectedInd = ind;

      Navigator.replace(context,
          oldRoute: ModalRoute.of(context)!,
          newRoute: MaterialPageRoute(
              builder: (context) => pageList[ind].chatBottomPage));
    });
  }

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
    ChatBottomNavigate(ChatList()),
    ChatBottomNavigate(Container()),
    ChatBottomNavigate(Settings()),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                  colorFilter: const ColorFilter.mode(
                      Color(0xFFD4D6DD), BlendMode.srcIn),
                ),
                selectedIcon: SvgPicture.asset(
                  "assets/Icon.svg",
                  colorFilter: const ColorFilter.mode(
                      Color(0xFF006FFD), BlendMode.srcIn),
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
        body: Column(
          children: [
            SizedBox(
              height: 50,
              width: 380,
              child: SearchBar(
                elevation: MaterialStatePropertyAll(0),
                backgroundColor: MaterialStatePropertyAll(Color(0xFFF8F9FE)),
                leading: IconButton(
                  onPressed: () {},
                  icon: Icon(
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
      ),
    );
  }
}
