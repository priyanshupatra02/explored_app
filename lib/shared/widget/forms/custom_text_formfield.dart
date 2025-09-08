import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:velocity_x/velocity_x.dart';

enum TextCase { lowercase, uppercase, pascalCase }

class LowerCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return newValue.copyWith(text: newValue.text.toLowerCase());
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return newValue.copyWith(text: newValue.text.toUpperCase());
  }
}

class PascalCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final words = newValue.text.split(' ');
    final pascalCaseWords = words.map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    });
    return newValue.copyWith(text: pascalCaseWords.join(' '));
  }
}

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
    this.textCase,
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
  final TextCase? textCase;
  final List<TextInputFormatter>? textInputFormatters;
  final int? maxlen;
  TextCapitalization _getTextCapitalization() {
    if (textCase != null) {
      return switch (textCase!) {
        TextCase.lowercase => TextCapitalization.none,
        TextCase.uppercase => TextCapitalization.characters,
        TextCase.pascalCase => TextCapitalization.words,
      };
    }
    return isTextCapitalization ? TextCapitalization.words : TextCapitalization.sentences;
  }

  List<TextInputFormatter>? _getInputFormatters() {
    final formatters = <TextInputFormatter>[];
    
    if (textInputFormatters != null) {
      formatters.addAll(textInputFormatters!);
    }
    
    if (textCase != null) {
      switch (textCase!) {
        case TextCase.lowercase:
          formatters.add(LowerCaseTextFormatter());
          break;
        case TextCase.uppercase:
          formatters.add(UpperCaseTextFormatter());
          break;
        case TextCase.pascalCase:
          formatters.add(PascalCaseTextFormatter());
          break;
      }
    }
    
    return formatters.isEmpty ? null : formatters;
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      obscureText: isObscureText,
      scrollPhysics: scrollPhysics,
      controller: controller,
      name: name,
      initialValue: initialValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLength: maxlen,
      onChanged: onChanged,
      onTap: onTap,
      readOnly: isReadOnly,
      enableSuggestions: true,
      enableInteractiveSelection: true,
      textCapitalization: _getTextCapitalization(),
      inputFormatters: _getInputFormatters(),
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
