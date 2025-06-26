import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'doll_setting_logic.dart';

class DollSettingPage extends GetView<DollSettingLogic> {

  Widget _item(int index, BuildContext context) {
    final titles = [
      'Restore default',
      'Version info'
    ];
    return Container(
      color: Colors.transparent,
      height: 40,
      child: <Widget>[
        Text(titles[index]),
        index == 1 ? const Text("1.0.0",style: TextStyle(color: Colors.grey),).paddingOnly(right: 10) : const Icon(
          Icons.keyboard_arrow_right,
          size: 20,
          color: Colors.grey,
        )
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
    ).gestures(onTap: () {
      switch (index) {
        case 0:
          controller.restoreDefault();
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Setting"),
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: <Widget>[
                Container(
                  padding: const EdgeInsets.all(12),
                  child: <Widget>[
                    _item(0, context),
                    _item(1, context)
                  ].toColumn(
                      separator: Divider(
                        height: 15,
                        color: Colors.grey.withOpacity(0.3),
                      )),
                ).decorated(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12))
              ].toColumn(),
            ).marginAll(15)),
      ),
    );
  }
}
