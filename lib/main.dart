import 'package:fit_help_app/page/BaseNav.dart';
import 'package:fit_help_app/page/PageDaftar.dart';
import 'package:fit_help_app/page/PageIntro.dart';
import 'package:fit_help_app/page/PageLogin.dart';
import 'package:fit_help_app/page/nav/PageBeranda.dart';
import 'package:fit_help_app/page/nav/PageChat.dart';
import 'package:fit_help_app/page/nav/PageDetailDokter.dart';
import 'package:fit_help_app/page/nav/PageIdentifikasiAnak.dart';
import 'package:fit_help_app/page/nav/PageProfileSaya.dart';
import 'package:fit_help_app/util/list_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'page/TestPage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: Colors.amber,
        cardColor: ColorApp.primary,
        scaffoldBackgroundColor: ColorApp.primary,
        colorScheme: ThemeData().colorScheme.copyWith(
              primary:
                  ColorApp.ColorButtonPrimary, // Set your desired color here
            ),
      ),
      initialRoute: PageDetailDokter.routeName.toString(),
      defaultTransition: Transition.circularReveal,
      getPages: [
        GetPage(
            name: PageIdentifikasiAnak.routeName.toString(),
            page: () => PageIdentifikasiAnak()),
        GetPage(name: MyPage.routeName.toString(), page: () => MyPage()),
        GetPage(name: BaseNav.routeName.toString(), page: () => BaseNav()),
        GetPage(name: PageIntro.routeName.toString(), page: () => PageIntro()),
        GetPage(
            name: PageDaftar.routeName.toString(), page: () => PageDaftar()),
        GetPage(name: PageLogin.routeName.toString(), page: () => PageLogin()),
        GetPage(
            name: PageBeranda.routeName.toString(), page: () => PageBeranda()),
        GetPage(name: PageChat.routeName.toString(), page: () => PageChat()),
        GetPage(
            name: PageProfileSaya.routeName.toString(),
            page: () => PageProfileSaya()),
        GetPage(
            name: PageDetailDokter.routeName.toString(),
            page: () => PageDetailDokter())
      ],
    );
  }
}
