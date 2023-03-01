import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/widget/icon_button_widget.dart';
import '../../domain/model.dart';
import '../widget/chat_bubble_receiver.dart';
import '../widget/chat_bubble_sender.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final chatTextController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  bool isSending = false;

  List<ChatMessage> messages = [
    ChatMessage(
      messageContent: "Hello",
      messageType: "receiver",
      time: '13.23',
      day: 'Older',
    ),
    ChatMessage(
      messageContent: "Hi Harry, How have you been?",
      messageType: "sender",
      time: '13.23',
      day: 'Yesterday',
    ),
    ChatMessage(
      messageContent:
          "I am good. I was planning to swing by for a cup of coffee. Are you at home?",
      messageType: "receiver",
      time: '13.24',
      day: 'Yesterday',
    ),
    ChatMessage(
      messageContent: "That's great. I am waiting.",
      messageType: "sender",
      time: '13.25',
      day: 'Yesterday',
    ),
    ChatMessage(
      messageContent: "Perfect",
      messageType: "receiver",
      time: '13.30',
      day: 'Today',
    ),
  ]; //chang
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: CustomIconButton(
                    buttonIcon: Icons.arrow_back_ios,
                    onTapHandler: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: messages.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              itemBuilder: (context, index) {
                Widget separator = const SizedBox();
                if (index == 0) {
                  separator = SizedBox(
                    height: 20,
                    child: Text(
                      messages[index].day,
                    ),
                  );
                }
                if (index != 0 &&
                    messages[index].day != messages[index - 1].day) {
                  separator = SizedBox(
                    height: 20,
                    child: Text(
                      messages[index].day,
                    ),
                  );
                }

                return Column(
                  children: [
                    Align(alignment: Alignment.center, child: separator),
                    messages[index].messageType == "receiver"
                        ? ChatBubbleReceiver(message: messages[index])
                        : ChatBubbleSender(message: messages[index]),
                  ],
                );
              },
            ),
          ),
          SizedBox(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 2, 12, 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: chatTextController,
                      decoration: InputDecoration(
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        hintText: 'Type something here...',
                      ),
                      onSubmitted: (value) {
                        if (value.replaceAll(' ', '').isNotEmpty) {
                          setState(() {
                            var newMessage = ChatMessage(
                              messageContent: value,
                              messageType: "sender",
                              time: DateFormat('hh:mm').format(DateTime.now()),
                              day: 'Today',
                            );
                            messages.add(newMessage);
                            chatTextController.text = "";
                            _scrollController.animateTo(
                              _scrollController.position.maxScrollExtent,
                              curve: Curves.easeOut,
                              duration: const Duration(milliseconds: 300),
                            );
                          });
                        } else {
                          chatTextController.text = "";
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
