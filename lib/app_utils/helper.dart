import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'color_constants.dart';

class Helper {
  static hideKeyboard() => FocusManager.instance.primaryFocus?.unfocus();

  static showToast(String msg) => Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: ColorConstants.darkGray,
      textColor: ColorConstants.whiteColor,
      fontSize: 16.0
  );

  static Widget showLoader() => SpinKitFadingCircle(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? Colors.red : Colors.green,
        ),
      );
      },
  );

  static Widget showError(String errorMessage) => Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.info_outline, size: 32, color: ColorConstants().redColor),
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(
          errorMessage,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: ColorConstants().redColor,
          ),
        ),
      ),
    ],
  );
}