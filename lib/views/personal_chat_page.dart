import 'package:figma_task/views/chat_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class PersonalChatPage extends StatefulWidget {
  const PersonalChatPage({super.key});

  @override
  State<PersonalChatPage> createState() => _PersonalChatPageState();
}

class PersonalChatMessage {
  final String name;
  final String msg;
  final DateTime msgTime;

  PersonalChatMessage(this.name, this.msg, this.msgTime);
}

class _PersonalChatPageState extends State<PersonalChatPage> {
  final TextEditingController typeMessage = TextEditingController();
  List<PersonalChatMessage> chats = [
    PersonalChatMessage(
      'Brooke',
      "Hey Lucas!",
      DateTime(2025, 4, 3, 6, 45),
    ),
    PersonalChatMessage(
      'Lucas',
      "Hi Brooke!",
      DateTime(2025, 4, 3, 6, 46),
    ),
    PersonalChatMessage(
      'Brooke',
      "How's your project going?",
      DateTime(2025, 4, 3, 6, 47),
    ),
    PersonalChatMessage(
      'Lucas',
      "It's going well. Thanks for asking!",
      DateTime(2025, 4, 3, 6, 48),
    ),
    PersonalChatMessage(
      'Brooke',
      "No worries. Let me know if you need, any help 😉",
      DateTime(2025, 4, 3, 6, 49),
    ),
  ];

  @override
  void initState() {
    super.initState();
    chats.sort(
      (a, b) {
        return b.msgTime.compareTo(a.msgTime);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) => const ChatList(),
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF006FFD),
          ),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Brooke Davis",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            letterSpacing: 0,
          ),
        ),
        actionsPadding: const EdgeInsets.only(right: 8),
        actions: [
          Image.asset(
            "assets/Avatar.png",
            height: 40,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              itemCount: chats.length,
              itemBuilder: (context, index) {
                return Align(
                  alignment: chats[index].name == "Brooke"
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: chats[index].name == "Brooke"
                          ? const Color(0xFFF8F9FE)
                          : const Color(0xFF006FFD),
                    ),
                    child: chats[index].name == "Brooke"
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                chats[index].name,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                chats[index].msg,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                chats[index].name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                chats[index].msg,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon:
                      const Icon(Icons.add, color: Color(0xFF006FFD), size: 28),
                ),
                const Gap(14),
                Expanded(
                  child: TextField(
                    controller: typeMessage,
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: const Color(0xFFF8F9FE),
                      filled: true,
                      suffixIcon: InkWell(
                        onTap: () {
                          if (typeMessage.text.trim().isNotEmpty) {
                            setState(
                              () {
                                chats.insert(
                                  0,
                                  PersonalChatMessage(
                                    'Lucas',
                                    typeMessage.text.trim(),
                                    DateTime(
                                      2025,
                                    ),
                                  ),
                                );
                                typeMessage.clear();
                              },
                            );
                          }
                        },
                        child: SvgPicture.asset(
                          "assets/msg_send.svg",
                          width: 32,
                          height: 32,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
