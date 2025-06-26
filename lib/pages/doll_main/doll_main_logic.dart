import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DollMainLogic extends GetxController {

  var type = 1.obs;
  var bg = 0.obs;
  var opacity = 1.0.obs;

  var selected = (-1).obs;

  void getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    type.value = prefs.getInt('type') ?? 1;
    bg.value = prefs.getInt('bg') ?? 0;
    opacity.value = prefs.getDouble('opacity') ?? 1.0;
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
