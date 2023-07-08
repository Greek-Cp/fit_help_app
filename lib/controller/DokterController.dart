import 'package:fit_help_app/page/PageCariDokterAnak.dart';
import 'package:get/get.dart';

class DoctorController extends GetxController {
  var profileDoctor = ProfileDoctor('', '', '', null).obs;

  void setProfileDoctor(String namaDokter, String jobDokter,
      String gambarDokter, bool? statusOnline) {
    profileDoctor.value =
        ProfileDoctor(namaDokter, jobDokter, gambarDokter, statusOnline);
  }

  ProfileDoctor getProfileDoctor() {
    return profileDoctor.value;
  }
}
