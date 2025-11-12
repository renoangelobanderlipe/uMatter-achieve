import 'package:url_launcher/url_launcher.dart';

class InterventionPageController {
  InterventionPageController();
  Future<void> launchUrl(url) async {
    if (await canLaunch(url)) {
      await launch(url,
          forceSafariVC: false,
          forceWebView: false,
          headers: <String, String>{'headers_key': 'headers_value'});
    }
  }

  Future<void> launchPhoneCall(String num) async {
    if (await canLaunch(num)) {
      await launch(num);
    } else {
      throw 'There is an error launching $num';
    }
  }

  // Professional
  final titleProfessional = 'Campus Professional';
  final descProfessional = 'Edit my content later on';
  // DOH
  final titleDOH = 'Campus Professional';
  final descDOH = 'Edit my content later on';
  // Info
  final titleInfo = 'For more info regarding the Mental Health Crisis Hotline.';

  final landlineNum = 1553;
  final prepaid1 = '0966-351-4518';
  final prepaid2 = '0917-899-8727';

  final smartPrepaid = '0908-639-2672';

  final fbPage = "@ncmhcrisishotline";
  final twitterPage = '@ncmhhotline';
}
