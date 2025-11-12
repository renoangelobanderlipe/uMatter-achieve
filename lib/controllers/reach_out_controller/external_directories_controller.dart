import 'package:url_launcher/url_launcher.dart';

import '../../views/home_page/reach_out/reach_out_model/external_directories_model.dart';

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

List<ExternalDirectoriesInfo> externaldirectoriesController = [
  ExternalDirectoriesInfo(title: '1553'),
  ExternalDirectoriesInfo(title: '0966-351-4518'),
  ExternalDirectoriesInfo(title: '0917-899-8727'),
  ExternalDirectoriesInfo(title: '0908-639-2672'),
  ExternalDirectoriesInfo(title: '@ncmhcrisishotline'),
  ExternalDirectoriesInfo(title: '@ncmhhotline'),
];
