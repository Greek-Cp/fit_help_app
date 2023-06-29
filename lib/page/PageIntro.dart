import 'package:fit_help_app/component/ComponentButton.dart';
import 'package:fit_help_app/component/ComponentText.dart';
import 'package:fit_help_app/page/PageDaftar.dart';
import 'package:fit_help_app/page/PageLogin.dart';
import 'package:fit_help_app/util/list_color.dart';
import 'package:fit_help_app/util/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PageIntro extends StatefulWidget {
  static String? routeName = "/PageIntro";
  @override
  State<PageIntro> createState() => _NamePageState();
}

class _NamePageState extends State<PageIntro> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ScreenUtilInit(
        builder: (context, child) {
          return SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  elevation: 0,
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(60.r),
                          bottomRight: Radius.circular(60.r))),
                  color: Colors.white,
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.h, top: 20.h),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ComponentTextPrimaryDescriptionBold(
                              teks: "FitHelp",
                              size: SizeApp.SizeTextHeader.sp,
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.r)),
                              child: Padding(
                                padding: EdgeInsets.all(
                                    (SizeApp.SizePaddingLeft - 0).h),
                                child: ComponentTextPrimaryDescriptionBold(
                                    teks: "Aplikasi Medis",
                                    colorText: Colors.white,
                                    size: SizeApp.SizeTextDescription.sp),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Image.asset(
                      "assets/gambar_halaman_awal.png",
                      width: 270.w,
                      fit: BoxFit.cover,
                    )
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              ComponentTextPrimaryTittleBold(
                                teks: "Tanya Jawab",
                                size: SizeApp.SizeTextHeader.sp,
                                colorText: Colors.white,
                              ),
                              SizedBox(
                                width: 230.w,
                                child: ComponentTextPrimaryTittleRegular(
                                  teks: "seputar stunting dan kesehatan anak",
                                  colorText: Colors.white,
                                  size: (SizeApp.SizeTextDescription + 5).sp,
                                  textALign: TextAlign.center,
                                ),
                              )
                            ],
                          )),
                      SizedBox(
                        height: 10.h,
                      ),
                      ComponentButtonPrimaryWithFunction(
                        "Masuk",
                        () => {
                          Get.toNamed(PageLogin.routeName.toString()),
                        },
                        colorText: ColorApp.primary,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      ComponentButtonPrimaryOutlineWithFunction("Daftar",
                          () => {Get.toNamed(PageDaftar.routeName.toString())})
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
