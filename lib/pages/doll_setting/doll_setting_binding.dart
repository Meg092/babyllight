import 'package:get/get.dart';

import 'doll_setting_logic.dart';

class DollSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DollSettingLogic());
  }
}
