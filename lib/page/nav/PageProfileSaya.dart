import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageProfileSaya extends StatefulWidget {
  static String? routeName = "/PageProfileSaya";
  @override
  State<PageProfileSaya> createState() => _PageProfileState();
}

class _PageProfileState extends State<PageProfileSaya> {
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
