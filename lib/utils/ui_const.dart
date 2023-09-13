import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_profile/utils/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UiConstant {
  static BoxDecoration frostedGlassDecoration() => BoxDecoration(
      gradient: const LinearGradient(
          colors: [Colors.white54, Colors.white12],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter),
      boxShadow: const [
        BoxShadow(
            blurRadius: 6,
            spreadRadius: 0,
            color: Colors.black54,
            offset: Offset(0.0, 0.0))
      ],
      borderRadius: BorderRadius.circular(20),
      border: Border.all(width: 2, color: Colors.white30));

  static Text normalText(String? text, int? size) => Text(
        "$text",
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
        style: GoogleFonts.montserrat(
            color: ColorsConstants.textColor,
            fontSize: size!.sp,
            fontWeight: FontWeight.w600),
      );

  static Text descriptionText(String? text, int? size) => Text(
        "$text",
        textAlign: TextAlign.start,
        style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: size?.sp ?? 12.sp,
            // textStyle: TextStyle(),
            fontWeight: FontWeight.w400),
      );

  static Text descriptionTabText(String? text, int? size) => Text(
        "$text",
        textAlign: TextAlign.center,
        style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: size?.sp ?? 12.sp,
            // textStyle: TextStyle(),
            fontWeight: FontWeight.w400),
      );

  //todo: custom show toast message
  static customToastShow(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }

}
