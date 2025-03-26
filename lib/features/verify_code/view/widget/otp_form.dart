import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class OtpForm extends StatefulWidget {
  final TextEditingController otpController;
  const OtpForm({
    super.key,
    required this.otpController,
  });

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final defaultPinTheme = PinTheme(
    width: 60,
    height: 60,
    textStyle: GoogleFonts.poppins(fontSize: 16, color: AppColors.kPrimaryColor),
    decoration: BoxDecoration(color: AppColors.kSecondaryColor),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 243,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Pinput(
        length: 4,
        controller: widget.otpController,

        separatorBuilder: (index) => Container(
          height: 60,
          width: 1,
          color: Colors.white,
        ),
        defaultPinTheme: defaultPinTheme,
        showCursor: true,
        focusedPinTheme: defaultPinTheme.copyWith(
          decoration: BoxDecoration(color: AppColors.kSecondaryColor.withOpacity(0.5)),
        ),
      ),
    );
  }
}
