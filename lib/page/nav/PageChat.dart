import 'package:fit_help_app/component/ComponentText.dart';
import 'package:fit_help_app/controller/DokterController.dart';
import 'package:fit_help_app/page/PageCariDokterAnak.dart';
import 'package:fit_help_app/util/list_color.dart';
import 'package:fit_help_app/util/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Ketikan Pesan Anda...',
                border: InputBorder.none,
                fillColor: Colors.white,
                filled: true,
                focusColor: Colors.white,
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
      text:
          'Halo, bu! Saya Dr. Amanda, dokter anak di sini. Bagaimana saya bisa membantu Anda hari ini?',
      sender: 'Dokter',
      time: DateTime.now().subtract(Duration(minutes: 5)),
    ),
    ChatMessage(
      text:
          'Halo, Dokter. Saya khawatir dengan pertumbuhan anak saya. Dia tampak lebih kecil dari anak-anak seusianya.',
      sender: 'Ibu',
      time: DateTime.now().subtract(Duration(minutes: 3)),
    ),
    ChatMessage(
      text:
          'Apakah Anda sudah memeriksakan anak Anda ke dokter sebelumnya terkait masalah pertumbuhan ini?',
      sender: 'Dokter',
      time: DateTime.now().subtract(Duration(minutes: 2)),
    ),
    ChatMessage(
      text:
          'Ya, saya sudah membawanya ke puskesmas beberapa bulan yang lalu. Namun, tidak ada perubahan yang signifikan dalam pertumbuhannya.',
      sender: 'Ibu',
      time: DateTime.now().subtract(Duration(minutes: 1)),
    ),
    ChatMessage(
      text:
          'Pertumbuhan yang terhambat pada anak dapat menjadi tanda stunting. Apakah Anda memberikan nutrisi yang baik untuk anak Anda?',
      sender: 'Dokter',
      time: DateTime.now().subtract(Duration(minutes: 3)),
    ),
    ChatMessage(
      text:
          'Saya mencoba memberikan makanan sehat, tetapi anak saya sering menolak dan hanya makan sedikit.',
      sender: 'Ibu',
      time: DateTime.now().subtract(Duration(minutes: 2)),
    ),
    ChatMessage(
      text:
          'Memastikan nutrisi yang cukup penting untuk pertumbuhan anak. Kita harus mencari tahu penyebab anak Anda tidak mau makan. Apakah ada gejala kesehatan lain yang Anda perhatikan?',
      sender: 'Dokter',
      time: DateTime.now().subtract(Duration(minutes: 1)),
    ),
    ChatMessage(
      text:
          'Anak saya sering mengalami sakit perut dan diare. Dia juga terlihat lemah dan tidak berenergi.',
      sender: 'Ibu',
      time: DateTime.now().subtract(Duration(minutes: 1)),
    ),
    ChatMessage(
      text:
          'Sakit perut dan diare dapat menjadi tanda gizi buruk pada anak. Saya sarankan Anda membawa anak Anda untuk diperiksa lebih lanjut agar kami bisa menentukan diagnosis yang tepat dan memberikan perawatan yang sesuai.',
      sender: 'Dokter',
      time: DateTime.now().subtract(Duration(minutes: 1)),
    ),
    // Tambahkan percakapan lebih lanjut sesuai kebutuhan
  ];

  final DoctorController doctorController = Get.put(DoctorController());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ProfileDoctor profileDoctor = doctorController.getProfileDoctor();

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
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      backgroundImage:
                          AssetImage(profileDoctor.gambarDokter.toString()),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ComponentTextPrimaryTittleBold(
                          teks: profileDoctor.namaDokter.toString(),
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
                      alignment: message.sender == 'Ibu'
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Bubble(
                        message: message.text,
                        isMe: message.sender == 'Ibu',
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
