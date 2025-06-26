import 'package:colorful_doll/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:styled_widget/styled_widget.dart';

import 'doll_main_logic.dart';

class DollMainPage extends StatefulWidget {
  const DollMainPage({Key? key}) : super(key: key);

  @override
  State<DollMainPage> createState() => _DollMainPageState();
}

class _DollMainPageState extends State<DollMainPage> {
  DollMainLogic controller = Get.find();

  void iakhjkjsd() async {
    final hadNetwork = await InternetConnectionChecker.instance.hasConnection;
    if (!hadNetwork) {
      Get.toNamed('/dollNot');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    iakhjkjsd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor:
            bgColors[controller.bg.value].withOpacity(controller.opacity.value),
        extendBodyBehindAppBar: true,
        appBar: AppBar(title: null, actions: [
          const Icon(
            Icons.settings,
            size: 38,
            color: Colors.black,
          ).marginOnly(right: 20).gestures(onTap: () {
            Get.toNamed('/dollSetting')?.then((_) {
              controller.getData();
            });
          })
        ]),
        body: <Widget>[
          const SizedBox(
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
              child: <Widget>[
            const SizedBox(
              height: 30,
            ),
            <Widget>[
              Image.asset('assets/bg.webp',
                  width: 436, height: 436, fit: BoxFit.cover),
              Image.asset(
                'assets/baby${controller.type.value}.webp',
                width: 151,
                height: 151,
                fit: BoxFit.cover,
              )
            ].toStack(alignment: Alignment.center),
            SizedBox(
              height: 100,
              child: Obx(() {
                return Visibility(
                  visible: controller.selected.value == 1,
                  child: SizedBox(
                    width: 200,
                    child: SliderTheme(
                      data: const SliderThemeData(
                        trackHeight: 10,
                      ),
                      child: Slider(
                          value: controller.opacity.value,
                          min: 0,
                          max: 1,
                          onChanged: (v) async {
                            controller.opacity.value = v;
                            final SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setDouble('opacity', v);
                          }),
                    ),
                  ),
                );
              }),
            ),
            <Widget>[
              Obx(() {
                return Image.asset(
                    'assets/icon${controller.selected.value == 0 ? 'Se' : 'Un'}0.webp');
              }).gestures(onTap: () {
                if (controller.selected.value == 0) {
                  controller.selected.value = -1;
                } else {
                  controller.selected.value = 0;
                }
              }),
              Obx(() {
                return Image.asset(
                    'assets/icon${controller.selected.value == 1 ? 'Se' : 'Un'}1.webp');
              }).marginSymmetric(horizontal: 30).gestures(onTap: () {
                if (controller.selected.value == 1) {
                  controller.selected.value = -1;
                } else {
                  controller.selected.value = 1;
                }
              }),
              Obx(() {
                return Image.asset(
                    'assets/icon${controller.selected.value == 2 ? 'Se' : 'Un'}2.webp');
              }).gestures(onTap: () {
                if (controller.selected.value == 2) {
                  controller.selected.value = -1;
                } else {
                  controller.selected.value = 2;
                }
              }),
            ].toRow(mainAxisAlignment: MainAxisAlignment.center)
          ].toColumn()),
          Obx(() {
            return Visibility(
                visible: controller.selected.value == 2,
                child: Positioned(
                    right: 50,
                    bottom: 150,
                    child: SafeArea(
                      child: Container(
                        width: 90,
                        height: 357,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 16),
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1, mainAxisSpacing: 5),
                            itemCount: bgColors.length,
                            itemBuilder: (_, index) {
                              return LayoutBuilder(builder: (_, max) {
                                return Container()
                                    .decorated(
                                        color: bgColors[index],
                                        borderRadius: BorderRadius.circular(
                                            max.maxWidth / 2))
                                    .gestures(onTap: () async {
                                  final SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.setInt('bg', index);
                                  controller.bg.value = index;
                                  controller.selected.value = -1;
                                });
                              });
                            }),
                      ).decorated(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                    )));
          }),
          Obx(() {
            return Visibility(
                visible: controller.selected.value == 0,
                child: Obx(() {
                  return Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration:
                          BoxDecoration(color: bgColors[controller.bg.value]),
                      child: SafeArea(
                        child: <Widget>[
                          Container(
                            width: 150,
                            height: 150,
                            child: <Widget>[
                              Image.asset(
                                'assets/baby0.webp',
                                fit: BoxFit.cover,
                              )
                            ].toColumn(
                                mainAxisAlignment: MainAxisAlignment.center),
                          )
                              .decorated(
                                  color: controller.type.value == 0
                                      ? Colors.white.withOpacity(0.44)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(75),
                                  border: controller.type.value == 0
                                      ? Border.all(
                                          color: Colors.white, width: 2)
                                      : null)
                              .gestures(onTap: () async {
                            final SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setInt('type', 0);
                            controller.type.value = 0;
                            controller.selected.value = -1;
                          }),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: 150,
                            height: 150,
                            child: <Widget>[
                              Image.asset(
                                'assets/baby1.webp',
                                fit: BoxFit.cover,
                              )
                            ].toColumn(
                                mainAxisAlignment: MainAxisAlignment.center),
                          )
                              .decorated(
                                  color: controller.type.value == 1
                                      ? Colors.white.withOpacity(0.44)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(75),
                                  border: controller.type.value == 1
                                      ? Border.all(
                                          color: Colors.white, width: 2)
                                      : null)
                              .gestures(onTap: () async {
                            final SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setInt('type', 1);
                            controller.type.value = 1;
                            controller.selected.value = -1;
                          }),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: 150,
                            height: 150,
                            child: <Widget>[
                              Image.asset(
                                'assets/baby2.webp',
                                fit: BoxFit.cover,
                              )
                            ].toColumn(
                                mainAxisAlignment: MainAxisAlignment.center),
                          )
                              .decorated(
                                  color: controller.type.value == 2
                                      ? Colors.white.withOpacity(0.44)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(75),
                                  border: controller.type.value == 2
                                      ? Border.all(
                                          color: Colors.white, width: 2)
                                      : null)
                              .gestures(onTap: () async {
                            final SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setInt('type', 2);
                            controller.type.value = 2;
                            controller.selected.value = -1;
                          }),
                          const SizedBox(
                            height: 80,
                          ),
                          Container(
                            width: 70,
                            height: 70,
                            child: <Widget>[
                              const Icon(
                                Icons.close,
                                size: 30,
                                color: Colors.black,
                              )
                            ].toColumn(
                                mainAxisAlignment: MainAxisAlignment.center),
                          )
                              .decorated(
                                  color: Colors.white.withOpacity(0.44),
                                  borderRadius: BorderRadius.circular(35),
                                  border:
                                      Border.all(color: Colors.white, width: 2))
                              .gestures(onTap: () {
                            controller.selected.value = -1;
                          })
                        ].toColumn(mainAxisAlignment: MainAxisAlignment.end),
                      ));
                }));
          })
        ].toStack(),
      );
    });
  }
}
