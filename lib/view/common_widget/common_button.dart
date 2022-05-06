import 'package:flutter/material.dart';
import 'package:task/controller/size_config.dart';
import 'package:task/utils/constant.dart';

import '../../utils/common_style.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final Function onPress;

  const PrimaryButton({Key key, this.title, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 50,
        // height: 6.5.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Constant.primaryColor,
          // gradient: StyleUtil.primaryButtonGradient(),
          borderRadius: BorderRadius.circular(50),
          boxShadow: CommonStyle.primaryShadowLight(),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Constant.textWhite,
              fontWeight: FontWeight.w500,
              fontSize: 2.2.t,
            ),
          ),
        ),
      ),
    );
  }
}