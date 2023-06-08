// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences? _prefs;

enum DeviceSize {
  mobile,
  tablet,
  desktop,
}

abstract class FlutterFlowTheme {
  static DeviceSize deviceSize = DeviceSize.mobile;

  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static FlutterFlowTheme of(BuildContext context) {
    deviceSize = getDeviceSize(context);
    return Theme.of(context).brightness == Brightness.dark
        ? DarkModeTheme()
        : LightModeTheme();
  }

  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  late Color progressBar;
  late Color darkBackground;
  late Color textColor;
  late Color boxShadow;
  late Color grayLight;
  late Color primary30;
  late Color lineColor;
  late Color overlay;
  late Color teal;
  late Color midnightGreen;
  late Color poppy;
  late Color sunglow;
  late Color jet;
  late Color primaryBtnText;
  late Color primary20;
  late Color secondary20;
  late Color tertiary20;
  late Color alternate20;
  late Color overlay0;
  late Color overlay30;
  late Color alternateTwo;
  late Color alternateTwo20;

  @Deprecated('Use displaySmallFamily instead')
  String get title1Family => displaySmallFamily;
  @Deprecated('Use displaySmall instead')
  TextStyle get title1 => typography.displaySmall;
  @Deprecated('Use headlineMediumFamily instead')
  String get title2Family => typography.headlineMediumFamily;
  @Deprecated('Use headlineMedium instead')
  TextStyle get title2 => typography.headlineMedium;
  @Deprecated('Use headlineSmallFamily instead')
  String get title3Family => typography.headlineSmallFamily;
  @Deprecated('Use headlineSmall instead')
  TextStyle get title3 => typography.headlineSmall;
  @Deprecated('Use titleMediumFamily instead')
  String get subtitle1Family => typography.titleMediumFamily;
  @Deprecated('Use titleMedium instead')
  TextStyle get subtitle1 => typography.titleMedium;
  @Deprecated('Use titleSmallFamily instead')
  String get subtitle2Family => typography.titleSmallFamily;
  @Deprecated('Use titleSmall instead')
  TextStyle get subtitle2 => typography.titleSmall;
  @Deprecated('Use bodyMediumFamily instead')
  String get bodyText1Family => typography.bodyMediumFamily;
  @Deprecated('Use bodyMedium instead')
  TextStyle get bodyText1 => typography.bodyMedium;
  @Deprecated('Use bodySmallFamily instead')
  String get bodyText2Family => typography.bodySmallFamily;
  @Deprecated('Use bodySmall instead')
  TextStyle get bodyText2 => typography.bodySmall;

  String get displayLargeFamily => typography.displayLargeFamily;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => {
        DeviceSize.mobile: MobileTypography(this),
        DeviceSize.tablet: TabletTypography(this),
        DeviceSize.desktop: DesktopTypography(this),
      }[deviceSize]!;
}

DeviceSize getDeviceSize(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  if (width < 479) {
    return DeviceSize.mobile;
  } else if (width < 991) {
    return DeviceSize.tablet;
  } else {
    return DeviceSize.desktop;
  }
}

class LightModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF0362FF);
  late Color secondary = const Color(0xFFFFC857);
  late Color tertiary = const Color(0xFF977EC6);
  late Color alternate = const Color(0xFFFFFFFF);
  late Color primaryText = const Color(0xFF1A1F24);
  late Color secondaryText = const Color(0xFF8B97A2);
  late Color primaryBackground = const Color(0xFFFFFFFF);
  late Color secondaryBackground = const Color(0xFFEBE4E4);
  late Color accent1 = const Color(0xFF616161);
  late Color accent2 = const Color(0xFF757575);
  late Color accent3 = const Color(0xFFE0E0E0);
  late Color accent4 = const Color(0xFFEEEEEE);
  late Color success = const Color(0xFF04A24C);
  late Color warning = const Color(0xFFFCDC0C);
  late Color error = const Color(0xFFE21C3D);
  late Color info = const Color(0xFF1C4494);

  late Color progressBar = Color(0xFFE8EDF1);
  late Color darkBackground = Color(0xFF111417);
  late Color textColor = Color(0xFFFFFFFF);
  late Color boxShadow = Color(0x230E151B);
  late Color grayLight = Color(0xFF8B97A2);
  late Color primary30 = Color(0x4D9489F5);
  late Color lineColor = Color(0xFFE0E3E7);
  late Color overlay = Color(0x9AFFFFFF);
  late Color teal = Color(0xFF177E89);
  late Color midnightGreen = Color(0xFF084C61);
  late Color poppy = Color(0xFFDB3A34);
  late Color sunglow = Color(0xFFFFC857);
  late Color jet = Color(0xFF323031);
  late Color primaryBtnText = Color(0xFFFFFFFF);
  late Color primary20 = Color(0x33897DEE);
  late Color secondary20 = Color(0x3331BFAE);
  late Color tertiary20 = Color(0x33F3A743);
  late Color alternate20 = Color(0x34FF5963);
  late Color overlay0 = Color(0x00FFFFFF);
  late Color overlay30 = Color(0x4CFFFFFF);
  late Color alternateTwo = Color(0xFF3A5FFF);
  late Color alternateTwo20 = Color(0x343A5FFF);
}

abstract class Typography {
  String get displayLargeFamily;
  TextStyle get displayLarge;
  String get displayMediumFamily;
  TextStyle get displayMedium;
  String get displaySmallFamily;
  TextStyle get displaySmall;
  String get headlineLargeFamily;
  TextStyle get headlineLarge;
  String get headlineMediumFamily;
  TextStyle get headlineMedium;
  String get headlineSmallFamily;
  TextStyle get headlineSmall;
  String get titleLargeFamily;
  TextStyle get titleLarge;
  String get titleMediumFamily;
  TextStyle get titleMedium;
  String get titleSmallFamily;
  TextStyle get titleSmall;
  String get labelLargeFamily;
  TextStyle get labelLarge;
  String get labelMediumFamily;
  TextStyle get labelMedium;
  String get labelSmallFamily;
  TextStyle get labelSmall;
  String get bodyLargeFamily;
  TextStyle get bodyLarge;
  String get bodyMediumFamily;
  TextStyle get bodyMedium;
  String get bodySmallFamily;
  TextStyle get bodySmall;
}

