import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:intern_assesment/helpers/dependencies.dart' as dep;
import 'package:intern_assesment/routes/route_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.purpleAccent,
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xff0141ac),
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: Color(0xff0141ac),
          )),
      initialRoute: RouterHelper.getSplash(),
      getPages: RouterHelper.routes,
    );
  }
}
