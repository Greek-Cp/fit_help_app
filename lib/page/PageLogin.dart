import 'package:fit_help_app/component/ComponentButton.dart';
import 'package:fit_help_app/component/ComponentText.dart';
import 'package:fit_help_app/component/ComponentTextField.dart';
import 'package:fit_help_app/util/list_color.dart';
import 'package:fit_help_app/util/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageLogin extends StatefulWidget {
  static String? routeName = "/PageLogin";
  @override
  State<PageLogin> createState() => _NamePageState();
}

class _NamePageState extends State<PageLogin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController kataSandiController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      backgroundColor: Colors.white,
      body: ScreenUtilInit(
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
                    teks: "Masuk",
                    size: SizeApp.SizeTextHeader.sp,
                    colorText: Colors.black,
                  ),
                  ComponentTextPrimaryDescriptionRegular(
                    teks: "Untuk memulai konsultasi dengan dokter",
                    size: SizeApp.SizeTextDescription.sp,
                    colorText: Colors.black,
                  ),
                  TextFieldImport.TextForm(
                      text_kontrol: emailController,
                      labelName: "Email",
                      hintText: "Isikan dengan email anda",
                      pesanValidasi: "Email"),
                  TextFieldImport.TextForm(
                      text_kontrol: kataSandiController,
                      labelName: "Kata Sandi",
                      hintText: "Minimal 8 karakter",
                      pesanValidasi: "Kata Sandi"),
                  SizedBox(
                    height: 30.h,
                  ),
                  ComponentButtonPrimaryWithFunction(
                    "Masuk",
                    () => {if (_formKey.currentState!.validate()) {} else {}},
                    colorButton: ColorApp.primary,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Divider(
                        height: 2,
                      )),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 10),
                        child: ComponentTextPrimaryDescriptionRegular(
                          teks: "atau",
                          colorText: Colors.grey,
                        ),
                      ),
                      Expanded(
                          child: Divider(
                        height: 2,
                      )),
                    ],
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
