import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.prefixIcon,
    this.isReadOnly = false,
    this.validator,
    required this.hintText,
    this.keyboardType,
    this.onTap,
    this.focusNode,
    this.onChanged,
    required this.name,
    this.textInputAction,
    this.controller,
    this.initialValue,
    this.minLine,
    this.maxLine,
    this.fillColor = AppColors.kSecondaryWhiteColor,
    this.enableBorderColor = AppColors.kGrey300,
    this.focusedBorderColor = AppColors.kGrey600,
    this.fontColor = AppColors.kGrey200,
    this.fontSize = 16,
    this.letterSpacing = 0.3,
    this.isErrorText = false,
    this.isFillColor = false,
    this.isTextCapitalization = false,
    this.islabelText = true,
    this.scrollPhysics,
    this.textInputFormatters,
    this.maxlen,
    this.prefix,
    this.suffixIcon,
    this.isObscureText = false,
  });

  final Widget? prefixIcon;
  final bool isObscureText;
  final Widget? suffixIcon;
  final Widget? prefix;
  final bool isReadOnly;
  final bool? isErrorText;
  final String? Function(String?)? validator;
  final String? hintText;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final FocusNode? focusNode;
  final Function(String?)? onChanged;
  final String name;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final String? initialValue;
  final int? minLine;
  final int? maxLine;
  final Color? fillColor;
  final Color enableBorderColor;
  final Color focusedBorderColor;
  final Color? fontColor;
  final double fontSize;
  final double? letterSpacing;
  final bool? isFillColor;
  final bool? islabelText;
  final ScrollPhysics? scrollPhysics;
  final bool isTextCapitalization;
  final List<TextInputFormatter>? textInputFormatters;
  final int? maxlen;
  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      obscureText: isObscureText,
      scrollPhysics: scrollPhysics,
      controller: controller,
      name: name,
      initialValue: initialValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: textInputFormatters,
      maxLength: maxlen,
      onChanged: onChanged,
      onTap: onTap,
      readOnly: isReadOnly,
      enableSuggestions: true,
      enableInteractiveSelection: true,
      textCapitalization:
          isTextCapitalization ? TextCapitalization.words : TextCapitalization.sentences,
      minLines: minLine,
      maxLines: maxLine,
      focusNode: focusNode,
      keyboardType: keyboardType,
      validator: validator,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        prefixIcon: prefixIcon,
        prefix: prefix,
        suffixIcon: suffixIcon,
        hintText: hintText,
        // labelText: islabelText == true ? hintText : null,
        // labelStyle: islabelText == true
        //     ? TextStyle(
        //         fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
        //         letterSpacing: 0.5,
        //         fontWeight: FontWeight.w400,
        //       )
        //     : null,
        // alignLabelWithHint: true,
        filled: isFillColor,
        fillColor: fillColor,
        hintStyle: TextStyle(
          fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
          color: AppColors.kPrimaryColor.withOpacity(0.7),
          fontWeight: FontWeight.w400,
        ),
        errorStyle: isErrorText! ? const TextStyle(color: AppColors.kErrorColor) : null,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            // color: isFillColor == false ? enableBorderColor : Colors.transparent,
            color: enableBorderColor,
            width: 0.6,
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            // color: isFillColor == false ? focusedBorderColor : Colors.transparent,
            color: focusedBorderColor,
            width: 0.6,
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.kErrorColor, width: 1.0),
          borderRadius: BorderRadius.circular(14),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.kErrorColor, width: 1.0),
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    ).py8();
  }
}
