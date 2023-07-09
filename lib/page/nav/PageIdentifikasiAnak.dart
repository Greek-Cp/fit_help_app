import 'package:fit_help_app/component/ComponentButton.dart';
import 'package:fit_help_app/component/ComponentText.dart';
import 'package:fit_help_app/page/BaseNav.dart';
import 'package:fit_help_app/page/nav/PageIdentifikasiAnak.dart';
import 'package:fit_help_app/page/nav/PageInformasiStunting.dart';
import 'package:fit_help_app/util/list_color.dart';
import 'package:fit_help_app/util/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PageIdentifikasAnakStunting extends StatefulWidget {
  static String? routeName = "/PageIdentifikasAnakStunting";
  @override
  State<PageIdentifikasAnakStunting> createState() =>
      _PageIdentifikasAnakStuntingState();
}

class SoalData {
  String? teksSoal;
  List<String>? listJawaban;
  String? jawabanUser;
  SoalData(this.teksSoal, this.listJawaban, this.jawabanUser);
}

class _PageIdentifikasAnakStuntingState
    extends State<PageIdentifikasAnakStunting> {
  List<SoalData> listSoal = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listSoal = [
      SoalData(
        "Apakah anak usia satu tahun memiliki pertumbuhan tulang yang tertunda?",
        [
          "a) Ya, pertumbuhan tulang anak tersebut tertunda.",
          "b) Tidak, pertumbuhan tulang anak tersebut normal.",
          "c) Tidak yakin/tidak bisa diketahui."
        ],
        "",
      ),
      SoalData(
        "Apakah berat badan anak tersebut rendah dibandingkan dengan anak seusianya?",
        [
          "a) Ya, berat badan anak tersebut rendah.",
          "b) Tidak, berat badan anak tersebut normal.",
          "c) Tidak yakin/tidak bisa diketahui."
        ],
        "",
      ),
      SoalData(
        "Apakah sang anak berbadan lebih pendek dari anak seusianya?",
        [
          "a) Ya, anak tersebut lebih pendek dari anak seusianya.",
          "b) Tidak, anak tersebut memiliki tinggi badan yang normal.",
          "c) Tidak yakin/tidak bisa diketahui."
        ],
        "",
      ),
      SoalData(
        "Apakah proporsi tubuh anak tersebut cenderung normal tapi tampak lebih muda/kecil untuk seusianya?",
        [
          "a) Ya, proporsi tubuh anak tersebut tampak lebih muda/kecil.",
          "b) Tidak, proporsi tubuh anak tersebut sesuai dengan usianya.",
          "c) Tidak yakin/tidak bisa diketahui."
        ],
        "",
      ),
    ];
  }

  int countJawabanA = 0;
  String jawabanUser = "";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: ScreenUtilInit(
        builder: (context, child) {
          return ListView(
            shrinkWrap: true,
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ))),
              ComponentTextPrimaryTittleBold(
                teks: "Identifikasi Anak Anda",
                size: SizeApp.SizeTextHeader.sp,
                colorText: Colors.white,
                textAlign: TextAlign.center,
              ),
              ComponentTextPrimaryDescriptionRegular(
                teks:
                    "Jawab Pertanyaan Berikut ini untuk mengidentifikasi apakah anak anda terbebas dari Stunting dan Gizi buruk? ",
                size: SizeApp.SizeTextButton.sp,
                colorText: Colors.white,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Card(
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60.r),
                        topRight: Radius.circular(60.r))),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: listSoal.length,
                    physics: PageScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pertanyaan ${index + 1}:",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            listSoal[index].teksSoal ?? "",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 16),
                          Column(
                            children:
                                listSoal[index].listJawaban?.map((jawaban) {
                                      return RadioListTile<String>(
                                        title: Text(jawaban),
                                        value: jawaban,
                                        groupValue: listSoal[index]
                                            .jawabanUser
                                            .toString(),
                                        onChanged: (value) {
                                          setState(() {
                                            listSoal[index].jawabanUser = value;
                                            print("value $value");
                                          });
                                        },
                                      );
                                    }).toList() ??
                                    [],
                          ),
                          SizedBox(height: 16),
                        ],
                      );
                    },
                  ),
                ),
              ),
              ComponentButtonPrimaryWithFunction(
                "Cek Hasil",
                () => {
                  countJawabanA = 0,
                  for (int i = 0; i < listSoal.length; i++)
                    {
                      jawabanUser = listSoal[i].jawabanUser!.substring(0, 1),
                      if (jawabanUser == 'a') {countJawabanA += 1}
                    },
                  if (countJawabanA == listSoal.length)
                    {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Hasil Identifikasi Anak Anda"),
                            content: Text("Terkena Stunting"),
                            actions: [
                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        ColorApp.primary)),
                                onPressed: () {
                                  // Tambahkan logika untuk menghandle tombol "Informasi Terkait" di sini
                                  Get.offAndToNamed(
                                      BaseNav.routeName.toString());
                                },
                                child: Text(
                                  "Informasi Terkait",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          );
                        },
                      )
                    }
                  else if (countJawabanA == listSoal.length - 1)
                    {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Hasil Identifikasi Anak Anda"),
                            content: Text("Terkena Stunting"),
                            actions: [
                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        ColorApp.primary)),
                                onPressed: () {
                                  Get.offAndToNamed(PageInformasiStunting
                                      .routeName
                                      .toString());
                                },
                                child: Text(
                                  "Informasi Terkait",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          );
                        },
                      )
                    }
                  else if (countJawabanA == listSoal.length - 2)
                    {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Hasil Identifikasi Anak Anda"),
                            content: Text("Terkena Stunting"),
                            actions: [
                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        ColorApp.primary)),
                                onPressed: () {
                                  // Tambahkan logika untuk menghandle tombol "Informasi Terkait" di sini
                                  Get.offAndToNamed(PageInformasiStunting
                                      .routeName
                                      .toString());
                                },
                                child: Text(
                                  "Informasi Terkait",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          );
                        },
                      )
                    }
                  else if (countJawabanA == listSoal.length - 3)
                    {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Hasil Identifikasi Anak Anda"),
                            content: Text("Anak Anda Tidak Stunting"),
                            actions: [
                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        ColorApp.primary)),
                                onPressed: () {
                                  // Tambahkan logika untuk menghandle tombol "Informasi Terkait" di sini
                                  Get.offAndToNamed(PageInformasiStunting
                                      .routeName
                                      .toString());
                                },
                                child: Text(
                                  "Kembali",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          );
                        },
                      )
                    }
                  else if (countJawabanA == listSoal.length - 4)
                    {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Hasil Identifikasi Anak Anda"),
                            content: Text("Anak Anda Tidak Stunting"),
                            actions: [
                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        ColorApp.primary)),
                                onPressed: () {
                                  // Tambahkan logika untuk menghandle tombol "Informasi Terkait" di sini
                                  Get.offAndToNamed(PageInformasiStunting
                                      .routeName
                                      .toString());
                                },
                                child: Text(
                                  "Kembali",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          );
                        },
                      )
                    }
                },
                colorButton: ColorApp.primary,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget Soal(String teksSoal, List<String> opsiJawaban) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, top: 20),
          child: ComponentTextPrimaryTittleBold(
            teks: teksSoal,
            colorText: Colors.black,
            size: SizeApp.SizeTextHeader.sp,
            textAlign: TextAlign.start,
          ),
        ),
        RadioListTile(
          title: ComponentTextPrimaryDescriptionRegular(
            teks: opsiJawaban[0],
            colorText: Colors.black,
            size: SizeApp.SizeTextHeader.sp,
          ),
          value: "male",
          groupValue: "gender",
          onChanged: (value) {
            setState(() {});
          },
        ),
        RadioListTile(
          title: ComponentTextPrimaryDescriptionRegular(
            teks: "Kurang Dari 2 Tahun",
            colorText: Colors.black,
            size: SizeApp.SizeTextHeader.sp,
          ),
          value: "male",
          groupValue: "gender",
          onChanged: (value) {
            setState(() {});
          },
        ),
        RadioListTile(
          title: ComponentTextPrimaryDescriptionRegular(
            teks: "Kurang Dari 2 Tahun",
            colorText: Colors.black,
            size: SizeApp.SizeTextHeader.sp,
          ),
          value: "male",
          groupValue: "gender",
          onChanged: (value) {
            setState(() {});
          },
        ),
      ],
    );
  }
}
