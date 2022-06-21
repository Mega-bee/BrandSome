import 'package:brandsome/utils/service/theme_serrvice/theme_service.dart';
import 'package:brandsome/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'hive/hive.dart';
import 'navigation_bar/ui/screens/navigationBar.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await HiveSetUp.init();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: blackColor,
    )
  );
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AppThemeDataService _appThemeDataService;

  late ThemeData activeThem;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BrandSome',
      theme: ThemeData(
        primarySwatch: primaryColor,
        unselectedWidgetColor: primaryColor
      ),
      home: Navigation()
    );
  }

  @override
  void initState() {
    _appThemeDataService = AppThemeDataService();
    activeThem =_appThemeDataService.getActiveTheme();
    _appThemeDataService.darkModeStream.listen((event) {
      activeThem = event;
      setState(() {

      });
    });
  }
}


