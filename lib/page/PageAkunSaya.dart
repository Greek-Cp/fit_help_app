import 'package:fit_help_app/component/ComponentText.dart';
import 'package:fit_help_app/page/PageDetailAkunSaya.dart';
import 'package:fit_help_app/util/list_color.dart';
import 'package:fit_help_app/util/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PageAkunSaya extends StatefulWidget {
  static String? routeName = "/PageAkunSaya";
  @override
  State<PageAkunSaya> createState() => _PageAkunSayaState();
}

class _PageAkunSayaState extends State<PageAkunSaya> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: ScreenUtilInit(
        builder: (context, child) {
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15.r),
                          bottomRight: Radius.circular(15.r))),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, top: 40, bottom: 30),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 30.r,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ComponentTextPrimaryTittleBold(
                              teks: "Diana",
                              size: SizeApp.SizeTextHeader.sp,
                              colorText: Colors.white,
                            ),
                            ComponentTextPrimaryDescriptionRegular(
                              teks: "Nganjuk",
                              size: SizeApp.SizeTextButton.sp,
                              colorText: Colors.white,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ComponentTextPrimaryDescriptionBold(
                        teks: "Akun Saya",
                        size: SizeApp.SizeTextHeader.sp,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(PageDetailAkunSaya.routeName.toString());
                        },
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.r)),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 10, left: 10, right: 10, bottom: 10),
                            child: Row(children: [
                              Icon(
                                Icons.person,
                                size: 50,
                              ),
                              ComponentTextPrimaryDescriptionBold(
                                teks: "Akun Anda",
                                size: SizeApp.SizeTextButton.sp,
                              ),
                              Expanded(child: Container()),
                              Icon(
                                Icons.arrow_right,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 30,
                              )
                            ]),
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r)),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 10, left: 10, right: 10, bottom: 10),
                          child: Row(children: [
                            Icon(
                              Icons.info,
                              size: 50,
                            ),
                            ComponentTextPrimaryDescriptionBold(
                              teks: "Tentang Aplikasi",
                              size: SizeApp.SizeTextButton.sp,
                            ),
                            Expanded(child: Container()),
                            Icon(
                              Icons.arrow_right,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 30,
                            )
                          ]),
                        ),
                      ),
                      Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r)),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 10, left: 10, right: 10, bottom: 10),
                          child: Row(children: [
                            Icon(
                              Icons.logout_outlined,
                              size: 50,
                            ),
                            ComponentTextPrimaryDescriptionBold(
                              teks: "Keluar Akun",
                              size: SizeApp.SizeTextButton.sp,
                            ),
                            Expanded(child: Container()),
                            Icon(
                              Icons.arrow_right,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 30,
                            )
                          ]),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
