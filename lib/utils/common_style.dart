import 'package:flutter/material.dart';
import 'constant.dart';

class CommonStyle {
  static BoxDecoration primaryBoxDecorationLight() {
    return BoxDecoration(
      color: Constant.white,
      boxShadow: primaryShadowLight(),
      borderRadius: BorderRadius.circular(12),
    );
  }

  static BoxDecoration primaryBoxDecorationWithLowBlur() {
    return BoxDecoration(
      color: Constant.white,
      boxShadow: primaryShadowLight(),
      borderRadius: BorderRadius.circular(12),
    );
  }

  static List<BoxShadow> primaryShadowLight() {
    return [
      BoxShadow(
        color: Colors.black.withOpacity(0.10),
        offset: const Offset(0, 12),
        blurRadius: 24,
        spreadRadius: 0,
      ),
    ];
  }

  static List<BoxShadow> primaryShadowLightWithLowBlurRadius() {
    return [
      BoxShadow(
        color: Colors.black.withOpacity(0.10),
        offset: const Offset(0, 8),
        blurRadius: 16,
        spreadRadius: 0,
      ),
    ];
  }

  static List<BoxShadow> primaryShadowLightWithMinimumBlurRadius() {
    return [
      BoxShadow(
        color: Colors.black.withOpacity(0.10),
        offset: const Offset(0, 4),
        blurRadius: 8,
        spreadRadius: 0,
      ),
    ];
  }

  static LinearGradient getDefaultBottomGradientLight() {
    return LinearGradient(
      begin: Alignment.bottomRight,
      // end: Alignment.centerRight,
      colors: [
        Colors.white,
        Colors.white.withOpacity(0),
      ],
    );
  }

  static LinearGradient getMapScreenBottomGradientLight() {
    return LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [
        Colors.white,
        Colors.white.withOpacity(0),
      ],
    );
  }

  static LinearGradient getProductDetailsScreenImageGradient() {
    return LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.center,
      colors: [
        Colors.black.withOpacity(0.7),
        Colors.white.withOpacity(0),
      ],
    );
  }

  static LinearGradient getDefaultHorizontalGradientLight() {
    return LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.center,
      colors: [
        Colors.white,
        Colors.white.withOpacity(0),
      ],
    );
  }

  static primaryTextFieldDecoration({String hintText, Widget prefix}) {
    return InputDecoration(
      prefixIcon: prefix ?? null,
      counterText: '',
      contentPadding:
      const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12),
      hintText: hintText,
      hintStyle: TextStyle(color: Constant.grey400),
      fillColor: Constant.white,
      filled: true,
      focusedBorder: primaryOutlineInputBorderLight(),
      enabledBorder: primaryOutlineInputBorderLight(),
      border: primaryOutlineInputBorderLight(),
      errorBorder: primaryOutlineInputBorderLight(),
      disabledBorder: primaryOutlineInputBorderLight(),
    );
  }

  static primaryOutlineInputBorderLight() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(color: Colors.transparent),
    );
  }

  static formTextFieldInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: Constant.grey400),
    );
  }
}