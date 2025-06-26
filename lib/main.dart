import 'package:colorful_doll/pages/doll_main/doll_main_binding.dart';
import 'package:colorful_doll/pages/doll_main/doll_main_view.dart';
import 'package:colorful_doll/pages/doll_not/doll_not_binding.dart';
import 'package:colorful_doll/pages/doll_not/doll_not_view.dart';
import 'package:colorful_doll/pages/doll_setting/doll_setting_binding.dart';
import 'package:colorful_doll/pages/doll_setting/doll_setting_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Color primaryColor = Colors.black;
Color bgColor = const Color(0xfffafafa);

List<Color> bgColors = const [
  Color(0xfffbedbe),
  Color(0xfffecfbb),
  Color(0xffffb88e),
  Color(0xffc8d5f7),
  Color(0xffe1f8e8),
  Color(0xffb6e3e9),
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final type = prefs.getInt('type');
  if (type == null) {
    prefs.setInt('type', 1);
    prefs.setInt('bg', 0);
    prefs.setDouble('opacity', 1);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Colorful,
      initialRoute: '/dollMain',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> Colorful = [
  GetPage(name: '/dollMain', page: () => const DollMainPage(), binding: DollMainBinding()),
  GetPage(name: '/dollNot', page: () => const DollNotView(), binding: DollNotBinding()),
  GetPage(name: '/dollSetting', page: () => DollSettingPage(), binding: DollSettingBinding()),
];