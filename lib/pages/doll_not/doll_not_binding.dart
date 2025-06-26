import 'package:get/get.dart';

import 'doll_not_logic.dart';

class DollNotBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DollNotLogic());
  }
}
