import 'package:fit_help_app/component/ComponentText.dart';
import 'package:fit_help_app/controller/DokterController.dart';
import 'package:fit_help_app/page/PageCariDokterAnak.dart';
import 'package:fit_help_app/page/nav/PageChat.dart';
import 'package:fit_help_app/util/list_color.dart';
import 'package:fit_help_app/util/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PageListChat extends StatefulWidget {
  static String? routeName = "/PageListChat";
  @override
  State<PageListChat> createState() => _PageListChatState();
}

class _PageListChatState extends State<PageListChat> {
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
      String? gambarProfile}) {
    return Card(
      color: Colors.white,
      elevation: 10,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(children: [
          CircleAvatar(
            backgroundImage: AssetImage(gambarProfile.toString()),
          ),
          SizedBox(
            width: 10.w,
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
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: Colors.white,
                elevation: 0,
                child: Row(children: [
                  // ignore: prefer_const_constructors
                  Padding(
                    padding: EdgeInsets.only(left: 0, right: 5),
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.green,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: ComponentTextPrimaryDescriptionRegular(
                      teks: "Online",
                    ),
                  )
                ]),
              ),
            ],
          )
        ]),
      ),
    );
  }

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
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: ComponentTextPrimaryDescriptionBold(
                  teks: "Chat Saya",
                  size: SizeApp.SizeTextHeader.sp,
                  colorText: Colors.white,
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, bottom: 20),
                child: ComponentTextPrimaryDescriptionRegular(
                  teks: "chat dengan dokter",
                  size: SizeApp.SizeTextDescription.sp,
                  colorText: Colors.white,
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                child: Card(
                    margin: EdgeInsets.zero,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r)),
                    child: ListView.builder(
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
                            Get.toNamed(PageChat.routeName.toString());
                          },
                          child: itemSearchDoctor(
                              idDoctor:
                                  '', // Provide the appropriate idDoctor value if needed
                              nameDoctor: doctor.namaDokter,
                              job: doctor.jobDokter,
                              gambarProfile: doctor.gambarDokter),
                        );
                      },
                    )),
              )
            ],
          );
        },
      ),
    );
  }
}
