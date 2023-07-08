import 'package:fit_help_app/component/ComponentButton.dart';
import 'package:fit_help_app/component/ComponentText.dart';
import 'package:fit_help_app/component/ComponentTextField.dart';
import 'package:fit_help_app/util/list_color.dart';
import 'package:fit_help_app/util/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageGantiSandi extends StatefulWidget {
  static String? routeName = "/PageGantiSandi";
  @override
  State<PageGantiSandi> createState() => _PageGantiSandiState();
}

class _PageGantiSandiState extends State<PageGantiSandi> {
  TextEditingController sandiLamaController = TextEditingController();
  TextEditingController noHandphoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController kataSandiController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
                      teks: "Ganti Sandi",
                      size: SizeApp.SizeTextHeader.sp,
                      colorText: Colors.black,
                    ),
                    ComponentTextPrimaryDescriptionRegular(
                      teks: "Masukkan Sandi Lama Anda",
                      size: SizeApp.SizeTextDescription.sp,
                      colorText: Colors.black,
                    ),
                    TextFieldImport.TextForm(
                        text_kontrol: sandiLamaController,
                        labelName: "Sandi Lama",
                        hintText: "Isikan sandi lama lengkap anda",
                        pesanValidasi: "Sandi Lama"),
                    TextFieldImport.TextForm(
                        text_kontrol: noHandphoneController,
                        labelName: "Masukkan Sandi Baru",
                        hintText: "Isikan sandi baru",
                        pesanValidasi: "Sandi Baru "),
                    TextFieldImport.TextForm(
                        text_kontrol: emailController,
                        labelName: "Konfirmasi Kata Sandi Baru",
                        hintText: "Isikan dengan konfirmasi sandi anda",
                        pesanValidasi: "Konfirmasi Sandi"),
                    SizedBox(
                      height: 30.h,
                    ),
                    ComponentButtonPrimaryWithFunction(
                      "Ganti Sandi",
                      () => {if (_formKey.currentState!.validate()) {} else {}},
                      colorButton: ColorApp.primary,
                    ),
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
