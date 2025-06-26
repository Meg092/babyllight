import 'package:get/get.dart';

import 'doll_computed_logic.dart';

class DollComputedBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      DollComputedLogic(),
      permanent: true,
    );
  }
}
