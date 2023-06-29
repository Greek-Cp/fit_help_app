import 'package:fit_help_app/component/ComponentText.dart';
import 'package:fit_help_app/util/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageDetailDokter extends StatefulWidget {
  static String? routeName = "/PageDetailDokter";
  @override
  State<PageDetailDokter> createState() => _PageDetailDokterState();
}

class _PageDetailDokterState extends State<PageDetailDokter> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ScreenUtilInit(
        builder: (context, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      ComponentTextPrimaryTittleBold(
                        teks: "Dr. Silvia Adreno",
                        textAlign: TextAlign.start,
                        colorText: Colors.white,
                      ),
                      ComponentTextPrimaryDescriptionRegular(
                        teks: "Dokter Spesialis Anak",
                        textAlign: TextAlign.start,
                        colorText: Colors.white,
                      ),
                      Container(
                        width: 100,
                        height: 30,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          color: Colors.white,
                          child: Row(children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10, right: 5),
                              child: CircleAvatar(
                                radius: 5,
                                backgroundColor: Colors.green,
                              ),
                            ),
                            ComponentTextPrimaryDescriptionRegular(
                              teks: "Online",
                              size: SizeApp.SizeTextDescription.sp,
                            )
                          ]),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 1,
                    right: 1,
                    left: 1,
                    child: Image.asset(
                      "assets/gambar_halaman_awal.png",
                      width: 270.w,
                      height: 100.h,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
