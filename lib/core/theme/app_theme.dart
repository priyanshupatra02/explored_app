import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///This class defines light theme and dark theme
///Here we used flex color scheme
class Themes {
  // Define text theme with custom fonts
  static TextTheme get _customTextTheme => TextTheme(
        // Headlines with Space Grotesk
        displayLarge: GoogleFonts.spaceGrotesk(),
        displayMedium: GoogleFonts.spaceGrotesk(),
        displaySmall: GoogleFonts.spaceGrotesk(),
        headlineLarge: GoogleFonts.spaceGrotesk(),
        headlineMedium: GoogleFonts.spaceGrotesk(),
        headlineSmall: GoogleFonts.spaceGrotesk(), 

        // Titles with Urbanist
        titleLarge: GoogleFonts.urbanist(),
        titleMedium: GoogleFonts.urbanist(),
        titleSmall: GoogleFonts.urbanist(),

        // You can customize other text styles if needed
        // For example, body text with Urbanist
        bodyLarge: GoogleFonts.urbanist(),
        bodyMedium: GoogleFonts.urbanist(),
        bodySmall: GoogleFonts.urbanist(),

        labelLarge: GoogleFonts.urbanist(),
        labelMedium: GoogleFonts.urbanist(),
        labelSmall: GoogleFonts.urbanist(),
      );
  static ThemeData get lightTheme => FlexThemeData.light(
        colors: const FlexSchemeColor(
          primary: AppColors.kPrimaryColor,
          primaryContainer: Color(0xFFA0C2ED),
          primaryLightRef: AppColors.kPrimaryColor,
          secondary: AppColors.kSecondaryColor,
          secondaryContainer: Color(0xFFFFD270),
          secondaryLightRef: AppColors.kSecondaryColor,
          tertiary: AppColors.kPrimaryColor,
          tertiaryContainer: Color(0xFFC8DBF8),
          tertiaryLightRef: AppColors.kPrimaryColor,
          appBarColor: Color(0xFFC8DCF8),
          error: AppColors.kErrorColor,
          errorContainer: AppColors.kErrorColor,
        ),
        colorScheme: const ColorScheme.light(
          surface: AppColors.kSecondaryWhiteColor, //for scaffold bg
          // primary:
          //     AppColors.kPrimaryColor, //buttons (floating action button), text-field border color
          // onPrimary: AppColors.kOnPrimaryColor, //text on floating action button
          // secondary: AppColors.kSecondaryColor, //buttons (elevated buttons)
          // onSecondary: AppColors.kOnSecondaryColor, //text & icon on segmented buttons
          // surface: AppColors.kSurfaceColor, //appbar, textfield bg
          // onSurface: AppColors.kOnSurfaceColor, //text on scaffold's body
          // outline: AppColors.kOutlineColor, //segmented button border, elevated button border
        ),

        // Apply custom text theme
        textTheme: _customTextTheme,
        surfaceTint: Colors.transparent,
        subThemesData: const FlexSubThemesData(
          appBarBackgroundSchemeColor: SchemeColor.transparent,
          appBarForegroundSchemeColor: SchemeColor.transparent,

          interactionEffects: true,
          tintedDisabledControls: true,
          useM2StyleDividerInM3: true,
          inputDecoratorIsFilled: true,
          inputDecoratorBorderType: FlexInputBorderType.outline,
          alignedDropdown: true,
          navigationRailUseIndicator: true,
          navigationRailLabelType: NavigationRailLabelType.all,
          inputCursorSchemeColor: SchemeColor.onSurface,
          inputSelectionSchemeColor: SchemeColor.onSurface,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
      );
  // static ThemeData get darkTheme => FlexThemeData.dark(
  //       colors: const FlexSchemeColor(
  //         primary: Color(0xFFB1CFF5),
  //         primaryContainer: Color(0xFF3873BA),
  //         primaryLightRef: AppColors.kPrimaryColor,
  //         secondary: Color(0xFFFFD270),
  //         secondaryContainer: AppColors.kSecondaryColor,
  //         secondaryLightRef: AppColors.kSecondaryColor,
  //         tertiary: Color(0xFFC9CBFC),
  //         tertiaryContainer: Color(0xFF535393),
  //         tertiaryLightRef: AppColors.kPrimaryColor,
  //         appBarColor: Color(0xFF00102B),
  //         error: AppColors.kErrorColor,
  //         errorContainer: AppColors.kErrorColor,
  //       ),
  //       // Apply custom text theme
  //       textTheme: _customTextTheme,
  //       subThemesData: const FlexSubThemesData(
  //         interactionEffects: true,
  //         tintedDisabledControls: true,
  //         blendOnColors: true,
  //         useM2StyleDividerInM3: true,
  //         inputDecoratorIsFilled: true,
  //         inputDecoratorBorderType: FlexInputBorderType.outline,
  //         alignedDropdown: true,
  //         navigationRailUseIndicator: true,
  //         navigationRailLabelType: NavigationRailLabelType.all,
  //       ),
  //       visualDensity: FlexColorScheme.comfortablePlatformDensity,
  //       cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  //     );
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,
}
