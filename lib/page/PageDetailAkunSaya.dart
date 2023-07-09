import 'package:fit_help_app/component/ComponentButton.dart';
import 'package:fit_help_app/component/ComponentText.dart';
import 'package:fit_help_app/component/ComponentTextField.dart';
import 'package:fit_help_app/controller/AkunController.dart';
import 'package:fit_help_app/util/list_color.dart';
import 'package:fit_help_app/util/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PageDetailAkunSaya extends StatefulWidget {
  static String? routeName = "/PageDetailAkunSaya";
  @override
  State<PageDetailAkunSaya> createState() => _NamePageState();
}

class _NamePageState extends State<PageDetailAkunSaya> {
  TextEditingController namaLengkapController = TextEditingController();
  TextEditingController noHandphoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController kataSandiController = TextEditingController();

  final AkunController akunController = Get.put(AkunController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    namaLengkapController.text =
        akunController.akun.value.namaLengkap.toString();
    noHandphoneController.text =
        akunController.akun.value.noHandphone.toString();
    emailController.text = akunController.akun.value.email.toString();
    kataSandiController.text = akunController.akun.value.kataSandi.toString();
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
                      teks: "Akun Anda",
                      size: SizeApp.SizeTextHeader.sp,
                      colorText: Colors.black,
                    ),
                    ComponentTextPrimaryDescriptionRegular(
                      teks: "Detail Akun Anda",
                      size: SizeApp.SizeTextDescription.sp,
                      colorText: Colors.black,
                    ),
                    Center(
                      child: ProfilePicture(
                        name: akunController.akun.value.namaLengkap,
                        radius: 39,
                        fontsize: 35.sp,
                        random: true,
                        count: 2,
                      ),
                    ),
                    TextFieldImport.TextForm(
                        text_kontrol: namaLengkapController,
                        labelName: "Nama Lengkap",
                        hintText: "Isikan nama lengkap anda",
                        pesanValidasi: "Nama Lengkap"),
                    TextFieldImport.TextForm(
                        text_kontrol: noHandphoneController,
                        labelName: "No Handphone",
                        hintText: "Isikan nomor handphone",
                        pesanValidasi: "No Handphone"),
                    TextFieldImport.TextForm(
                        text_kontrol: emailController,
                        labelName: "Email",
                        hintText: "Isikan dengan email anda",
                        pesanValidasi: "Email"),
                    SizedBox(
                      height: 30.h,
                    ),
                    ComponentButtonPrimaryWithFunction(
                      "Edit Akun",
                      () => {if (_formKey.currentState!.validate()) {} else {}},
                      colorButton: ColorApp.primary,
                    ),
                    SizedBox(
                      height: 10.h,
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
