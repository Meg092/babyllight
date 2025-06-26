import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';



class DollComputedLogic extends GetxController {

  var cshygqumw = RxBool(false);
  var ndxqlsywmu = RxBool(true);
  var nfzilk = RxString("");
  var victor = RxBool(false);
  var zulauf = RxBool(true);
  final kulacfqi = Dio();


  InAppWebViewController? webViewController;

  dynamic ilqzkgur(){
    final djwrzplogb = InternetConnectionChecker.instance;
    final asbexdu = djwrzplogb.onStatusChange.skip(1).listen(
          (InternetConnectionStatus yrqfsm) {
        if (yrqfsm == InternetConnectionStatus.connected) {
          wjgtl();
        } else {
          Get.toNamed('/dollNot')?.then((_){
            wjgtl();
          });
        }
      },
    );
    return asbexdu;
  }

  Future<bool> vngjpwt() async {
    var dknxrplbfe = await InternetConnectionChecker.instance.hasConnection;
    if(!dknxrplbfe){
      Get.toNamed('/dollNot')?.then((_){
        wjgtl();
      });
    }
    return dknxrplbfe;
  }

  @override
  void onInit() {
    super.onInit();
    ilqzkgur();
    wjgtl();
  }


  Future<void> wjgtl() async {

    var cugvjbxta = await vngjpwt();
    if(!cugvjbxta){
      return;
    }

    victor.value = true;
    zulauf.value = true;
    ndxqlsywmu.value = false;

    kulacfqi.post("https://api.handdup.com/dqvmcbhxtuoepyrzfgjsklnawi",data: await fdertan()).then((value) {
      var gnzef = value.data["gnzef"] as String;
      var sfezvdm = value.data["sfezvdm"] as bool;
      if (sfezvdm) {
        nfzilk.value = gnzef;
        audrey();
      } else {
        jacobi();
      }
    }).catchError((e) {
      ndxqlsywmu.value = true;
      zulauf.value = true;
      victor.value = false;
    });
  }

  Future<Map<String, dynamic>> fdertan() async {
    final DeviceInfoPlugin efkrs = DeviceInfoPlugin();
    PackageInfo ucxoyq_npqdex = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var cmaqn = Platform.localeName;
    var ylmb = currentTimeZone;

    var rgqfant = ucxoyq_npqdex.packageName;
    var qxijb = ucxoyq_npqdex.version;
    var htrdmg = ucxoyq_npqdex.buildNumber;

    var ofdes = ucxoyq_npqdex.appName;
    var lysupdom = "";
    var ciwyv  = "";
    var pyhk = "";
    var ludwigCruickshank = "";
    var brendaGibson = "";
    var veldaLangosh = "";
    var jacksonRomaguera = "";
    var devonteWaters = "";
    var demarcoJacobs = "";
    var thoraWeber = "";


    var ktpz = "";
    var ejphavrd = false;

    if (GetPlatform.isAndroid) {
      ktpz = "android";
      var qelgpryhn = await efkrs.androidInfo;

      pyhk = qelgpryhn.brand;

      lysupdom  = qelgpryhn.model;
      ciwyv = qelgpryhn.id;

      ejphavrd = qelgpryhn.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      ktpz = "ios";
      var fqnvmzuc = await efkrs.iosInfo;
      pyhk = fqnvmzuc.name;
      lysupdom = fqnvmzuc.model;

      ciwyv = fqnvmzuc.identifierForVendor ?? "";
      ejphavrd  = fqnvmzuc.isPhysicalDevice;
    }
    var res = {
      "htrdmg": htrdmg,
      "qxijb": qxijb,
      "jacksonRomaguera" : jacksonRomaguera,
      "rgqfant": rgqfant,
      "lysupdom": lysupdom,
      "ylmb": ylmb,
      "ofdes": ofdes,
      "veldaLangosh" : veldaLangosh,
      "cmaqn": cmaqn,
      "ktpz": ktpz,
      "ejphavrd": ejphavrd,
      "ludwigCruickshank" : ludwigCruickshank,
      "ciwyv": ciwyv,
      "brendaGibson" : brendaGibson,
      "devonteWaters" : devonteWaters,
      "pyhk": pyhk,
      "demarcoJacobs" : demarcoJacobs,
      "thoraWeber" : thoraWeber,

    };
    return res;
  }

  Future<void> jacobi() async {
    Get.offNamed("/dollMain");
  }

  Future<void> audrey() async {
    Get.offNamed("/dollSettingTool");
  }

  @override
  void dispose() {
    ilqzkgur().cancel();
    super.dispose();
  }

}
