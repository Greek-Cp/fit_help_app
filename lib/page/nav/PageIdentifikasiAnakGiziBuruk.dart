import 'package:fit_help_app/component/ComponentButton.dart';
import 'package:fit_help_app/component/ComponentText.dart';
import 'package:fit_help_app/page/BaseNav.dart';
import 'package:fit_help_app/page/nav/PageIdentifikasiAnak.dart';
import 'package:fit_help_app/page/nav/PageInformasiGiziBurk.dart';
import 'package:fit_help_app/util/list_color.dart';
import 'package:fit_help_app/util/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PageIdentifikasiAnakGiziBuruk extends StatefulWidget {
  static String? routeName = "/PageIdentifikasiAnakGiziBuruk";
  @override
  State<PageIdentifikasiAnakGiziBuruk> createState() =>
      _PageIdentifikasiAnakGiziBurukState();
}

class SoalData {
  String? teksSoal;
  List<String>? listJawaban;
  String? jawabanUser;
  SoalData(this.teksSoal, this.listJawaban, this.jawabanUser);
}

class _PageIdentifikasiAnakGiziBurukState
    extends State<PageIdentifikasiAnakGiziBuruk> {
  List<SoalData> listSoal = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listSoal = [
      SoalData(
        "Apakah tubuh anak usia satu tahun tampak sangat kurus?",
        [
          "a) Ya, tubuh anak tampak sangat kurus.",
          "b) Tidak, tubuh anak tampak normal.",
          "c) Tidak yakin/tidak bisa diketahui."
        ],
        "",
      ),
      SoalData(
        "Apakah wajah anak tampak keriput?",
        [
          "a) Ya, wajah anak tampak keriput.",
          "b) Tidak, wajah anak tampak normal.",
          "c) Tidak yakin/tidak bisa diketahui."
        ],
        "",
      ),
      SoalData(
        "Apakah kulit anak tampak kering?",
        [
          "a) Ya, kulit anak tampak kering.",
          "b) Tidak, kulit anak tampak normal.",
          "c) Tidak yakin/tidak bisa diketahui."
        ],
        "",
      ),
      SoalData(
        "Apakah perut anak tampak buncit?",
        [
          "a) Ya, perut anak tampak buncit.",
          "b) Tidak, perut anak tampak normal.",
          "c) Tidak yakin/tidak bisa diketahui."
        ],
        "",
      ),
      SoalData(
        "Apakah anak sering lemas dan tidak aktif bermain?",
        [
          "a) Ya, anak sering lemas dan tidak aktif bermain.",
          "b) Tidak, anak memiliki energi dan aktif bermain.",
          "c) Tidak yakin/tidak bisa diketahui."
        ],
        "",
      ),
      SoalData(
        "Apakah anak mengalami gangguan tumbuh kembang?",
        [
          "a) Ya, anak mengalami gangguan tumbuh kembang.",
          "b) Tidak, anak mengalami perkembangan yang normal.",
          "c) Tidak yakin/tidak bisa diketahui."
        ],
        "",
      ),
      SoalData(
        "Apakah rambut anak mudah rontok dan tampak kusam?",
        [
          "a) Ya, rambut anak mudah rontok dan tampak kusam.",
          "b) Tidak, rambut anak sehat dan tidak rontok.",
          "c) Tidak yakin/tidak bisa diketahui."
        ],
        "",
      ),
      SoalData(
        "Apakah ada pembengkakan (edema) di tungkai anak?",
        [
          "a) Ya, ada pembengkakan (edema) di tungkai anak.",
          "b) Tidak, tidak ada pembengkakan di tungkai anak.",
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
                            content: Text("Terkena Gizi Buruk"),
                            actions: [
                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        ColorApp.primary)),
                                onPressed: () {
                                  // Tambahkan logika untuk menghandle tombol "Informasi Terkait" di sini
                                  Get.offAndToNamed(PageInformasiGiziBuruk
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
                  else if (countJawabanA == listSoal.length - 1)
                    {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Hasil Identifikasi Anak Anda"),
                            content: Text("Terkena Gizi Buruk"),
                            actions: [
                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        ColorApp.primary)),
                                onPressed: () {
                                  // Tambahkan logika untuk menghandle tombol "Informasi Terkait" di sini
                                  Get.offAndToNamed(PageInformasiGiziBuruk
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
                            content: Text("Terkena Gizi Buruk"),
                            actions: [
                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        ColorApp.primary)),
                                onPressed: () {
                                  Get.offAndToNamed(PageInformasiGiziBuruk
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
                            content: Text("Terkena Gizi Buruk"),
                            actions: [
                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        ColorApp.primary)),
                                onPressed: () {
                                  // Tambahkan logika untuk menghandle tombol "Informasi Terkait" di sini
                                  Get.offAndToNamed(PageInformasiGiziBuruk
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
                            content: Text("Terkena Gizi Buruk"),
                            actions: [
                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        ColorApp.primary)),
                                onPressed: () {
                                  // Tambahkan logika untuk menghandle tombol "Informasi Terkait" di sini
                                  Get.offAndToNamed(PageInformasiGiziBuruk
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
                  else if (countJawabanA == listSoal.length - 5)
                    {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Hasil Identifikasi Anak Anda"),
                            content: Text("Terkena Gizi Buruk"),
                            actions: [
                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        ColorApp.primary)),
                                onPressed: () {
                                  // Tambahkan logika untuk menghandle tombol "Informasi Terkait" di sini
                                  Get.offAndToNamed(PageInformasiGiziBuruk
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
                  else if (countJawabanA == listSoal.length - 6)
                    {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Hasil Identifikasi Anak Anda"),
                            content: Text("Anak Anda Sehat"),
                            actions: [
                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        ColorApp.primary)),
                                onPressed: () {
                                  // Tambahkan logika untuk menghandle tombol "Informasi Terkait" di sini
                                  Get.offAndToNamed(PageInformasiGiziBuruk
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
                  else if (countJawabanA == listSoal.length - 7)
                    {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Hasil Identifikasi Anak Anda"),
                            content: Text("Anak Anda Sehat"),
                            actions: [
                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        ColorApp.primary)),
                                onPressed: () {
                                  // Tambahkan logika untuk menghandle tombol "Informasi Terkait" di sini
                                  Get.offAndToNamed(PageInformasiGiziBuruk
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
                  else if (countJawabanA == listSoal.length - 8)
                    {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Hasil Identifikasi Anak Anda"),
                            content: Text("Anak Anda Sehat"),
                            actions: [
                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        ColorApp.primary)),
                                onPressed: () {
                                  // Tambahkan logika untuk menghandle tombol "Informasi Terkait" di sini
                                  Get.offAndToNamed(PageInformasiGiziBuruk
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
