import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/view/page/splash_screen.dart';
import 'controller/get_controller.dart';
import 'controller/size_config.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(GetController());

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return OrientationBuilder(
              builder: (BuildContext context2, Orientation orientation) {
                SizeConfig.init(constraints, orientation);
                return GetMaterialApp(
                  title: "GridApp",
                  useInheritedMediaQuery: true,
                  debugShowCheckedModeBanner: false,
                  defaultTransition:
                  GetPlatform.isIOS ? Transition.cupertino : Transition.rightToLeft,
                  home: const SplashScreen(),
                );
              });
        });
  }
}
