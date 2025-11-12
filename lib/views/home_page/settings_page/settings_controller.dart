import 'package:flutter/material.dart';
import 'package:umatter/views/home_page/settings_page/settings_info.dart';

class SettingsControllerPage {
  List<SettingsInfoPage> settingsController = [
    SettingsInfoPage(
      title: "Notification",
      icon: const Icon(Icons.notifications_none_outlined),
      actionIcon: const Icon(Icons.chevron_right),
    ),
    SettingsInfoPage(
      title: "Terms and Conditions",
      icon: const Icon(Icons.description_outlined),
      actionIcon: const Icon(Icons.chevron_right),
    ),
    SettingsInfoPage(
      title: "Privacy Policy",
      icon: const Icon(Icons.privacy_tip_outlined),
      actionIcon: const Icon(Icons.chevron_right),
    ),
    SettingsInfoPage(
      title: "About Page",
      icon: const Icon(Icons.info_outline_rounded),
      actionIcon: const Icon(Icons.chevron_right),
    ),
    SettingsInfoPage(
      title: "Delete Account",
      icon: const Icon(Icons.delete_outline),
      actionIcon: const Icon(Icons.chevron_right),
    ),
    SettingsInfoPage(
      title: "Report a Problem",
      icon: const Icon(Icons.report_gmailerrorred_outlined),
      actionIcon: const Icon(Icons.chevron_right),
    ),
    SettingsInfoPage(
      title: "Log out",
      icon: const Icon(Icons.logout_rounded),
      actionIcon: const Icon(Icons.chevron_right),
    ),
  ];
}
