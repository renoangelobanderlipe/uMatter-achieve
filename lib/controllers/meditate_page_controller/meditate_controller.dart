import 'package:umatter/views/home_page/meditate/acoustic_guitar_page/acoustic_guitar_page.dart';
import 'package:umatter/views/home_page/meditate/instrumental/instrumental_page.dart';
import 'package:umatter/views/home_page/meditate/lofi/lofi_music.dart';
import 'package:umatter/views/home_page/meditate/piano/piano_page.dart';

import '../../models/meditate_page_models/meditate_model.dart';

class MeditatePageController {
  List<MeditateInfoPage> meditatePageController = [
    MeditateInfoPage(
      title: "Lo-Fi",
      subtitle:
          "Lo-fi beats provides just enough stimulation for the brain to tune out stress and be productive.",
      imgAsset: '',
      route: const LofiMusicPage(),
    ),
    MeditateInfoPage(
      title: "Acoustic",
      subtitle:
          "Acoustic beats gives incredible positive effects on the brain.",
      imgAsset: '',
      route: const AcousticGuitarPage(),
    ),
    MeditateInfoPage(
      title: "Piano",
      subtitle:
          "Piano beats are a terrific stress reliever and a great way to boost one's self-esteem.",
      imgAsset: '',
      route: const PianoPage(),
    ),
    MeditateInfoPage(
      title: "Instrumental",
      subtitle:
          "Instrumental beats promote cognitive recovery and mood improvement.",
      imgAsset: '',
      route: const InstrumentalPage(),
    )
  ];
}
