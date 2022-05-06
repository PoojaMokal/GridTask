import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controller/size_config.dart';
import 'package:task/view/page/user_input.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigateToNextScreen();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Center(
         child: Text("Mobigic",style: TextStyle(
           color: Colors.blue,
           fontSize: 5.h,
           fontWeight: FontWeight.w600,
         ),),
        ),
      ),
    );
  }


      void _navigateToNextScreen() {
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.offAll(() => const UserInput());
      });
    }

}
