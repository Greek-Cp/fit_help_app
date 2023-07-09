import 'dart:math';

import 'package:fit_help_app/component/ComponentText.dart';
import 'package:fit_help_app/page/BaseNav.dart';
import 'package:fit_help_app/util/list_color.dart';
import 'package:fit_help_app/util/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class PageInformasiGiziBuruk extends StatefulWidget {
  static String? routeName = "/PageInformasiGiziBuruk";
  @override
  State<PageInformasiGiziBuruk> createState() => _PageInformasiGiziBurukState();
}

class ArtikelInformasi {
  String? namaArtikel;
  String? sumberArtikel;
  String? gambarArtikel;
  String? urlArtikel;
  ArtikelInformasi(this.namaArtikel, this.sumberArtikel, this.gambarArtikel,
      this.urlArtikel);
}

class _PageInformasiGiziBurukState extends State<PageInformasiGiziBuruk> {
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
                artikelInformasi.gambarArtikel.toString(),
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
    ArtikelInformasi(
      'Gizi Buruk - Gejala, penyebab dan dan mengobati',
      'AloDokter',
      'assets/giziburuk_1.jpg',
      'https://www.alodokter.com/gizi-buruk',
    ),
    ArtikelInformasi(
      'Gizi Buruk pada Anak: Jenis dan Penanganannya Sesuai...',
      'HelloSehat',
      'assets/giziburuk_2.png',
      'https://hellosehat.com/parenting/kesehatan-anak/gizi-buruk-pada-anak/',
    ),
    ArtikelInformasi(
      'Gizi Buruk | Tanda dan Gejala, Penyebab, Cara...',
      'SehatQ',
      'assets/giziburuk_3.png',
      'https://www.sehatq.com/penyakit/gizi-buruk',
    ),
    ArtikelInformasi(
      'Gizi Buruk - Penyebab, Gejala, Pengobatan - KlikDokter',
      'KlikDokter',
      'assets/giziburuk_4.png',
      'https://www.klikdokter.com/penyakit/masalah-metabolik/gizi-buruk',
    ),
    ArtikelInformasi(
      'Serupa Tapi Tak Sama, Kenali Beda Stunting dan Gizi Buruk',
      'Indonesia Baik',
      'assets/giziburuk_5.png',
      'https://indonesiabaik.id/infografis/serupa-tapi-tak-sama-kenali-beda-stunting-dan-gizi-buruk',
    ),
    ArtikelInformasi(
      'Serupa Tapi Tak Sama, Kenali Beda Stunting dan Gizi Buruk',
      'stikeshb',
      'assets/giziburuk_6.png',
      'https://stikeshb.ac.id/pengertian-gizi-buruk-dan-tanda/',
    ),
    ArtikelInformasi(
      'Tanda-tanda Balita Gizi Buruk, Penyebab dan Cara',
      'Primaya Hospital',
      'assets/giziburuk_7.png',
      'https://primayahospital.com/anak/balita-gizi-buruk/',
    ),
    ArtikelInformasi(
      'judul',
      'HaloDoc',
      'assets/giziburuk_8.png',
      'https://www.halodoc.com/artikel/ibu-kenali-faktor-penyebab-anak-mengalami-gizi-buruk',
    ),
    ArtikelInformasi(
      'Gizi Buruk, Waspadai Busung Lapar dan Stunting pada',
      'Orami',
      'assets/giziburuk_9.png',
      'https://www.orami.co.id/magazine/gizi-buruk',
    ),
    ArtikelInformasi(
      'Gizi Buruk Balita: Jenis dan Cara Mengobatinya',
      'theasianparent',
      'assets/giziburuk_10.png',
      'https://id.theasianparent.com/gizi-buruk-balita',
    ),
    ArtikelInformasi(
      'Apa itu Gizi Buruk, Tanda, dan Gejalanya',
      'rsbudimedika',
      'assets/giziburuk_11.png',
      'https://www.rsbudimedika.com/gejala-gizi-buruk/',
    ),
    ArtikelInformasi(
      'Ciri Gizi Buruk Pada Anak - Hermina Hospitals',
      'Hermina Hospital',
      'assets/giziburuk_12.png',
      'https://herminahospitals.com/id/articles/ciri-gizi-buruk-pada-anak.html',
    ),
    ArtikelInformasi(
      'Gizi | UNICEF Indonesia',
      'unicef',
      'assets/giziburuk_13.png',
      'https://www.unicef.org/indonesia/id/gizi',
    ),
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
                      teks: "Informasi Gizi Buruk ",
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
                    print("${listArtikelInformasi[index].gambarArtikel}");
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
