import 'package:fit_help_app/component/ComponentText.dart';
import 'package:fit_help_app/util/list_color.dart';
import 'package:fit_help_app/util/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageViewArtikel extends StatefulWidget {
  static String? routeName = "/PageViewArtikel";
  @override
  State<PageViewArtikel> createState() => _PageInformasiStuntingState();
}

class _PageInformasiStuntingState extends State<PageViewArtikel> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: ColorApp.primary,
      body: ScreenUtilInit(
        builder: (context, child) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                      ComponentTextPrimaryTittleBold(
                        teks: "Informasi Stunting ",
                        size: SizeApp.SizeTextHeader.sp,
                        colorText: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
