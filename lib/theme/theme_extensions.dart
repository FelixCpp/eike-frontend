import 'package:flutter/material.dart';

extension GetThemeOfContextExt on BuildContext {
  ColorScheme get colors => ColorScheme.of(this);
  TextTheme get textTheme => TextTheme.of(this);
}
