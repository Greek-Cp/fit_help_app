import 'package:fit_help_app/model/ModelAkun.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AkunController extends GetxController {
  var akun = ModelAkun(
          namaLengkap: '',
          noHandphone: '',
          email: '',
          kataSandi: '',
          alamat: '')
      .obs;

  String? statusAnak = "";

  Future<void> saveAkun(String namaLengkap, String noHandphone, String email,
      String kataSandi, String alamat) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('namaLengkap', namaLengkap);
    await prefs.setString('noHandphone', noHandphone);
    await prefs.setString('email', email);
    await prefs.setString('kataSandi', kataSandi);
    await prefs.setString('alamat', alamat);

    akun.value = ModelAkun(
      namaLengkap: namaLengkap,
      noHandphone: noHandphone,
      email: email,
      kataSandi: kataSandi,
      alamat: alamat,
    );
  }

  Future<void> loadAkun() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? namaLengkap = prefs.getString('namaLengkap');
    final String? noHandphone = prefs.getString('noHandphone');
    final String? email = prefs.getString('email');
    final String? kataSandi = prefs.getString('kataSandi');
    final String? alamat = prefs.getString('alamat');

    akun.value = ModelAkun(
      namaLengkap: namaLengkap ?? '',
      noHandphone: noHandphone ?? '',
      email: email ?? '',
      kataSandi: kataSandi ?? '',
      alamat: alamat ?? '',
    );
  }
}
