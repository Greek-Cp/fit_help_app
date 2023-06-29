import 'package:fit_help_app/page/nav/PageBeranda.dart';
import 'package:fit_help_app/page/nav/PageChat.dart';
import 'package:fit_help_app/page/nav/PageProfileSaya.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseNav extends StatefulWidget {
  static String? routeName = "/BaseNav";
  @override
  State<BaseNav> createState() => _BaseNavState();
}

class _BaseNavState extends State<BaseNav> {
  List<BottomNavigationBarItem> listItem = [
    BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Beranda"),
    BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: "Pesan"),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
  ];
  List<Widget> listPage = [
    PageBeranda(),
    PageChat(),
    PageProfileSaya(),
  ];

  int selectionIndexNav = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: listPage[selectionIndexNav],
      bottomNavigationBar: BottomNavigationBar(
        items: listItem,
        onTap: (value) {
          setState(() {
            selectionIndexNav = value;
          });
        },
      ),
    );
  }
}
