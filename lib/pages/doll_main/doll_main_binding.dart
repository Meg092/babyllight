import 'package:get/get.dart';

import 'doll_main_logic.dart';

class DollMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DollMainLogic());
  }
}
