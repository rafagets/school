import 'package:flutter/material.dart';
import 'package:shcool/styles/palette_dark.dart';
import 'package:shcool/styles/palette_light.dart';

class MyTheme {
  static final PaletteLight _light = PaletteLight();
  static final PaletteDark _dark = PaletteDark();

  static final ThemeData claro = ThemeData.light().copyWith(
    colorScheme: ThemeData.light().colorScheme.copyWith(
          primary: _light.primary,
          secondary: _light.secondary,
          background: _light.backgroud,
          error: _light.error,
        ),
    primaryColor: _light.primary,
    appBarTheme: AppBarTheme(
      backgroundColor: _light.primaryDark,
      titleTextStyle: TextStyle(
        color: _light.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateColor.resolveWith((states) => _light.primary),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateColor.resolveWith((states) {
        return states.contains(MaterialState.selected) ? _light.primary : _light.secondary;
      }),
      trackColor: MaterialStateColor.resolveWith((states) {
        return states.contains(MaterialState.selected) ? _light.primaryDark : _light.secondary;
      }),
    ),
  );

  static final ThemeData escuro = ThemeData.dark().copyWith();
}
