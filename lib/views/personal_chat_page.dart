import 'package:figma_task/views/chat_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class PersonalChatPage extends StatefulWidget {
  const PersonalChatPage({super.key});

  @override
  State<PersonalChatPage> createState() => _PersonalChatPageState();
}

class PersonalChat {
  final String name;
  final String msg;

  PersonalChat(
    this.name,
    this.msg,
  );
}

class _PersonalChatPageState extends State<PersonalChatPage> {
  final TextEditingController typeMessage = TextEditingController();
  List<PersonalChat> chats = [
    PersonalChat('Brooke', "Hey Lucas!"),
    PersonalChat('Lucas', "Hi Brooke!"),
    PersonalChat('Brooke', "How's your project going?"),
    PersonalChat('Lucas', "It's going well. Thanks for asking!"),
    PersonalChat('Brooke', "No worries. Let me know if you need any help 😉"),
  ];

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
        actions: [
          Image.asset(
            "assets/Avatar.png",
            height: 40,
          ),
        ],
      ),
      body: ListView(
        children: [
          ...chats.asMap().entries.map(
            (e) {
              return Container(
                color: e.value.name == "Brooke"
                    ? const Color(0xFFF8F9FE)
                    : const Color(0xFF006FFD),
                child: e.value.name == "Brooke"
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(e.value.name),
                          Text(e.value.msg),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(e.value.name),
                          Text(e.value.msg),
                        ],
                      ),
              );
            },
          ).toList(),
          Row(
            children: [
              const InkWell(
                child: Text(
                  "+",
                  style: TextStyle(
                    fontSize: 16 * 16,
                    color: Color(0xFF006FFD),
                  ),
                ),
              ),
              const Gap(14),
              SizedBox(
                height: 40,
                child: TextField(
                  controller: typeMessage,
                  decoration: InputDecoration(
                    hintText: "Type a message...",
                    fillColor: const Color(0xFFF8F9FE),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          chats.add(PersonalChat(
                            'Lucas',
                            typeMessage.text.trim(),
                          ));
                        });
                      },
                      child: SvgPicture.asset(
                        "assets/msg_send.svg",
                        width: 32,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
