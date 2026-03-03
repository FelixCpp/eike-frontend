import 'package:eike_frontend/theme/theme.dart';
import 'package:eike_frontend/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

abstract final class EikeTheme {
  static const horizontalPagePadding = 16.0;
  static const verticalPagePadding = 24.0;
  static const pagePadding = EdgeInsets.symmetric(
    vertical: verticalPagePadding,
    horizontal: horizontalPagePadding,
  );

  static ThemeData lightScheme(BuildContext context) {
    return MaterialTheme(_getTextTheme(context)).light()..applyDefaults();
  }

  static ThemeData darkScheme(BuildContext context) {
    return MaterialTheme(_getTextTheme(context)).dark().applyDefaults();
  }

  static ThemeData lightHighContrastScheme(BuildContext context) {
    return MaterialTheme(_getTextTheme(context)).lightHighContrast()
      ..applyDefaults();
  }

  static ThemeData darkHighContrastScheme(BuildContext context) {
    return MaterialTheme(_getTextTheme(context)).darkHighContrast()
      ..applyDefaults();
  }
}

TextTheme _getTextTheme(BuildContext context) {
  return _createTextTheme(context, 'Inter', 'Inter');
}

TextTheme _createTextTheme(
  BuildContext context,
  String bodyFontString,
  String displayFontString,
) {
  final base = context.textTheme;
  return base.apply(
    fontFamily: bodyFontString,
    displayColor: base.bodyLarge?.color,
    bodyColor: base.bodyLarge?.color,
  );
}

extension on ThemeData {
  ThemeData applyDefaults() {
    // TODO(Felix): Apply default settings such as appBarTheme, filledButtonTheme etc.
    return copyWith();
  }
}
