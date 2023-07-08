import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageInformasiStunting extends StatefulWidget {
  static String? routeName = "/PageInformasiStunting";
  @override
  State<PageInformasiStunting> createState() => _PageInformasiStuntingState();
}

class _PageInformasiStuntingState extends State<PageInformasiStunting> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ScreenUtilInit(
        builder: (context, child) {
          return Column(
            children: [],
          );
        },
      ),
    );
  }
}
