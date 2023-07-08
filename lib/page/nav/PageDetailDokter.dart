import 'dart:math';

import 'package:fit_help_app/component/ComponentButton.dart';
import 'package:fit_help_app/component/ComponentText.dart';
import 'package:fit_help_app/controller/DokterController.dart';
import 'package:fit_help_app/page/PageCariDokterAnak.dart';
import 'package:fit_help_app/util/list_color.dart';
import 'package:fit_help_app/util/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PageDetailDokter extends StatefulWidget {
  static String? routeName = "/PageDetailDokter";
  @override
  State<PageDetailDokter> createState() => _PageDetailDokterState();
}

class KomentarUser {
  String nama;
  String komentar;

  KomentarUser({
    required this.nama,
    required this.komentar,
  });
}

class _PageDetailDokterState extends State<PageDetailDokter> {
  final DoctorController doctorController = Get.put(DoctorController());
  int generateRandomEvenNumber(int min, int max) {
    final random = Random();
    int range =
        (max - min) ~/ 2; // Divide the range by 2 to generate even numbers
    int randomNumber = min +
        random.nextInt(range + 1) * 2; // Multiply by 2 to ensure even number

    return randomNumber;
  }

  List<KomentarUser> generateKomentarUsers(int count) {
    final random = Random();
    List<KomentarUser> komentarUsers = [];

    for (int i = 0; i < count; i++) {
      String randomName = randomNames[random.nextInt(randomNames.length)];
      String randomFeedback =
          randomFeedbacks[random.nextInt(randomFeedbacks.length)];

      komentarUsers.add(KomentarUser(
        nama: randomName,
        komentar: randomFeedback,
      ));
    }

    return komentarUsers;
  }

  List<String> randomNames = [
    'Budi',
    'Siti',
    'Joko',
    'Rini',
    'Agus',
    'Dewi',
    'Eko',
    'Lina',
    'Rudi',
    'Maya',
  ];

  List<String> randomFeedbacks = [
    'Pelayanan dokter sangat baik, saya puas dengan penanganan yang diberikan.',
    'Dokter anak yang luar biasa, sangat ramah dan teliti dalam menjelaskan.',
    'Terima kasih kepada dokter anak yang membantu kesembuhan anak saya.',
    'Saya merasa sangat nyaman dan percaya dengan kompetensi dokter anak ini.',
    'Dokter yang sangat profesional dan memiliki empati yang tinggi terhadap anak-anak.',
    'Dokter anak yang terpercaya, saya sangat merekomendasikannya.',
  ];

  List<KomentarUser> listKomentar = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ProfileDoctor profileDoctor = doctorController.getProfileDoctor();
    listKomentar = generateKomentarUsers(generateRandomEvenNumber(1, 20));
    return Scaffold(
      body: ScreenUtilInit(
        builder: (context, child) {
          return ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: 60,
              ),
              Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(top: 45, right: 30, bottom: 30),
                      child: Image.asset(
                        profileDoctor.gambarDokter.toString(),
                        fit: BoxFit.cover,
                        width: 130,
                        height: 130,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ComponentTextPrimaryTittleBold(
                          teks: profileDoctor.namaDokter,
                          textAlign: TextAlign.start,
                          colorText: Colors.white,
                          size: SizeApp.SizeTextHeader.sp,
                        ),
                        ComponentTextPrimaryDescriptionRegular(
                          teks: "Dokter Spesialis Anak",
                          textAlign: TextAlign.start,
                          colorText: Colors.white,
                          size: SizeApp.SizeTextDescription.sp,
                        ),
                        SizedBox(
                          height: 15.h,
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
                      ],
                    ),
                  ),
                ],
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r)),
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(20.0.h),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(children: [
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    Column(
                                      children: [
                                        ComponentTextPrimaryTittleBold(
                                          teks:
                                              "${generateRandomEvenNumber(10, 1000)}+",
                                          colorText: Colors.white,
                                          size: SizeApp.SizeTextDescription.sp,
                                        ),
                                        ComponentTextPrimaryDescriptionRegular(
                                          teks: "Pasien",
                                          colorText: Colors.white,
                                          size: SizeApp.SizeTextDescription.sp,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                  ]),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(children: [
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Icon(
                                      Icons.local_post_office,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Column(
                                      children: [
                                        ComponentTextPrimaryTittleBold(
                                          teks:
                                              "${generateRandomEvenNumber(1, 10)}+ Tahun",
                                          colorText: Colors.white,
                                          size: SizeApp.SizeTextDescription.sp,
                                        ),
                                        ComponentTextPrimaryDescriptionRegular(
                                          teks: "Pengalaman",
                                          colorText: Colors.white,
                                          size: SizeApp.SizeTextDescription.sp,
                                        )
                                      ],
                                    ),
                                  ]),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        ComponentTextPrimaryDescriptionBold(
                          teks: "Deksripsi",
                          size: SizeApp.SizeTextDescription.sp,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        ComponentTextPrimaryDescriptionRegular(
                          teks:
                              "${profileDoctor.namaDokter} adalah seorang dokter anak yang berkomitmen untuk memberikan perawatan terbaik kepada anak-anak dan mendukung kesehatan mereka. Dengan lebih dari 10 tahun pengalaman dalam bidang...",
                          size: SizeApp.SizeTextDescription.sp,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          children: [
                            ComponentTextPrimaryDescriptionBold(
                              teks: "Komentar Pasien",
                              size: SizeApp.SizeTextDescription.sp,
                            ),
                            Expanded(child: Container()),
                            ComponentTextPrimaryDescriptionRegular(
                              teks: "Lihat lainnya",
                              size: SizeApp.SizeTextDescription.sp,
                              colorText: ColorApp.primary,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          height: 90.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return KomentarPasien(
                                  listKomentar[index].nama.toString(),
                                  listKomentar[index].komentar.toString());
                            },
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: ComponentTextPrimaryTittleBold(
                                    teks: "Konsultasi Online",
                                    size: SizeApp.SizeTextDescription,
                                    colorText: Colors.white,
                                    textAlign: TextAlign.center,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: ColorApp.primary,
                                      minimumSize: Size.fromHeight(55.h),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.r))),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 6.h,
                            ),
                            Expanded(
                              child: SizedBox(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: ComponentTextPrimaryTittleBold(
                                    teks: "Konsultasi Lansung",
                                    size: SizeApp.SizeTextDescription,
                                    colorText: Colors.white,
                                    textAlign: TextAlign.center,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: ColorApp.primary,
                                      minimumSize: Size.fromHeight(55.h),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.r))),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                      ]),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget KomentarPasien(String nama, String komentar) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ProfilePicture(
                    name: '$nama',
                    radius: 10,
                    fontsize: 5.sp,
                    random: true,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ComponentTextPrimaryDescriptionBold(
                    teks: "$nama",
                    size: SizeApp.SizeTextDescription.sp,
                  )
                ],
              ),
              SizedBox(
                width: 180,
                child: Text(
                  "$komentar",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.poppins(
                    fontSize: SizeApp.SizeTextButton.sp,
                    fontWeight: FontWeight.normal,
                    textStyle: TextStyle(color: Colors.black),
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
