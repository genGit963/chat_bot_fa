import 'package:chat_bot/Models/message_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:chat_bot/widgets/appbar_leading_icons.dart';

class ChatScreen extends StatelessWidget {
  static Route route(MessageModelData data) => MaterialPageRoute(
        builder: (context) => ChatScreen(messageDataChat: data),
      );

  const ChatScreen({Key? key, required this.messageDataChat}) : super(key: key);

  final MessageModelData messageDataChat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            messageDataChat.senderName
          ),
          leadingWidth: 54,
          leading: Align(
            alignment: Alignment.centerRight,
            child: IconBackgroundLeading(
              icon: CupertinoIcons.back,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
    ));
  }
}
