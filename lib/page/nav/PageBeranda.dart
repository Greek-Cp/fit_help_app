import 'package:fit_help_app/component/ComponentText.dart';
import 'package:fit_help_app/util/list_color.dart';
import 'package:fit_help_app/util/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageBeranda extends StatefulWidget {
  static String? routeName = "/PageBeranda";
  @override
  State<PageBeranda> createState() => _PageBerandaState();
}

class ModelMenu {
  String? name;
  String? assetPath;
  ModelMenu(this.name, this.assetPath);
}

List<ModelMenu> listMenu = [
  ModelMenu("Konsultasi", "assets/ic_chat.png"),
  ModelMenu("Identifikasi Kesehatan Anak", "assets/ic_therapy.png"),
];

List<ModelMenu> listMenuBottom = [
  ModelMenu("Apa itu Stunting", "assets/ic_therapy.png"),
  ModelMenu("Gejala Stunting", "assets/ic_gejala_stunting.png"),
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
                                child: Card(
                                    color: Colors.white,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          listMenu[index].assetPath.toString(),
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
                                            size: (SizeApp.SizeTextDescription -
                                                    5)
                                                .sp,
                                          ),
                                        )
                                      ],
                                    )),
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
                              return Card(
                                  color: Colors.white,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                              (SizeApp.SizeTextDescription - 5)
                                                  .sp,
                                        ),
                                      )
                                    ],
                                  ));
                            },
                            itemCount: listMenuBottom.length,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          ComponentTextPrimaryDescriptionBold(
                            textAlign: TextAlign.start,
                            teks: "Layanan Aplikasi",
                            size: SizeApp.SizeTextHeader.sp,
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
                Text("Cari Dokter"),
              ],
            ),
          )),
    );
  }
}
