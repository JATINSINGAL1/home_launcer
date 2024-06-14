// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:url_launcher/url_launcher.dart';

void _launchUrl(Uri uri) async {
  try {
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  } catch (e) {
    print(e.toString());
  }
}

Widget FAB() {
  return SpeedDial(
    animatedIcon: AnimatedIcons.menu_close,
    animatedIconTheme: const IconThemeData(size: 22),
    visible: true,
    curve: Curves.bounceIn,
    children: [
      SpeedDialChild(
          onTap: () async {
            bool isInstalled = await DeviceApps.isAppInstalled(
                'com.sec.android.app.popupcalculator');
            if (isInstalled != false) {
              DeviceApps.openApp('com.sec.android.app.popupcalculator');
            } else {
              print("can't open");
            }
          },
          label: "Calculator",
          child: const Icon(Icons.calculate)),
      SpeedDialChild(
          onTap: () async {
            bool isInstalled =
                await DeviceApps.isAppInstalled('com.samsung.android.calendar');
            if (isInstalled != false) {
              DeviceApps.openApp('com.samsung.android.calendar');
            } else {
              print("can't open");
            }
          },
          label: "Calendar",
          child: const Icon(Icons.calendar_view_month)),
      SpeedDialChild(
          onTap: () {
            _launchUrl(Uri.parse('tel:+123156789'));
          },
          label: "Phone",
          child: const Icon(Icons.dialpad)),
    ],
  );
}
