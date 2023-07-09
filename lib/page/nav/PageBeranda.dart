import 'package:fit_help_app/component/ComponentText.dart';
import 'package:fit_help_app/page/PageCariDokterAnak.dart';
import 'package:fit_help_app/page/PageLogin.dart';
import 'package:fit_help_app/page/nav/PageIdentifikasiAnak.dart';
import 'package:fit_help_app/page/nav/PageIdentifikasiAnakGiziBuruk.dart';
import 'package:fit_help_app/page/nav/PageInformasiGiziBurk.dart';
import 'package:fit_help_app/page/nav/PageInformasiStunting.dart';
import 'package:fit_help_app/util/list_color.dart';
import 'package:fit_help_app/util/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PageBeranda extends StatefulWidget {
  static String? routeName = "/PageBeranda";
  @override
  State<PageBeranda> createState() => _PageBerandaState();
}

class ModelMenu {
  String? name;
  String? assetPath;
  String? routeName;
  ModelMenu(this.name, this.assetPath, this.routeName);
}

List<ModelMenu> listMenu = [
  ModelMenu("Konsultasi", "assets/ic_chat.png", PageCariDokter.routeName),
  ModelMenu("Identifikasi Kesehatan Anak", "assets/boy.png",
      PageIdentifikasAnakStunting.routeName),
];

List<ModelMenu> listMenuBottom = [
  ModelMenu("Informasi Gizi Buruk", "assets/ic_therapy.png",
      PageInformasiGiziBuruk.routeName.toString()),
  ModelMenu("Informasi Stunting", "assets/ic_gejala_stunting.png",
      PageInformasiStunting.routeName.toString()),
];

class _PageBerandaState extends State<PageBeranda> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ScreenUtilInit(
        builder: (context, child) {
          return ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ComponentTextPrimaryTittleBold(
                  teks: "Hallo, Diana",
                  size: SizeApp.SizeTextHeader.sp,
                  colorText: Colors.white,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: RoundedSearchBar(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: ComponentTextPrimaryDescriptionRegular(
                  teks:
                      "Mencegah stunting adalah upaya penting untuk menghindari terhambatnya pertumbuhan fisik dan perkembangan anak akibat kekurangan gizi",
                  size: (SizeApp.SizeTextDescription - 5).sp,
                  colorText: Colors.white,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: Card(
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60.r),
                          topRight: Radius.circular(60.r))),
                  color: Colors.white,
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 30.h, left: 30.w, right: 30.h),
                    child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ComponentTextPrimaryDescriptionBold(
                            textAlign: TextAlign.start,
                            teks: "Layanan Aplikasi",
                            size: SizeApp.SizeTextHeader.sp,
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 40,
                                    crossAxisSpacing: 30,
                                    childAspectRatio: 0.9,
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(),
                                child: GestureDetector(
                                  onTap: () {
                                    if (index == 1) {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text(
                                                "Identifikasi Kondisi Anak"),
                                            content: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.toNamed(
                                                        PageIdentifikasAnakStunting
                                                            .routeName
                                                            .toString());
                                                  },
                                                  child: Card(
                                                    child: ListTile(
                                                      leading: Icon(
                                                        Icons.accessibility_new,
                                                        color: Colors.white,
                                                      ),
                                                      title:
                                                          ComponentTextPrimaryDescriptionBold(
                                                        teks:
                                                            "Identifikasi Stunting pada Anak",
                                                        size: SizeApp
                                                            .SizeTextButton.sp,
                                                        colorText: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.toNamed(
                                                        PageIdentifikasiAnakGiziBuruk
                                                            .routeName
                                                            .toString());
                                                  },
                                                  child: Card(
                                                    child: ListTile(
                                                      leading: Icon(
                                                        Icons.warning,
                                                        color: Colors.white,
                                                      ),
                                                      title:
                                                          ComponentTextPrimaryDescriptionBold(
                                                        teks:
                                                            "Identifikasi Gizi Buruk pada Anak",
                                                        size: SizeApp
                                                            .SizeTextButton.sp,
                                                        colorText: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            actions: [
                                              ElevatedButton(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStatePropertyAll(
                                                            ColorApp.primary)),
                                                onPressed: () {
                                                  Navigator.pop(
                                                      context); // Tutup dialog
                                                },
                                                child: Text("Kembali"),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    } else {
                                      Get.toNamed(
                                          listMenu[index].routeName.toString());
                                    }
                                  },
                                  child: Card(
                                      color: Colors.white,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            listMenu[index]
                                                .assetPath
                                                .toString(),
                                            width: 40.w,
                                            height: 40.h,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 10, right: 10, top: 10),
                                            child:
                                                ComponentTextPrimaryDescriptionBold(
                                              teks: listMenu[index].name,
                                              textAlign: TextAlign.center,
                                              size:
                                                  (SizeApp.SizeTextDescription -
                                                          5)
                                                      .sp,
                                            ),
                                          )
                                        ],
                                      )),
                                ),
                              );
                            },
                            itemCount: listMenu.length,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          ComponentTextPrimaryDescriptionBold(
                            textAlign: TextAlign.start,
                            teks: "Layanan Aplikasi",
                            size: SizeApp.SizeTextHeader.sp,
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 40,
                                    crossAxisSpacing: 30,
                                    childAspectRatio: 0.9,
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.toNamed(listMenuBottom[index]
                                      .routeName
                                      .toString());
                                },
                                child: InkWell(
                                  splashColor: ColorApp.primary,
                                  radius: 100,
                                  child: Card(
                                      color: Colors.white,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            listMenuBottom[index]
                                                .assetPath
                                                .toString(),
                                            width: 40.w,
                                            height: 40.h,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 10, right: 10, top: 10),
                                            child:
                                                ComponentTextPrimaryDescriptionBold(
                                              teks: listMenuBottom[index].name,
                                              textAlign: TextAlign.center,
                                              size:
                                                  (SizeApp.SizeTextDescription -
                                                          5)
                                                      .sp,
                                            ),
                                          )
                                        ],
                                      )),
                                ),
                              );
                            },
                            itemCount: listMenuBottom.length,
                          ),
                          SizedBox(
                            height: 100.h,
                          ),
                        ]),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class RoundedSearchBar extends StatelessWidget {
  RoundedSearchBar({this.textEditing});
  TextEditingController? textEditing;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //   Get.toNamed(PageTelusuriProduk.routeName.toString());
      },
      child: Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: ColorApp.primary,
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                    onTap: () {
                      Get.toNamed(PageCariDokter.routeName.toString());
                    },
                    child: Text("Cari Dokter")),
              ],
            ),
          )),
    );
  }
}
