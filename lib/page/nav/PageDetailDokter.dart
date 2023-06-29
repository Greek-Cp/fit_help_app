import 'package:fit_help_app/component/ComponentText.dart';
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
            children: [
              ComponentTextPrimaryTittleBold(
                teks: "Dr. Silvia Adreno",
              )
            ],
          );
        },
      ),
    );
  }
}
