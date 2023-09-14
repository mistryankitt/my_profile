import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_profile/utils/colors.dart';

class CTextFieldWidget extends StatefulWidget {
  final String? helperText;
  final String hintText;
  final TextInputType? keyboardTypeValidation;
  final ValueChanged<String>? onChangedText;
  final int? maxLengthChar;
  final Widget? endIcon;
  final Widget? startIcon;
  final TextCapitalization? textCapitalization;
  final String? isErrorValid;
  final int? maxLines;
  final bool? enableBorder;
  final Iterable<String>? autofillHints;
  final bool textSecure;
  final String? prefixIconString;
  final String? suffixIconString;
  final TextEditingController? myControllers;
  final FormFieldValidator<String>? validator;
  final bool? isSuffixIcon;
  final VoidCallback? onEditingComplete;
  final dynamic initialValue;
  final bool readOnly;
  final VoidCallback? onPressedSuffixIcon;

  final void Function(String?)? onSaved;

  const CTextFieldWidget({
    Key? key,
    this.helperText,
    required this.hintText,
    this.isErrorValid,
    this.readOnly = false,
    this.keyboardTypeValidation,
    this.maxLengthChar,
    this.myControllers,
    this.onChangedText,
    this.endIcon,
    this.startIcon,
    this.enableBorder,
    this.textCapitalization,
    this.maxLines,
    this.validator,
    this.prefixIconString,
    this.initialValue,
    this.textSecure = false,
    this.autofillHints,
    this.onEditingComplete,
    this.isSuffixIcon = false,
    this.suffixIconString,
    this.onPressedSuffixIcon, this.onSaved,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CTextFieldWidgetState createState() => _CTextFieldWidgetState();
}

class _CTextFieldWidgetState extends State<CTextFieldWidget> {
  final bool autoCorrect = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue?.toString(),
      validator: widget.validator,
      controller: widget.myControllers,
      autofillHints: widget.autofillHints?.toList(),
      autocorrect: false,
      onSaved: widget.onSaved,
      keyboardType: widget.keyboardTypeValidation,
      readOnly: widget.readOnly,
      decoration: InputDecoration(
          fillColor: widget.readOnly == true
              ? CupertinoColors.white
              : Colors.white,

          filled: widget.readOnly == true ? true : false,
          hintText: widget.hintText,
          errorText: widget.isErrorValid,
          helperText: widget.helperText,
          contentPadding: const EdgeInsets.all(16),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
              BorderSide(color: ColorsConstants.inputGrayText, width: 1)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
              BorderSide(color: ColorsConstants.inputGrayText, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
              BorderSide(color: ColorsConstants.inputGrayText, width: 1)),
          suffixIcon: widget.isSuffixIcon ?? false
              ? IconButton(
            constraints: BoxConstraints.tight(Size.zero),
            icon: Image.asset(
              widget.suffixIconString!,
              width: 20,
              //color: cyan,
            ),
            onPressed: widget.onPressedSuffixIcon,
          )
              : null,


          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide:
              BorderSide(color: ColorsConstants.inputGrayText, width: 1)),
          hintStyle:
          const TextStyle(color: Colors.white38, fontFamily: "sfpro")),
      textInputAction: TextInputAction.done,
      textAlign: TextAlign.start,
      textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
      maxLength: widget.maxLengthChar,
      obscureText: widget.textSecure,
      onChanged: widget.onChangedText,
      style: TextStyle(color: ColorsConstants.inputGrayText),

      // maxLines: widget.maxLines,
      onEditingComplete: widget.onEditingComplete,
    );
  }
}
