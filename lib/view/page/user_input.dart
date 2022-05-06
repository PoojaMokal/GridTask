import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:task/controller/get_controller.dart';
import 'package:task/controller/size_config.dart';
import 'package:task/view/page/grid_screen.dart';
import '../../utils/common_snackbar.dart';
import '../../utils/constant.dart';
import '../../utils/hide_keyboard.dart';
import '../common_widget/common_button.dart';
import '../common_widget/textfomfield.dart';

class UserInput extends StatefulWidget {
  const UserInput({Key key}) : super(key: key);

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  final GetController inputDetailsController = Get.find<GetController>();

  final _formKey = GlobalKey<FormState>();

  DateTime _currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: GestureDetector(
        onTap: () {
          HideKeyBoard.onScreenTap();
        },
        child: Scaffold(
          backgroundColor: Constant.white,
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.all(4.w),
                child: Obx(
                  () => Container(
                    margin: EdgeInsets.only(top: 15.h),
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            "Mobigic Task",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 4.h,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CommonTextFormField(
                          maxLength: 3,
                          initialValue: inputDetailsController
                                  .numberOfColumns.value.isNotEmpty
                              ? inputDetailsController.numberOfColumns.value
                              : null,
                          label: 'Enter number of Columns*',
                          hintText: 'Enter number of columns',
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            inputDetailsController.numberOfColumns.value =
                                value.trim();
                          },
                          validator: (String value) {
                            if (value.trim().isEmpty) {
                              return 'Enter valid number';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 3.h),
                        CommonTextFormField(
                          maxLength: 3,
                          initialValue:
                              inputDetailsController.numberOfRows.value.isNotEmpty
                                  ? inputDetailsController.numberOfRows.value
                                  : null,
                          label: 'Enter number of Rows*',
                          hintText: 'Enter number of rows',
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            inputDetailsController.numberOfRows.value =
                                value.trim();
                          },
                          validator: (String value) {
                            if (value.trim().isEmpty) {
                              return 'Enter valid number';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 3.h),
                        CommonTextFormField(
                          showCounter: true,
                          initialValue: inputDetailsController.letters.value
                                  .trim()
                                  .isNotEmpty
                              ? inputDetailsController.letters.value
                              : null,
                          label: 'Enter the Alphabets*',
                          hintText:
                              'Enter ${int.parse(inputDetailsController.numberOfColumns.value.isEmpty ? '1' : inputDetailsController.numberOfColumns.value) * int.parse(inputDetailsController.numberOfRows.value.isEmpty ? '1' : inputDetailsController.numberOfRows.value)} letters',
                          maxLines: 4,
                          maxLength: int.parse(inputDetailsController
                                      .numberOfColumns.value.isEmpty
                                  ? '1'
                                  : inputDetailsController
                                      .numberOfColumns.value) *
                              int.parse(inputDetailsController
                                      .numberOfRows.value.isEmpty
                                  ? '1'
                                  : inputDetailsController.numberOfRows.value),
                          textInputAction: TextInputAction.newline,
                          onChanged: (String value) {
                            inputDetailsController.letters.value = value.trim();
                          },
                          inputFormatter: [
                            FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))
                          ],
                          validator: (String value) {
                            if (value.trim().isEmpty) {
                              return 'Enter ${int.parse(inputDetailsController.numberOfColumns.value.isEmpty ? '1' : inputDetailsController.numberOfColumns.value) * int.parse(inputDetailsController.numberOfRows.value.isEmpty ? '1' : inputDetailsController.numberOfRows.value)} letters';
                            } else if (value.trim().length <
                                int.parse(inputDetailsController
                                            .numberOfColumns.value.isEmpty
                                        ? '1'
                                        : inputDetailsController
                                            .numberOfColumns.value) *
                                    int.parse(inputDetailsController
                                            .numberOfRows.value.isEmpty
                                        ? '1'
                                        : inputDetailsController
                                            .numberOfRows.value)) {
                              return 'Enter ${int.parse(inputDetailsController.numberOfColumns.value.isEmpty ? '1' : inputDetailsController.numberOfColumns.value) * int.parse(inputDetailsController.numberOfRows.value.isEmpty ? '1' : inputDetailsController.numberOfRows.value)} letters';
                            } else if (value.trim().length >
                                int.parse(inputDetailsController
                                            .numberOfColumns.value.isEmpty
                                        ? '1'
                                        : inputDetailsController
                                            .numberOfColumns.value) *
                                    int.parse(inputDetailsController
                                            .numberOfRows.value.isEmpty
                                        ? '1'
                                        : inputDetailsController
                                            .numberOfRows.value)) {
                              return 'Enter only ${int.parse(inputDetailsController.numberOfColumns.value.isEmpty ? '1' : inputDetailsController.numberOfColumns.value) * int.parse(inputDetailsController.numberOfRows.value.isEmpty ? '1' : inputDetailsController.numberOfRows.value)} letters';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 8.h),
                        _continueButton()
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _continueButton() {
    return InkWell(
      onTap: (){
        _validateDetails();
      },
      child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Container(
            height: 6.h,
            width: 20.h,
            decoration: BoxDecoration(
              color: Constant.primaryColor,
              borderRadius: BorderRadius.circular(3.h),
            ),
            child: Center(
              child: Text(
                "Next",
                style: TextStyle(
                  color: Constant.white,
                  fontSize: 2.h,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )),
    );
  }

  void _validateDetails() {
    FocusManager.instance.primaryFocus.unfocus();

    if (!_formKey.currentState.validate()) {
      return;
    }

    _navigateToGridViewScreen();
  }

  void _navigateToGridViewScreen() {
    Get.to(() => const GridScreen());
  }

  Future<bool> _onWillPop() {
    DateTime now = DateTime.now();
    if (_currentBackPressTime == null ||
        now.difference(_currentBackPressTime) > const Duration(seconds: 2)) {
      _currentBackPressTime = now;

      SnackBarUtil.showSnackBar('Press back again to exit');

      return Future.value(false);
    }
    return Future.value(true);
  }
}
