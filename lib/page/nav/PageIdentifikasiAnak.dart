import 'package:fit_help_app/component/ComponentButton.dart';
import 'package:fit_help_app/component/ComponentText.dart';
import 'package:fit_help_app/util/list_color.dart';
import 'package:fit_help_app/util/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageIdentifikasiAnak extends StatefulWidget {
  static String? routeName = "/PageIdentifikasiAnak";
  @override
  State<PageIdentifikasiAnak> createState() => _PageIdentifikasiAnakState();
}

class _PageIdentifikasiAnakState extends State<PageIdentifikasiAnak> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ScreenUtilInit(
        builder: (context, child) {
          return ListView(
            shrinkWrap: true,
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ))),
              ComponentTextPrimaryTittleBold(
                teks: "Identifikasi Anak Anda",
                size: SizeApp.SizeTextHeader.sp,
                colorText: Colors.white,
                textAlign: TextAlign.center,
              ),
              ComponentTextPrimaryDescriptionRegular(
                teks:
                    "Jawab Pertanyaan Berikut ini untuk mengidentifikasi apakah anak anda terbebas dari Stunting dan Gizi buruk? ",
                size: SizeApp.SizeTextDescription.sp,
                colorText: Colors.white,
                textAlign: TextAlign.center,
              ),
              Card(
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60.r),
                        topRight: Radius.circular(60.r))),
                color: Colors.white,
                child: Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Soal();
                    },
                    itemCount: 30,
                  ),
                ),
              ),
              ComponentButtonPrimaryWithFunction(
                "Cek Hasil",
                () => {},
                colorButton: ColorApp.primary,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget Soal() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, top: 20),
          child: ComponentTextPrimaryTittleBold(
            teks: "1. Berapakah usia anak Anda?",
            colorText: Colors.black,
            size: SizeApp.SizeTextHeader.sp,
            textAlign: TextAlign.start,
          ),
        ),
        RadioListTile(
          title: ComponentTextPrimaryDescriptionRegular(
            teks: "Kurang Dari 2 Tahun",
            colorText: Colors.black,
            size: SizeApp.SizeTextHeader.sp,
          ),
          value: "male",
          groupValue: "gender",
          onChanged: (value) {
            setState(() {});
          },
        ),
        RadioListTile(
          title: ComponentTextPrimaryDescriptionRegular(
            teks: "Kurang Dari 2 Tahun",
            colorText: Colors.black,
            size: SizeApp.SizeTextHeader.sp,
          ),
          value: "male",
          groupValue: "gender",
          onChanged: (value) {
            setState(() {});
          },
        ),
        RadioListTile(
          title: ComponentTextPrimaryDescriptionRegular(
            teks: "Kurang Dari 2 Tahun",
            colorText: Colors.black,
            size: SizeApp.SizeTextHeader.sp,
          ),
          value: "male",
          groupValue: "gender",
          onChanged: (value) {
            setState(() {});
          },
        ),
      ],
    );
  }
}
