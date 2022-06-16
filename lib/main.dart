import 'package:brandsome/utils/style/colors.dart';
import 'package:flutter/material.dart';

import 'navigation_bar/ui/screens/navigationBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BrandSome',
      theme: ThemeData(
        primarySwatch: primaryColor,
      ),
      home: Navigation()
    );
  }
}

