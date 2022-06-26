import 'package:brandsome/hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AppThemeDataService {
  static final PublishSubject<ThemeData> _darkModeSubject =
  PublishSubject<ThemeData>();

  Stream<ThemeData> get darkModeStream => _darkModeSubject.stream;

  ThemeHelper _themeHelper = ThemeHelper();

  static Color get PrimaryColor {
    return Colors.deepOrange;
  }

  ThemeData getActiveTheme() {
    var dark = _themeHelper.getisDark();
    final lightScheme = ColorScheme.fromSeed(seedColor: PrimaryColor);
    final darkScheme = ColorScheme.fromSeed(
        seedColor: PrimaryColor,
        brightness: Brightness.dark,
        error: Colors.red[900],
        errorContainer: Colors.red[100],
        primary: Colors.grey[900]);
    if (dark == true) {
      return ThemeData(
          appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: Colors.white)
          ),
          brightness: Brightness.dark,
          colorScheme: darkScheme,
          useMaterial3: true,
          primarySwatch: Colors.deepOrange,
          focusColor: PrimaryColor,
          primaryColor:PrimaryColor,
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(primary: Colors.white70)),
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
//          cardColor: Colors.grey[150],
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
          ));
    }
    return ThemeData(
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black)
      ),
        brightness: Brightness.light,
        primaryColor: PrimaryColor,
        colorScheme: lightScheme,
        useMaterial3: true,
        focusColor: PrimaryColor,
        primarySwatch: Colors.deepOrange,
//        cardColor: Color.fromRGBO(245, 245, 245, 1),
//        backgroundColor: Color.fromRGBO(236, 239, 241, 1),
        textTheme: TextTheme(button: TextStyle(color: Colors.white)),
        fontFamily: 'Dubai',
        timePickerTheme: TimePickerThemeData(
          dialBackgroundColor: Color.fromRGBO(235, 235, 235, 1),
          dayPeriodBorderSide:
          BorderSide(color: Color.fromRGBO(235, 235, 235, 1)),
        ));
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
