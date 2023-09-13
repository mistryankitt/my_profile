import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_profile/utils/ui_const.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final bool isColorChange;
  final bool isBorder;
  final bool isBorderColor;
  final Widget? iconWidget;
  final bool isIcon;
  final String? iconString;
  final bool isTextColorChange;

  const CustomButtonWidget(
      {Key? key,
      required this.text,
      required this.onTap,
      this.color,
      this.isColorChange = false,
      this.isBorder = false,
      this.isIcon = false,
      this.isBorderColor = false,
      this.iconString,
      this.borderColor,
      this.isTextColorChange = false,
      this.textColor,
      this.iconWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    HapticFeedback.selectionClick();
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: isBorder
            ? BorderSide(
                color: isBorderColor ? borderColor! : Colors.white54, width: 1)
            : const BorderSide(color: Colors.white54, width: 0),
      ),
      color: isColorChange ? color : Colors.black87,
      //borderRadius: BorderRadius.circular(30),
      child: InkWell(
        onTap: onTap,
        customBorder: isBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.black87, width: 5.0))
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide:
                    const BorderSide(color: Colors.black87, width: 0.0)),
        child: SizedBox(
            height: MediaQuery.sizeOf(context).height *0.08,
            width: MediaQuery.of(context).size.width,
            child: isIcon
                ? Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        UiConstant.normalText(
                          text,
                          14,
                        ),
                        3.widthBox,
                        iconWidget!,
                      ],
                    ),
                  )
                : UiConstant.normalText(
                    text,
                    14,
                  ).centered()),
      ),
    );
  }
}
