import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NamePage extends StatefulWidget {
  static String? routeName = "/NamePage";
  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
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
