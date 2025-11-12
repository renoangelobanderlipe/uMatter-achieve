import 'package:umatter/views/home_page/reach_out/campus_professional/campus_profile_page/schedule_sounselling.dart';
import 'package:umatter/views/home_page/reach_out/reach_out_model/directories_model.dart';

import '../../views/home_page/reach_out/campus_professional/campus_professional_page.dart';
import '../../views/home_page/reach_out/external_directories/external_directories.dart';

List<ProfessionalInfoPage> professionalInfoController = [
  ProfessionalInfoPage(
    route: const ScheduleCounsellingPage(),
    title: "Schedule Counselling",
    subtitle: "Get Consultation with just a few taps.",
    color: 0xff58c29e,
  ),
  ProfessionalInfoPage(
    route: const CampusProfessionalPage(),
    title: "Campus Guidance Counselors",
    subtitle:
        "Check the list of available campus counselors you can reach out to.",
    color: 0xff555b6e,
  ),
  ProfessionalInfoPage(
    route: const ExternalDirectoriesPage(),
    title: "Department of Health Hotlines",
    subtitle:
        "Check the list of Department of Health Hotlines that you can dial and visit .",
    color: 0xffe4be9e,
  ),

  // ProfessionalInfoPage(
  //   route: const MentalHealthCommunitiesPage(),
  //   title: "Mental Health Communities",
  //   subtitle:
  //       "We provide the list of available communnities out ther for you to visit and interact with the professionals.",
  //   color: 0xff3c6e71,
  // ),
];
