import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controller/size_config.dart';
import 'package:task/utils/common_style.dart';

import 'constant.dart';

class SnackBarUtil {
  static showSnackBar(String text, {Widget actionButton, Color color}) {
    Get.showSnackbar(GetSnackBar(
      duration: const Duration(milliseconds: 2000),
      borderRadius: 16.0,
      margin: EdgeInsets.all(4.w),
      boxShadows: CommonStyle.primaryShadowLight(),
      backgroundColor: color ?? Constant.primaryColor.withOpacity(0.5),
      animationDuration: const Duration(milliseconds: 500),
      mainButton: actionButton,
      messageText: Text(
        text,
        style: TextStyle(
          color: color != null ? Constant.textColor : Constant.textWhite,
        ),
      ),
    ));
  }
}