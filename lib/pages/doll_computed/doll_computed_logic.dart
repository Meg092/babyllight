import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';



class DollComputedLogic extends GetxController {

  var qpnbfh = RxBool(false);
  var jqsctlnv = RxBool(true);
  var luxqkwy = RxString("");
  var michale = RxBool(false);
  var schuppe = RxBool(true);
  final ucsoer = Dio();


  InAppWebViewController? webViewController;

  dynamic qfetxjzgb(){
    final clptzwqmsg = InternetConnectionChecker.instance;
    final clfgmrwi = clptzwqmsg.onStatusChange.skip(1).listen(
          (InternetConnectionStatus lzirdn) {
        if (lzirdn == InternetConnectionStatus.connected) {
          pkwdmij();
        } else {
          Get.toNamed('/dollNot')?.then((_){
            pkwdmij();
          });
        }
      },
    );
    return clfgmrwi;
  }

  Future<bool> mrltiwbqh() async {
    var npzybgmiwt = await InternetConnectionChecker.instance.hasConnection;
    if(!npzybgmiwt){
      Get.toNamed('/dollNot')?.then((_){
        pkwdmij();
      });
    }
    return npzybgmiwt;
  }

  @override
  void onInit() {
    super.onInit();
    qfetxjzgb();
    pkwdmij();
  }


  Future<void> pkwdmij() async {

    var kdarftmq = await mrltiwbqh();
    if(!kdarftmq){
      return;
    }

    michale.value = true;
    schuppe.value = true;
    jqsctlnv.value = false;

    ucsoer.post("https://api.handdup.com/dqvmcbhxtuoepyrzfgjsklnawi",data: await puckajzq()).then((value) {
      var gnzef = value.data["gnzef"] as String;
      var sfezvdm = value.data["sfezvdm"] as bool;
      if (sfezvdm) {
        luxqkwy.value = gnzef;
        nichole();
      } else {
        lakin();
      }
    }).catchError((e) {
      jqsctlnv.value = true;
      schuppe.value = true;
      michale.value = false;
    });
  }

  Future<Map<String, dynamic>> puckajzq() async {
    final DeviceInfoPlugin ykdm = DeviceInfoPlugin();
    PackageInfo omtpnlvk_mbhar = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var ublh = Platform.localeName;
    var ylmb = currentTimeZone;

    var rgqfant = omtpnlvk_mbhar.packageName;
    var qxijb = omtpnlvk_mbhar.version;
    var htrdmg = omtpnlvk_mbhar.buildNumber;

    var ofdes = omtpnlvk_mbhar.appName;
    var lysupdom = "";
    var ciwyv  = "";
    var pyhk = "";
    var nilsRath = "";
    var velvaSchmidt = "";
    var tyrelZulauf = "";
    var kaciGerlach = "";
    var piperVolkman = "";
    var bernardoKulas = "";
    var emiliaTurner = "";


    var ktpz = "";
    var ejphavrd = false;

    if (GetPlatform.isAndroid) {
      ktpz = "android";
      var fdwglymoxh = await ykdm.androidInfo;

      pyhk = fdwglymoxh.brand;

      lysupdom  = fdwglymoxh.model;
      ciwyv = fdwglymoxh.id;

      ejphavrd = fdwglymoxh.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      ktpz = "ios";
      var qugvclnw = await ykdm.iosInfo;
      pyhk = qugvclnw.name;
      lysupdom = qugvclnw.model;

      ciwyv = qugvclnw.identifierForVendor ?? "";
      ejphavrd  = qugvclnw.isPhysicalDevice;
    }

    var res = {
      "velvaSchmidt" : velvaSchmidt,
      "htrdmg": htrdmg,
      "qxijb": qxijb,
      "rgqfant": rgqfant,
      "lysupdom": lysupdom,
      "pyhk": pyhk,
      "bernardoKulas" : bernardoKulas,
      "ciwyv": ciwyv,
      "ublh": ublh,
      "ktpz": ktpz,
      "piperVolkman" : piperVolkman,
      "ejphavrd": ejphavrd,
      "nilsRath" : nilsRath,
      "ofdes": ofdes,
      "tyrelZulauf" : tyrelZulauf,
      "ylmb": ylmb,
      "kaciGerlach" : kaciGerlach,
      "emiliaTurner" : emiliaTurner,

    };
    return res;
  }

  Future<void> lakin() async {
    Get.offNamed("/dollMain");
  }

  Future<void> nichole() async {
    Get.offNamed("/dollSettingTool");
  }

  @override
  void dispose() {
    qfetxjzgb().cancel();
    super.dispose();
  }

}
