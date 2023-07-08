import 'package:fit_help_app/component/ComponentText.dart';
import 'package:fit_help_app/util/list_color.dart';
import 'package:fit_help_app/util/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageListChat extends StatefulWidget {
  static String? routeName = "/PageListChat";
  @override
  State<PageListChat> createState() => _PageListChatState();
}

class _PageListChatState extends State<PageListChat> {
  Widget itemSearchDoctor({String? idDoctor, String? nameDoctor, String? job}) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(children: [
        CircleAvatar(
          backgroundImage: AssetImage("assets/gambar_halaman_awal.png"),
        ),
        SizedBox(
          width: 10.w,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            ComponentTextPrimaryTittleBold(
              teks: "${nameDoctor}",
            ),
            ComponentTextPrimaryTittleRegular(
              teks: "${job}",
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              color: Colors.white,
              elevation: 0,
              child: Row(children: [
                // ignore: prefer_const_constructors
                Padding(
                  padding: EdgeInsets.only(left: 0, right: 5),
                  child: CircleAvatar(
                    radius: 5,
                    backgroundColor: Colors.green,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: ComponentTextPrimaryDescriptionRegular(
                    teks: "Online",
                  ),
                )
              ]),
            ),
          ],
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: ScreenUtilInit(
        builder: (context, child) {
          return ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: ComponentTextPrimaryDescriptionBold(
                  teks: "Chat Saya",
                  size: SizeApp.SizeTextHeader.sp,
                  colorText: Colors.white,
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, bottom: 20),
                child: ComponentTextPrimaryDescriptionRegular(
                  teks: "chat dengan dokter",
                  size: SizeApp.SizeTextDescription.sp,
                  colorText: Colors.white,
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                child: Card(
                  margin: EdgeInsets.zero,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r)),
                  child: Column(
                    children: [
                      itemSearchDoctor(
                          idDoctor: "1",
                          nameDoctor: "Dr. Indrawan Nugroho",
                          job: "Dokter Anak"),
                      itemSearchDoctor(
                          idDoctor: "1",
                          nameDoctor: "Dr. Indrawan Nugroho",
                          job: "Dokter Anak"),
                      itemSearchDoctor(
                          idDoctor: "1",
                          nameDoctor: "Dr. Indrawan Nugroho",
                          job: "Dokter Anak"),
                      itemSearchDoctor(
                          idDoctor: "1",
                          nameDoctor: "Dr. Indrawan Nugroho",
                          job: "Dokter Anak"),
                      itemSearchDoctor(
                          idDoctor: "1",
                          nameDoctor: "Dr. Indrawan Nugroho",
                          job: "Dokter Anak"),
                      itemSearchDoctor(
                          idDoctor: "1",
                          nameDoctor: "Dr. Indrawan Nugroho",
                          job: "Dokter Anak"),
                      itemSearchDoctor(
                          idDoctor: "1",
                          nameDoctor: "Dr. Indrawan Nugroho",
                          job: "Dokter Anak"),
                      itemSearchDoctor(
                          idDoctor: "1",
                          nameDoctor: "Dr. Indrawan Nugroho",
                          job: "Dokter Anak"),
                      itemSearchDoctor(
                          idDoctor: "1",
                          nameDoctor: "Dr. Indrawan Nugroho",
                          job: "Dokter Anak"),
                      itemSearchDoctor(
                          idDoctor: "1",
                          nameDoctor: "Dr. Indrawan Nugroho",
                          job: "Dokter Anak"),
                      itemSearchDoctor(
                          idDoctor: "1",
                          nameDoctor: "Dr. Indrawan Nugroho",
                          job: "Dokter Anak"),
                      itemSearchDoctor(
                          idDoctor: "1",
                          nameDoctor: "Dr. Indrawan Nugroho",
                          job: "Dokter Anak"),
                      itemSearchDoctor(
                          idDoctor: "1",
                          nameDoctor: "Dr. Indrawan Nugroho",
                          job: "Dokter Anak"),
                      itemSearchDoctor(
                          idDoctor: "1",
                          nameDoctor: "Dr. Indrawan Nugroho",
                          job: "Dokter Anak"),
                      itemSearchDoctor(
                          idDoctor: "1",
                          nameDoctor: "Dr. Indrawan Nugroho",
                          job: "Dokter Anak"),
                      itemSearchDoctor(
                          idDoctor: "1",
                          nameDoctor: "Dr. Indrawan Nugroho",
                          job: "Dokter Anak"),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
