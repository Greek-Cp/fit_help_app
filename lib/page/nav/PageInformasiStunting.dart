import 'dart:math';

import 'package:fit_help_app/component/ComponentText.dart';
import 'package:fit_help_app/page/BaseNav.dart';
import 'package:fit_help_app/util/list_color.dart';
import 'package:fit_help_app/util/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class PageInformasiStunting extends StatefulWidget {
  static String? routeName = "/PageInformasiStunting";
  @override
  State<PageInformasiStunting> createState() => _PageInformasiStuntingState();
}

class ArtikelInformasi {
  String? namaArtikel;
  String? sumberArtikel;
  String? gambarArtikel;
  String? urlArtikel;
  ArtikelInformasi(this.namaArtikel, this.sumberArtikel, this.gambarArtikel,
      this.urlArtikel);
}

class _PageInformasiStuntingState extends State<PageInformasiStunting> {
  Future<void> _launchUrl(String? url) async {
    if (!await launchUrl(Uri.parse(url.toString()))) {
      throw Exception('Could not launch $url');
    }
  }

  Widget cardInformasi(ArtikelInformasi artikelInformasi) {
    return GestureDetector(
      onTap: () {
        _launchUrl(artikelInformasi.urlArtikel);
      },
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
        color: Colors.white,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: Image.asset(
                "${artikelInformasi.gambarArtikel.toString()}",
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 230,
                  child: Text("${artikelInformasi.namaArtikel}",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 10.sp, fontWeight: FontWeight.bold)),
                ),
                ComponentTextPrimaryDescriptionRegular(
                  teks: "${artikelInformasi.sumberArtikel}",
                  size: SizeApp.SizeTextButton.sp,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: ComponentTextPrimaryDescriptionRegular(
                      teks: "Baca selengkapnya",
                      size: SizeApp.SizeTextButton.sp,
                      colorText: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<ArtikelInformasi> listArtikelInformasi = [
    ArtikelInformasi("Apa Itu Stunting ", "Alo Dokter", "assets/stunting_1.jpg",
        "https://www.alodokter.com/stunting"),
    ArtikelInformasi(
        "Memahami Stunting Pada Anak ",
        "Alo Dokter",
        "assets/stunting_2.jpg",
        "https://www.alodokter.com/memahami-stunting-pada-anak"),
    ArtikelInformasi(
        "Cara Mencegah Stunting Agar Anak Tumbuh Tinggi Dan Sehat",
        "Silioamhospitals",
        "assets/stunting_3.png",
        "https://www.siloamhospitals.com/informasi-siloam/artikel/apa-itu-stunting"),
    ArtikelInformasi(
        "Mengenal Apa Itu Stunting",
        "Kemkes",
        "assets/stunting_4.jpg",
        "https://yankes.kemkes.go.id/view_artikel/1388/mengenal-apa-itu-stunting"),
    ArtikelInformasi("Gejala Stunting", "Halodoc", "assets/stunting_5.png",
        "https://www.halodoc.com/kesehatan/stunting"),
    ArtikelInformasi(
        "Mengenal Stunting, dari Penyebab hingga Penanganannya",
        "hallosehat",
        "assets/stunting_6.png",
        "https://hellosehat.com/parenting/kesehatan-anak/penyakit-pada-anak/stunting/"),
    ArtikelInformasi(
        "Gejala Stunting pada Anak dan Pencegahannya",
        "primayahospital",
        "assets/stunting_7.png",
        "https://primayahospital.com/anak/mencegah-anak-stunting/"),
    ArtikelInformasi(
        "Apa Itu Stunting pada Anak? Cek Penjelasan Medisnya di Sini!",
        "pediasure",
        "assets/stunting_8.png",
        "https://pediasure.co.id/article/apa-itu-stunting-pada-anak"),
    ArtikelInformasi(
        "Ibu Harus Tahu, Ini Ciri-Ciri Stunting pada Anak",
        "halodoc",
        "assets/stunting_9.png",
        "https://www.halodoc.com/artikel/ibu-harus-tahu-ini-ciri-ciri-stunting-pada-anak"),
    ArtikelInformasi(
        "9 Ciri Anak Stunting yang Harus Diwaspadai",
        "klikdokter",
        "assets/stunting_10.png",
        "https://www.klikdokter.com/ibu-anak/kesehatan-anak/tanda-anak-stunting-yang-perlu-anda-perhatikan"),
    ArtikelInformasi(
        "Jangan Anggap Remeh, Berikut ini Ciri-ciri, Penyebab, dan Cara Mencegah Stunting pada Anak",
        "kehamilansehat",
        "assets/stunting_11.png",
        "https://kehamilansehat.com/id/ciri-ciri-dan-penyebab-stunting-pada-anak/"),
    ArtikelInformasi(
        "Jangan Anggap Remeh, Berikut ini Ciri-ciri, Penyebab, dan Cara Mencegah Stunting pada Anak",
        "kehamilansehat",
        "assets/stunting_11.png",
        "https://kehamilansehat.com/id/ciri-ciri-dan-penyebab-stunting-pada-anak/"),
    ArtikelInformasi(
        "Ciri-Ciri Stunting pada Anak yang Patut Dikenali, Ketahui Juga Penyebabnya",
        "merdeka",
        "assets/stunting_12.png",
        "https://www.merdeka.com/jatim/ciri-ciri-stunting-pada-anak-yang-patut-dikenali-ketahui-juga-penyebabnya-kln.html"),
    ArtikelInformasi(
        "Ini Penyebab Stunting pada Anak",
        "kemkes",
        "assets/stunting_13.png",
        "https://sehatnegeriku.kemkes.go.id/baca/umum/20180524/4125980/penyebab-stunting-anak/"),
    ArtikelInformasi(
        "Pahami Penyebab Stunting dan Dampaknya pada Kehidupan Anak",
        "AloDokter",
        "assets/stunting_14.png",
        "https://www.alodokter.com/bayi-lahir-stunting-faktor-penyebab-dan-risiko"),
    ArtikelInformasi(
        "Kenali Penyebab Stunting Anak",
        "RSPUP Dr.Sardjito",
        "assets/stunting_15.png",
        "https://sardjito.co.id/2019/07/22/kenali-penyebab-stunting-anak/")
  ];
  @override
  Widget build(BuildContext context) {
    listArtikelInformasi.shuffle(Random());
    // TODO: implement build
    return Scaffold(
      backgroundColor: ColorApp.primary,
      body: ScreenUtilInit(
        builder: (context, child) {
          return SafeArea(
            child: ListView(
              physics: PageScrollPhysics(),
              shrinkWrap: true,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.offAndToNamed(BaseNav.routeName.toString());
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                    ComponentTextPrimaryTittleBold(
                      teks: "Informasi Stunting ",
                      size: SizeApp.SizeTextHeader.sp,
                      colorText: Colors.white,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                ListView.builder(
                  physics: PageScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: listArtikelInformasi.length,
                  itemBuilder: (context, index) {
                    return cardInformasi(listArtikelInformasi[index]);
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
