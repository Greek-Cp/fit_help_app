import 'package:fit_help_app/component/ComponentText.dart';
import 'package:fit_help_app/util/list_color.dart';
import 'package:fit_help_app/util/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageChat extends StatefulWidget {
  static String? routeName = "/PageChat";
  @override
  State<PageChat> createState() => _PageChatState();
}

class ChatMessage {
  final String text;
  final String sender;
  final DateTime time;

  ChatMessage({required this.text, required this.sender, required this.time});
}

class Bubble extends StatelessWidget {
  final String message;
  final bool isMe;
  final DateTime time;

  const Bubble({required this.message, required this.isMe, required this.time});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        isMe
            ? Container(
                margin: EdgeInsets.symmetric(vertical: 4.0),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: isMe ? Colors.blue : Colors.grey[300],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Text(
                  message,
                  textAlign: isMe ? TextAlign.left : TextAlign.left,
                  style: TextStyle(
                    color: isMe ? Colors.white : Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              )
            : Container(
                width: 200,
                margin: EdgeInsets.symmetric(vertical: 4.0),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: isMe ? Colors.blue : Colors.grey[300],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Text(
                  message,
                  textAlign: isMe ? TextAlign.right : TextAlign.left,
                  style: TextStyle(
                    color: isMe ? Colors.white : Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ),
        Padding(
          padding: EdgeInsets.only(top: 4.0, left: 8.0, right: 8.0),
          child: Text(
            '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12.0,
            ),
          ),
        ),
      ],
    );
  }
}

class TextInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type your message...',
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(8.0),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              // Add functionality to send the message
            },
          ),
        ],
      ),
    );
  }
}

class _PageChatState extends State<PageChat> {
  final List<ChatMessage> messages = [
    ChatMessage(
      text: 'Hi theretherethersssadsathere dsdsadsadsadsadsaHi !',
      sender: 'User1',
      time: DateTime.now().subtract(Duration(minutes: 5)),
    ),
    ChatMessage(
      text:
          'Hi theretherethersssadsathere dsdsadsadsadsadsaHi theretherethersssadsathere dsdsadsadsadsadsa!',
      sender: 'User2',
      time: DateTime.now().subtract(Duration(minutes: 3)),
    ),
    ChatMessage(
      text: 'How are you?',
      sender: 'User1',
      time: DateTime.now().subtract(Duration(minutes: 2)),
    ),
    ChatMessage(
      text: "I'm good. Thanks!",
      sender: 'User2',
      time: DateTime.now().subtract(Duration(minutes: 1)),
    ),
    ChatMessage(
      text:
          'Hi theretherethersssadsathere dsdsadsadsadsadsaHi theretherethersssadsathere dsdsadsadsadsadsa!',
      sender: 'User2',
      time: DateTime.now().subtract(Duration(minutes: 3)),
    ),
    ChatMessage(
      text: 'How are you?',
      sender: 'User1',
      time: DateTime.now().subtract(Duration(minutes: 2)),
    ),
    ChatMessage(
      text: "I'm good. Thanks!",
      sender: 'User2',
      time: DateTime.now().subtract(Duration(minutes: 1)),
    ),
    ChatMessage(
      text:
          'Hi theretherethersssadsathere dsdsadsadsadsadsaHi theretherethersssadsathere dsdsadsadsadsadsa!',
      sender: 'User2',
      time: DateTime.now().subtract(Duration(minutes: 3)),
    ),
    ChatMessage(
      text: 'How are you?',
      sender: 'User1',
      time: DateTime.now().subtract(Duration(minutes: 2)),
    ),
    ChatMessage(
      text: "I'm good. Thanks!",
      sender: 'User2',
      time: DateTime.now().subtract(Duration(minutes: 1)),
    ),
    // Add more messages as needed
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: ScreenUtilInit(
        builder: (context, child) {
          return Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 30, bottom: 20),
                color: ColorApp.primary,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                    CircleAvatar(
                      backgroundColor: Colors.red,
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ComponentTextPrimaryTittleBold(
                          teks: "Gloria Borger",
                          size: SizeApp.SizeTextDescription.sp,
                          colorText: Colors.white,
                        ),
                        ComponentTextPrimaryDescriptionRegular(
                          teks: "Online",
                          size: SizeApp.SizeTextDescription.sp,
                          colorText: Colors.white,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    final message = messages[index];
                    return Container(
                      padding: EdgeInsets.all(8.0),
                      alignment: message.sender == 'User1'
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Bubble(
                        message: message.text,
                        isMe: message.sender == 'User1',
                        time: message.time,
                      ),
                    );
                  },
                ),
              ),
              Divider(height: 1.0),
              Container(
                decoration: BoxDecoration(color: Theme.of(context).cardColor),
                child: TextInputField(),
              ),
            ],
          );
        },
      ),
    );
  }
}
