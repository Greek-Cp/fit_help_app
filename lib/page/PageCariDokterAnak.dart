import 'package:fit_help_app/component/ComponentText.dart';
import 'package:fit_help_app/controller/DokterController.dart';
import 'package:fit_help_app/page/nav/PageDetailDokter.dart';
import 'package:fit_help_app/util/list_color.dart';
import 'package:fit_help_app/util/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PageCariDokter extends StatefulWidget {
  static String? routeName = "/PageCariDokter";
  @override
  State<PageCariDokter> createState() => _PageCariDokterState();
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

class ProfileDoctor {
  String? namaDokter;
  String? jobDokter;
  String? gambarDokter;
  bool? statusOnline;
  ProfileDoctor(
      this.namaDokter, this.jobDokter, this.gambarDokter, this.statusOnline);
}

class _PageCariDokterState extends State<PageCariDokter> {
  List<ProfileDoctor> doctors = [
    ProfileDoctor('dr. Klara Yuliarti, Sp.A', 'Dokter Spesialis Anak',
        'assets/img_1.png', null),
    ProfileDoctor('dr. Rifan Fauzie, Sp.A', 'Dokter Spesialis Anak',
        'assets/img_2.png', null),
    ProfileDoctor('dr. Dimple Gobind Nagrani, Sp.A', 'Dokter Spesialis Anak',
        'assets/img_3.png', null),
    ProfileDoctor('dr. Adila Nurhadiya, Sp.A', 'Dokter Spesialis Anak',
        'assets/img_4.png', null),
    ProfileDoctor('dr. Anne Dian Rachmawati, Sp.A', 'Dokter Spesialis Anak',
        'assets/img_5.png', null),
    ProfileDoctor('dr. Dicky Santosa, Sp.A', 'Dokter Spesialis Anak',
        'assets/img_6.png', null),
    ProfileDoctor('dr. Chandni P. Daryanani, Sp.A', 'Dokter Spesialis Anak',
        'assets/img_7.png', null),
    ProfileDoctor('dr. Diah Asri Wulandari, Sp.A', 'Dokter Spesialis Anak',
        'assets/img_8.png', null),
    ProfileDoctor('dr. Aris Primadi, Sp.A', 'Dokter Spesialis Anak',
        'assets/img_9.png', null),
    ProfileDoctor('dr. Dinna Meinardaniawati, Sp.A', 'Dokter Spesialis Anak',
        'assets/img_10.png', null),
    ProfileDoctor('dr. Almira Aliyannissa, Sp.A', 'Dokter Spesialis Anak',
        'assets/img_11.png', null),
  ];
  final DoctorController doctorController = Get.put(DoctorController());

  Widget itemSearchDoctor(
      {String? idDoctor,
      String? nameDoctor,
      String? job,
      String? gambarDokter}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
      color: Colors.white,
      child: Row(children: [
        SizedBox(
          width: 10,
        ),
        Image.asset(
          gambarDokter.toString(),
          height: 50.h,
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            ComponentTextPrimaryTittleBold(
              teks: "${nameDoctor}",
            ),
            ComponentTextPrimaryTittleRegular(
              teks: "${job}",
            ),
            Container(
              width: 100.w,
              height: 30.h,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: Colors.white,
                child: Row(children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 5),
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.green,
                    ),
                  ),
                  ComponentTextPrimaryDescriptionRegular(
                    teks: "Online",
                    size: SizeApp.SizeTextDescription.sp,
                  )
                ]),
              ),
            ),
            SizedBox(
              width: 180.w,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: ComponentTextPrimaryTittleBold(
                        teks: "Konsultasi Online",
                        size: SizeApp.SizeTextButton.sp,
                        colorText: Colors.white,
                        textAlign: TextAlign.center,
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorApp.primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r))),
                    ),
                  ),
                  SizedBox(
                    width: 6.h,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: ComponentTextPrimaryTittleBold(
                        teks: "Konsultasi Lansung",
                        size: SizeApp.SizeTextButton.sp,
                        colorText: Colors.white,
                        textAlign: TextAlign.center,
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorApp.primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r))),
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ScreenUtilInit(
        builder: (context, child) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                      ComponentTextPrimaryTittleBold(
                        teks: "Temukan Dokter Anak Anda",
                        size: SizeApp.SizeTextHeader.sp,
                        colorText: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  RoundedSearchBar(),
                  ComponentTextPrimaryDescriptionRegular(
                    teks:
                        "Mencegah stunting adalah upaya penting untuk menghindari terhambatnya pertumbuhan fisik dan perkembangan anak akibat kekurangan gizi",
                    size: (SizeApp.SizeTextDescription - 5).sp,
                    colorText: Colors.white,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: PageScrollPhysics(),
                    itemCount: doctors.length,
                    itemBuilder: (context, index) {
                      ProfileDoctor doctor = doctors[index];
                      return GestureDetector(
                        onTap: () {
                          doctorController.setProfileDoctor(
                              doctors[index].namaDokter.toString(),
                              "Dokter Spesialis Anak",
                              doctors[index].gambarDokter.toString(),
                              true);
                          Get.toNamed(PageDetailDokter.routeName.toString());
                        },
                        child: itemSearchDoctor(
                            idDoctor:
                                '', // Provide the appropriate idDoctor value if needed
                            nameDoctor: doctor.namaDokter,
                            job: doctor.jobDokter,
                            gambarDokter: doctor.gambarDokter),
                      );
                    },
                  )
                ],
              ),
            ),
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
