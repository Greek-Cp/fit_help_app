import 'package:fit_help_app/page/PageAkunSaya.dart';
import 'package:fit_help_app/page/PageListChat.dart';
import 'package:fit_help_app/page/nav/PageBeranda.dart';
import 'package:fit_help_app/page/nav/PageChat.dart';
import 'package:fit_help_app/page/nav/PageProfileSaya.dart';
import 'package:fit_help_app/util/list_color.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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
    PageListChat(),
    PageAkunSaya(),
  ];

  int selectionIndexNav = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: listPage[selectionIndexNav],
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: GNav(
                  rippleColor: Colors.grey[300]!,
                  hoverColor: Colors.grey[100]!,
                  gap: 8,
                  activeColor: ColorApp.primary,
                  iconSize: 24,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  duration: Duration(milliseconds: 400),
                  tabBackgroundColor: Colors.grey[100]!,
                  color: ColorApp.primary,
                  tabs: [
                    GButton(
                      icon: Icons.home,
                      text: 'Halaman Utama',
                    ),
                    GButton(
                      icon: Icons.message,
                      text: 'Pesan Saya',
                    ),
                    GButton(
                      icon: Icons.person,
                      text: 'Profile',
                    ),
                  ],
                  selectedIndex: selectionIndexNav,
                  onTabChange: (index) {
                    setState(() {
                      selectionIndexNav = index;
                    });
                  },
                ),
              ),
            )));
  }
}
