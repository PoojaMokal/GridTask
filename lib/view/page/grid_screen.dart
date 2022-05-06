import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:task/controller/get_controller.dart';
import 'package:task/controller/size_config.dart';
import '../../utils/constant.dart';
import '../../utils/hide_keyboard.dart';
import '../../utils/common_style.dart';
import '../common_widget/common_button.dart';
import '../common_widget/textfomfield.dart';

class GridScreen extends StatefulWidget {
  const GridScreen({Key key}) : super(key: key);

  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  final GetController inputDetailsController =
  Get.find<GetController>();

  List<String> _charList = [];
  List<String> _inputString = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HideKeyBoard.onScreenTap();
      },
      child: Scaffold(
        backgroundColor: Constant.white,
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: 4.h,left: 2.w,right: 2.w),
            child: Container(
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
                  Padding(
                    padding: EdgeInsets.all(4.w),
                    child: CommonTextFormField(
                      label: '',
                      hintText: 'Search',
                      textInputAction: TextInputAction.next,
                      onChanged: (String value) {
                        _updateInputCharList(value.toUpperCase());
                        setState(() {});
                      },
                      inputFormatter: [
                        FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))
                      ],
                    ),
                  ),
                  Obx(
                        () => Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                          int.parse(inputDetailsController.numberOfColumns.value),
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                        ),
                        itemCount: _charList.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.all(4.w),
                        itemBuilder: (BuildContext context, int index) {
                          String char = _charList[index];
                          return _gridItem(char);
                        },
                      ),
                    ),
                  ),
                  _restartbutton(),
                ],
              ),
            ),
          )
        ),
      ),
    );
  }

  void _updateInputCharList(String value) {
    final result = value.split('');
    // debugPrint(result.toString());
    _inputString = result;
    setState(() {});
  }

  Widget _gridItem(String char) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: _inputString.contains(char.toUpperCase())
            ? Constant.primaryColor.withOpacity(0.6)
            : Constant.primaryColor.withOpacity(0.1),
        boxShadow: CommonStyle.primaryShadowLight(),
      ),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Text(
          char.toUpperCase(),
          style: TextStyle(
            fontSize: 1.t,
            color: _inputString.contains(char.toUpperCase())
                ? Constant.textWhite
                : Constant.textColor,
          ),
        ),
      ),
    );
  }

  void _getCharacters() {
    List<String> result = inputDetailsController.letters.value.split('');
    // debugPrint('result: $result');
    _charList = result;
    setState(() {});
  }

  Widget _restartbutton() {
    return InkWell(
      onTap: (){
        Get.back();
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
                "Restart",
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
}