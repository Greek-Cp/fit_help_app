import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:fit_help_app/component/ComponentButton.dart';
import 'package:fit_help_app/component/ComponentText.dart';
import 'package:fit_help_app/component/ComponentTextField.dart';
import 'package:fit_help_app/page/PageLogin.dart';
import 'package:fit_help_app/util/list_color.dart';
import 'package:fit_help_app/util/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PageDaftar extends StatefulWidget {
  static String? routeName = "/PageDaftar";
  @override
  State<PageDaftar> createState() => _NamePageState();
}

class _NamePageState extends State<PageDaftar> {
  TextEditingController namaLengkapController = TextEditingController();
  TextEditingController noHandphoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController kataSandiController = TextEditingController();

  TextEditingController alamatController = TextEditingController();
  void registerAccount() {
    DatabaseReference dbRef =
        FirebaseDatabase.instance.reference().child('akun');
    String uniqueId = Random().nextInt(999999).toString();
    dbRef.child(uniqueId).set({
      'namaLengkap': namaLengkapController.text,
      'alamat': alamatController.text,
      'noHandphone': noHandphoneController.text,
      'email': emailController.text,
      'kataSandi': kataSandiController.text,
    });
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ScreenUtilInit(
          builder: (context, child) {
            return Padding(
              padding: EdgeInsets.only(left: 20.h, right: 20.h),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () => {Navigator.of(context).pop()},
                        icon: Icon(Icons.arrow_back)),
                    ComponentTextPrimaryDescriptionBold(
                      teks: "Daftar",
                      size: SizeApp.SizeTextHeader.sp,
                      colorText: Colors.black,
                    ),
                    ComponentTextPrimaryDescriptionRegular(
                      teks: "Untuk memulai konsultasi dengan dokter",
                      size: SizeApp.SizeTextDescription.sp,
                      colorText: Colors.black,
                    ),
                    TextFieldImport.TextForm(
                        text_kontrol: namaLengkapController,
                        labelName: "Nama Lengkap",
                        hintText: "Isikan nama lengkap anda",
                        pesanValidasi: "Nama Lengkap"),
                    TextFieldImport.TextForm(
                        text_kontrol: alamatController,
                        labelName: "Alamat ",
                        hintText: "Isikan alamat anda",
                        pesanValidasi: "Alamat"),
                    TextFieldImport.TextFormTelp(
                        text_kontrol: noHandphoneController,
                        labelName: "No Handphone",
                        hintText: "Isikan nomor handphone",
                        pesanValidasi: "No Handphone"),
                    TextFieldImport.TextForm(
                        text_kontrol: emailController,
                        labelName: "Email",
                        hintText: "Isikan dengan email anda",
                        pesanValidasi: "Email"),
                    TextFieldPassword(kataSandiController, "Kata Sandi", true,
                        "Minimal 8 karakter", "Kata Sandi"),
                    SizedBox(
                      height: 30.h,
                    ),
                    ComponentButtonPrimaryWithFunction(
                      "Daftar",
                      () => {
                        if (_formKey.currentState!.validate())
                          {
                            Get.snackbar("Daftar", "Berhasil"),
                            registerAccount(),
                            Get.offAndToNamed(PageLogin.routeName.toString()),
                          }
                        else
                          {
                            Get.snackbar("Daftar", "Gagal"),
                          }
                      },
                      colorButton: ColorApp.primary,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
