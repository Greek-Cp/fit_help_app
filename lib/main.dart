import 'package:firebase_core/firebase_core.dart';
import 'package:fit_help_app/page/BaseNav.dart';
import 'package:fit_help_app/page/PageAkunSaya.dart';
import 'package:fit_help_app/page/PageDaftar.dart';
import 'package:fit_help_app/page/PageIntro.dart';
import 'package:fit_help_app/page/PageLogin.dart';
import 'package:fit_help_app/page/nav/PageBeranda.dart';
import 'package:fit_help_app/page/nav/PageChat.dart';
import 'package:fit_help_app/page/nav/PageDetailDokter.dart';
import 'package:fit_help_app/page/nav/PageIdentifikasiAnak.dart';
import 'package:fit_help_app/page/nav/PageIdentifikasiAnakGiziBuruk.dart';
import 'package:fit_help_app/page/nav/PageInformasiGiziBurk.dart';
import 'package:fit_help_app/page/nav/PageInformasiStunting.dart';
import 'package:fit_help_app/page/nav/PageProfileSaya.dart';
import 'package:fit_help_app/util/list_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'firebase_options.dart';
import 'page/PageCariDokterAnak.dart';
import 'page/PageDetailAkunSaya.dart';
import 'page/PageGantiSandi.dart';
import 'page/PageListChat.dart';
import 'page/TestPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.amber,
        cardColor: ColorApp.primary,
        scaffoldBackgroundColor: ColorApp.primary,
        colorScheme: ThemeData().colorScheme.copyWith(
              primary:
                  ColorApp.ColorButtonPrimary, // Set your desired color here
            ),
      ),
      initialRoute: PageIntro.routeName.toString(),
      defaultTransition: Transition.circularReveal,
      getPages: [
        GetPage(
          name: PageAkunSaya.routeName.toString(),
          page: () => PageAkunSaya(),
        ),
        GetPage(
            name: PageIdentifikasiAnakGiziBuruk.routeName.toString(),
            page: () => PageIdentifikasiAnakGiziBuruk()),
        GetPage(
            name: PageIdentifikasAnakStunting.routeName.toString(),
            page: () => PageIdentifikasAnakStunting()),
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
            page: () => PageDetailDokter()),
        GetPage(
          name: PageChat.routeName.toString(),
          page: () => PageChat(),
        ),
        GetPage(
          name: PageDetailAkunSaya.routeName.toString(),
          page: () => PageDetailAkunSaya(),
        ),
        GetPage(
          name: PageGantiSandi.routeName.toString(),
          page: () => PageGantiSandi(),
        ),
        GetPage(
          name: PageCariDokter.routeName.toString(),
          page: () => PageCariDokter(),
        ),
        GetPage(
          name: PageListChat.routeName.toString(),
          page: () => PageListChat(),
        ),
        GetPage(
            name: PageInformasiStunting.routeName.toString(),
            page: () => PageInformasiStunting()),
        GetPage(
            name: PageInformasiGiziBuruk.routeName.toString(),
            page: () => PageInformasiGiziBuruk())
      ],
    );
  }
}
