import 'package:brandsome/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../../hive/hive.dart';

class AppThemeDataService {
  static final PublishSubject<ThemeData> _darkModeSubject =
      PublishSubject<ThemeData>();

  Stream<ThemeData> get darkModeStream => _darkModeSubject.stream;

  ThemeHelper _themeHelper = ThemeHelper();

  static Color get PrimaryColor {
    return Color.fromRGBO(33, 32, 156, 1);
  }

  ThemeData getActiveTheme() {
    var dark = _themeHelper.getisDark();
    final lightScheme = ColorScheme.fromSeed(seedColor: PrimaryColor);
    final darkScheme = ColorScheme.fromSeed(
        seedColor: PrimaryColor,
        brightness: Brightness.dark,
        error: Colors.red[900],
        errorContainer: Colors.red[100],
        primary: blackColor);
    if (dark == true) {
      return ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: blackColor,
          ),
          scaffoldBackgroundColor: blackColor,
          brightness: Brightness.dark,
          colorScheme: darkScheme,
          // useMaterial3: true,
          primarySwatch: Colors.indigo,
          focusColor: PrimaryColor,
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(primary: Colors.white70),
          ),
          checkboxTheme: CheckboxThemeData(
            checkColor:
                MaterialStateProperty.resolveWith((Set<MaterialState> states) {
              const Set<MaterialState> interactiveStates = <MaterialState>{
                MaterialState.pressed,
                MaterialState.hovered,
                MaterialState.focused,
              };
              if (states.any(interactiveStates.contains)) {
                return Colors.grey;
              }
              return Colors.white;
            }),
            fillColor:
                MaterialStateProperty.resolveWith((Set<MaterialState> states) {
              const Set<MaterialState> interactiveStates = <MaterialState>{
                MaterialState.pressed,
                MaterialState.hovered,
                MaterialState.focused,
              };
              if (states.any(interactiveStates.contains)) {
                return Colors.black;
              }
              return Colors.indigo;
            }),
          ),
          cardColor: Colors.grey[150],
          fontFamily: 'Dubai',
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          )),
          textTheme: TextTheme(
            button: TextStyle(
              color: Colors.white,
            ),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: primaryColor,
          ));
    }
    return ThemeData(
      unselectedWidgetColor: primaryColor,
      appBarTheme: AppBarTheme(
        backgroundColor: whiteColor,
      ),
      scaffoldBackgroundColor: whiteColor,
      brightness: Brightness.light,
      colorScheme: lightScheme,
      focusColor: PrimaryColor,
      primarySwatch:primaryColor,
      cardColor:whiteColor,
      backgroundColor: whiteColor,
      textTheme: TextTheme(button: TextStyle(color: Colors.white),),
      fontFamily: 'Dubai',
      timePickerTheme: TimePickerThemeData(
        dialBackgroundColor: Color.fromRGBO(235, 235, 235, 1),
        dayPeriodBorderSide:
            BorderSide(color: Color.fromRGBO(235, 235, 235, 1)),
      ),

      // bottomNavigationBarTheme:BottomNavigationBarThemeData(
      // backgroundColor: customColor
      // )
    );
  }

  void switchDarkMode(bool darkMode) async {
    if (darkMode) {
      _themeHelper.setTheme(true);
    } else {
      _themeHelper.setTheme(false);
    }
    var activeTheme = await getActiveTheme();
    _darkModeSubject.add(activeTheme);
  }
}
