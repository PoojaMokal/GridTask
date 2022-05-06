import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task/controller/size_config.dart';

import '../../utils/constant.dart';
import '../../utils/common_style.dart';

class CommonTextFormField extends StatelessWidget {
  final String label;
  final String hintText;
  final int maxLines;
  final int maxLength;
  final TextInputAction textInputAction;
  final Function onChanged;
  final Function validator;
  final TextInputType keyboardType;
  final String initialValue;
  final List<TextInputFormatter> inputFormatter;
  final bool showCounter;

  const CommonTextFormField({
    Key key,
    @required this.label,
    @required this.hintText,
    this.maxLines,
    this.textInputAction,
    @required this.onChanged,
    this.validator,
    this.keyboardType,
    this.initialValue,
    this.maxLength,
    this.inputFormatter,
    this.showCounter = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 1.8.t,
          ),
        ),
        SizedBox(height: 0.5.h),
        TextFormField(
          initialValue: initialValue,
          cursorColor: Constant.black,
          maxLines: maxLines,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          maxLength: maxLength,
          inputFormatters: inputFormatter,
          scrollPadding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom +
                  (4 * kToolbarHeight)),
          decoration: InputDecoration(
            errorStyle: const TextStyle(height: 0.5, color: Colors.red),
            counterText: showCounter ? null : '',
            contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12),
            hintText: hintText,
            hintStyle: TextStyle(
              color: Constant.grey400,
              fontSize: 1.8.t,
            ),
            fillColor: Constant.white,
            filled: true,
            focusedBorder: CommonStyle.formTextFieldInputBorder(),
            enabledBorder: CommonStyle.formTextFieldInputBorder(),
            border: CommonStyle.formTextFieldInputBorder(),
            errorBorder: CommonStyle.formTextFieldInputBorder(),
            disabledBorder: CommonStyle.formTextFieldInputBorder(),
          ),
          onChanged: onChanged,
          validator: validator,
        ),
      ],
    );
  }
}