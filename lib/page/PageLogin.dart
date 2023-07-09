import 'package:firebase_database/firebase_database.dart';
import 'package:fit_help_app/component/ComponentButton.dart';
import 'package:fit_help_app/component/ComponentText.dart';
import 'package:fit_help_app/component/ComponentTextField.dart';
import 'package:fit_help_app/controller/AkunController.dart';
import 'package:fit_help_app/model/ModelAkun.dart';
import 'package:fit_help_app/page/BaseNav.dart';
import 'package:fit_help_app/util/SharedPrefencesHelper.dart';
import 'package:fit_help_app/util/list_color.dart';
import 'package:fit_help_app/util/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PageLogin extends StatefulWidget {
  static String? routeName = "/PageLogin";
  @override
  State<PageLogin> createState() => _NamePageState();
}

class _NamePageState extends State<PageLogin> {
  final AkunController akunController = Get.put(AkunController());
  TextEditingController emailController = TextEditingController();
  TextEditingController kataSandiController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void loginAccount() {
    DatabaseReference dbRef =
        FirebaseDatabase.instance.reference().child('akun');
    String email = emailController.text;
    String kataSandi = kataSandiController.text;
    print("email $email");
    dbRef.once().then((snapshot) {
      Map<dynamic, dynamic> akunList =
          snapshot.snapshot.value as Map<dynamic, dynamic>;
      print("akun list ${akunList}");
      if (akunList != null) {
        bool isLoginSuccessful = false;
        akunList.forEach((key, value) {
          Map<dynamic, dynamic> akunData = value as Map<dynamic, dynamic>;
          print("akun data ${akunData['email']}");
          if (akunData['email'] == email &&
              akunData['kataSandi'] == kataSandi) {
            isLoginSuccessful = true;
            String namaLengkap = akunData['namaLengkap'];
            String alamat = akunData['alamat'];
            String kataSandi = akunData['kataSandi'];
            String noHandphone = akunData['noHandphone'];
            String email = akunData['email'];

            SharedPreferencesHelper.setLoggedIn(true);

            akunController.saveAkun(
                namaLengkap, noHandphone, email, kataSandi, alamat);
            Get.snackbar("Berhasil", "Login");
            Get.toNamed(BaseNav.routeName.toString());
            print("Login Berhasil");
            // Lakukan tindakan sesuai kebutuhan setelah berhasil login
          }
        });
        if (!isLoginSuccessful) {
          // Handle kesalahan login, misalnya menampilkan pesan kesalahan

          Get.snackbar("Gagal", "Mohon Cek Kembali Email Dan Password Anda");
          print('Gagal login: email atau kata sandi salah');
        }
      } else {
        // Handle ketika akunList bernilai null
        print('Gagal login: Tidak ada data akun');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ScreenUtilInit(
          builder: (context, child) {
            return Padding(
              padding: EdgeInsets.only(left: 20.h, right: 20.h, top: 30),
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
                    TextFieldPassword(kataSandiController, "Kata Sandi", true,
                        "Minimal 8 karakter", "Kata Sandi"),

                    SizedBox(
                      height: 30.h,
                    ),
                    ComponentButtonPrimaryWithFunction(
                      "Masuk",
                      () => {
                        if (_formKey.currentState!.validate())
                          {
                            loginAccount(),
                          }
                        else
                          {}
                      },
                      colorButton: ColorApp.primary,
                    ),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //         child: Divider(
                    //       height: 2,
                    //     )),
                    //     Padding(
                    //       padding: EdgeInsets.only(
                    //           left: 10, right: 10, top: 10, bottom: 10),
                    //       child: ComponentTextPrimaryDescriptionRegular(
                    //         teks: "atau",
                    //         colorText: Colors.grey,
                    //       ),
                    //     ),
                    //     Expanded(
                    //         child: Divider(
                    //       height: 2,
                    //     )),
                    //   ],
                    // )
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
