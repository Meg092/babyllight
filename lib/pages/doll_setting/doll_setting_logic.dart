import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DollSettingLogic extends GetxController {

  restoreDefault() async {
    Get.dialog(AlertDialog(
      title: const Text('Warm reminder'),
      content: const Text('Do you want to restore default?'),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Cancel',style: TextStyle(color: Colors.black),),
        ),
        TextButton(
          onPressed: () async {
            final SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setInt('type', 1);
            prefs.setInt('bg', 0);
            prefs.setDouble('opacity', 1);
            Get.back();
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ));
  }

  aboutDollUS(BuildContext context) async {
    var info = await PackageInfo.fromPlatform();
    showAboutDialog(
      applicationName: info.appName,
      applicationVersion: info.version,
      applicationIcon: Image.asset(
        'assets/launcher.webp',
        width: 76,
        height: 76,
      ),
      children: [
        const Text(
            """We can provide you with baby patterns in different backgrounds"""),
      ],
      context: context,
    );
  }

}