class MobileTypography extends Typography {
  MobileTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Be Vietnam Pro';
  TextStyle get displayLarge => GoogleFonts.getFont(
        'Be Vietnam Pro',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 57.0,
      );
  String get displayMediumFamily => 'Be Vietnam Pro';
  TextStyle get displayMedium => GoogleFonts.getFont(
        'Be Vietnam Pro',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 45.0,
      );
  String get displaySmallFamily => 'Outfit';
  TextStyle get displaySmall => GoogleFonts.getFont(
        'Outfit',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 32.0,
      );
  String get headlineLargeFamily => 'Be Vietnam Pro';
  TextStyle get headlineLarge => GoogleFonts.getFont(
        'Be Vietnam Pro',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 32.0,
      );
  String get headlineMediumFamily => 'Outfit';
  TextStyle get headlineMedium => GoogleFonts.getFont(
        'Outfit',
        color: theme.primary,
        fontWeight: FontWeight.w500,
        fontSize: 28.0,
      );
  String get headlineSmallFamily => 'Outfit';
  TextStyle get headlineSmall => GoogleFonts.getFont(
        'Outfit',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 20.0,
      );
  String get titleLargeFamily => 'Be Vietnam Pro';
  TextStyle get titleLarge => GoogleFonts.getFont(
        'Be Vietnam Pro',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 22.0,
      );
  String get titleMediumFamily => 'Outfit';
  TextStyle get titleMedium => GoogleFonts.getFont(
        'Outfit',
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 18.0,
      );
  String get titleSmallFamily => 'Outfit';
  TextStyle get titleSmall => GoogleFonts.getFont(
        'Outfit',
        color: theme.alternate,
        fontWeight: FontWeight.normal,
        fontSize: 18.0,
      );
  String get labelLargeFamily => 'Be Vietnam Pro';
  TextStyle get labelLarge => GoogleFonts.getFont(
        'Be Vietnam Pro',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
      );
  String get labelMediumFamily => 'Be Vietnam Pro';
  TextStyle get labelMedium => GoogleFonts.getFont(
        'Be Vietnam Pro',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 12.0,
      );
  String get labelSmallFamily => 'Be Vietnam Pro';
  TextStyle get labelSmall => GoogleFonts.getFont(
        'Be Vietnam Pro',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 11.0,
      );
  String get bodyLargeFamily => '';
  TextStyle get bodyLarge => GoogleFonts.getFont(
        'Roboto',
      );
  String get bodyMediumFamily => 'Outfit';
  TextStyle get bodyMedium => GoogleFonts.getFont(
        'Outfit',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get bodySmallFamily => 'Outfit';
  TextStyle get bodySmall => GoogleFonts.getFont(
        'Outfit',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
}

class TabletTypography extends Typography {
  TabletTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Be Vietnam Pro';
  TextStyle get displayLarge => GoogleFonts.getFont(
        'Be Vietnam Pro',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 57.0,
      );
  String get displayMediumFamily => 'Be Vietnam Pro';
  TextStyle get displayMedium => GoogleFonts.getFont(
        'Be Vietnam Pro',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 45.0,
      );
  String get displaySmallFamily => 'Outfit';
  TextStyle get displaySmall => GoogleFonts.getFont(
        'Outfit',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 32.0,
      );
  String get headlineLargeFamily => 'Be Vietnam Pro';
  TextStyle get headlineLarge => GoogleFonts.getFont(
        'Be Vietnam Pro',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 32.0,
      );
  String get headlineMediumFamily => 'Outfit';
  TextStyle get headlineMedium => GoogleFonts.getFont(
        'Outfit',
        color: theme.primary,
        fontWeight: FontWeight.w500,
        fontSize: 28.0,
      );
  String get headlineSmallFamily => 'Outfit';
  TextStyle get headlineSmall => GoogleFonts.getFont(
        'Outfit',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 20.0,
      );
  String get titleLargeFamily => 'Be Vietnam Pro';
  TextStyle get titleLarge => GoogleFonts.getFont(
        'Be Vietnam Pro',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 22.0,
      );
  String get titleMediumFamily => 'Outfit';
  TextStyle get titleMedium => GoogleFonts.getFont(
        'Outfit',
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 18.0,
      );
  String get titleSmallFamily => 'Outfit';
  TextStyle get titleSmall => GoogleFonts.getFont(
        'Outfit',
        color: theme.alternate,
        fontWeight: FontWeight.normal,
        fontSize: 18.0,
      );
  String get labelLargeFamily => 'Be Vietnam Pro';
  TextStyle get labelLarge => GoogleFonts.getFont(
        'Be Vietnam Pro',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
      );
  String get labelMediumFamily => 'Be Vietnam Pro';
  TextStyle get labelMedium => GoogleFonts.getFont(
        'Be Vietnam Pro',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 12.0,
      );
  String get labelSmallFamily => 'Be Vietnam Pro';
  TextStyle get labelSmall => GoogleFonts.getFont(
        'Be Vietnam Pro',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 11.0,
      );
  String get bodyLargeFamily => '';
  TextStyle get bodyLarge => GoogleFonts.getFont(
        'Roboto',
      );
  String get bodyMediumFamily => 'Outfit';
  TextStyle get bodyMedium => GoogleFonts.getFont(
        'Outfit',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get bodySmallFamily => 'Outfit';
  TextStyle get bodySmall => GoogleFonts.getFont(
        'Outfit',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
}

class DesktopTypography extends Typography {
  DesktopTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Be Vietnam Pro';
  TextStyle get displayLarge => GoogleFonts.getFont(
        'Be Vietnam Pro',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 57.0,
      );
  String get displayMediumFamily => 'Be Vietnam Pro';
  TextStyle get displayMedium => GoogleFonts.getFont(
        'Be Vietnam Pro',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 45.0,
      );
  String get displaySmallFamily => 'Outfit';
  TextStyle get displaySmall => GoogleFonts.getFont(
        'Outfit',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 32.0,
      );
  String get headlineLargeFamily => 'Be Vietnam Pro';
  TextStyle get headlineLarge => GoogleFonts.getFont(
        'Be Vietnam Pro',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 32.0,
      );
  String get headlineMediumFamily => 'Outfit';
  TextStyle get headlineMedium => GoogleFonts.getFont(
        'Outfit',
        color: theme.primary,
        fontWeight: FontWeight.w500,
        fontSize: 28.0,
      );
  String get headlineSmallFamily => 'Outfit';
  TextStyle get headlineSmall => GoogleFonts.getFont(
        'Outfit',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 20.0,
      );
  String get titleLargeFamily => 'Be Vietnam Pro';
  TextStyle get titleLarge => GoogleFonts.getFont(
        'Be Vietnam Pro',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 22.0,
      );
  String get titleMediumFamily => 'Outfit';
  TextStyle get titleMedium => GoogleFonts.getFont(
        'Outfit',
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 18.0,
      );
  String get titleSmallFamily => 'Outfit';
  TextStyle get titleSmall => GoogleFonts.getFont(
        'Outfit',
        color: theme.alternate,
        fontWeight: FontWeight.normal,
        fontSize: 18.0,
      );
  String get labelLargeFamily => 'Be Vietnam Pro';
  TextStyle get labelLarge => GoogleFonts.getFont(
        'Be Vietnam Pro',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
      );
  String get labelMediumFamily => 'Be Vietnam Pro';
  TextStyle get labelMedium => GoogleFonts.getFont(
        'Be Vietnam Pro',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 12.0,
      );
  String get labelSmallFamily => 'Be Vietnam Pro';
  TextStyle get labelSmall => GoogleFonts.getFont(
        'Be Vietnam Pro',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 11.0,
      );
  String get bodyLargeFamily => '';
  TextStyle get bodyLarge => GoogleFonts.getFont(
        'Roboto',
      );
  String get bodyMediumFamily => 'Outfit';
  TextStyle get bodyMedium => GoogleFonts.getFont(
        'Outfit',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get bodySmallFamily => 'Outfit';
  TextStyle get bodySmall => GoogleFonts.getFont(
        'Outfit',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
}

class DarkModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF4B39EF);
  late Color secondary = const Color(0xFFFBAF7C);
  late Color tertiary = const Color(0xFF39D2C0);
  late Color alternate = const Color(0xFFFFFFFF);
  late Color primaryText = const Color(0xFFFFFFFF);
  late Color secondaryText = const Color(0xFF8B97A2);
  late Color primaryBackground = const Color(0xFF1A1F24);
  late Color secondaryBackground = const Color(0xFF111417);
  late Color accent1 = const Color(0xFFEEEEEE);
  late Color accent2 = const Color(0xFFE0E0E0);
  late Color accent3 = const Color(0xFF757575);
  late Color accent4 = const Color(0xFF616161);
  late Color success = const Color(0xFF04A24C);
  late Color warning = const Color(0xFFFCDC0C);
  late Color error = const Color(0xFFE21C3D);
  late Color info = const Color(0xFF1C4494);

  late Color progressBar = Color(0xFF1A1F24);
  late Color darkBackground = Color(0xFF111417);
  late Color textColor = Color(0xFFFFFFFF);
  late Color boxShadow = Color(0xFF57636C);
  late Color grayLight = Color(0xFF8B97A2);
  late Color primary30 = Color(0xFFEC2790);
  late Color lineColor = Color(0xFF72DA0E);
  late Color overlay = Color(0xFFC5FD0F);
  late Color teal = Color(0xFF177E89);
  late Color midnightGreen = Color(0xFF084C61);
  late Color poppy = Color(0xFFDB3A34);
  late Color sunglow = Color(0xFFFFC857);
  late Color jet = Color(0xFF323031);
  late Color primaryBtnText = Color(0xFFFFFFFF);
  late Color primary20 = Color(0x33897DEE);
  late Color secondary20 = Color(0x3331BFAE);
  late Color tertiary20 = Color(0x33F3A743);
  late Color alternate20 = Color(0x34FF5963);
  late Color overlay0 = Color(0x0023202E);
  late Color overlay30 = Color(0x4C23202E);
  late Color alternateTwo = Color(0xFF3A5FFF);
  late Color alternateTwo20 = Color(0x343A5FFF);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
