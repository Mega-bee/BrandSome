import 'dart:async';
import 'package:brandsome/abstracts/module/rout_module.dart';
import 'package:brandsome/business_module/business_module.dart';
import 'package:brandsome/categories_module/categories_module.dart';
import 'package:brandsome/di/di_config.dart';
import 'package:brandsome/follower_module/follower_module.dart';
import 'package:brandsome/home_page/home_module.dart';
import 'package:brandsome/navigation_bar/navigator_module.dart';
import 'package:brandsome/navigation_bar/navigator_routes.dart';
import 'package:brandsome/posts_module/post_module.dart';
import 'package:brandsome/setting_module/setting_module.dart';
import 'package:brandsome/utils/logger/logger.dart';
import 'package:brandsome/utils/service/theme_serrvice/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'business_details_module/business_details_module.dart';
import 'hive/hive.dart';
import 'liked_module/liked_list_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveSetUp.init();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) async {
    FlutterError.onError = (FlutterErrorDetails details) async {
      Logger().error('Main', details.toString(), StackTrace.current);
    };
    await runZonedGuarded(() {
      configureDependencies();
      // Your App Here
      runApp(getIt<MyApp>());
    }, (error, stackTrace) {
      new Logger().error(
          'Main', error.toString() + stackTrace.toString(), StackTrace.current);
    });
  });
}

@injectable
class MyApp extends StatefulWidget {
  final AppThemeDataService _themeDataService;
  final NavigatorModule _navigatorModule;
  final BusinessModule _businessModule;
  final  BusinessDetailsModule _businessDetailsModule;
  final  LikedListModule _likedListModule;
  final SettingModule _settingModule;
  final FollowerModule _followersModule;
//  final AuthorizationModule _authorizationModule;/
  final CategoryModule _categoryModule;
  final HomeModule _homeModule;
  final PostModule _postModule;




  MyApp(
      this._themeDataService,
      this._navigatorModule,
      this._businessModule,
      this._businessDetailsModule,
      this._likedListModule,
      this._settingModule,
      this._followersModule,
//      this._authorizationModule,
      this._categoryModule,
      this._homeModule,
      this._postModule
      );

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ThemeData activeThem;

  @override
  Widget build(BuildContext context) {
    return getConfiguredApp(RoutModule.RoutesMap);
  }

  Widget getConfiguredApp(
      Map<String, WidgetBuilder> fullRoutesList,
      ) {
    return  MaterialApp(
//      navigatorKey: GlobalVariable.navState,
//        scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
//      navigatorObservers: <NavigatorObserver>[observer],
//        navigatorKey: GlobalVariable.navState,
//        locale: Locale.fromSubtags(
//          languageCode: lang,
//        ),
//        localizationsDelegates: [
//          S.delegate,
//          GlobalMaterialLocalizations.delegate,
//          GlobalWidgetsLocalizations.delegate,
//          GlobalCupertinoLocalizations.delegate,
//        ],
      theme: activeThem,
//        supportedLocales: S.delegate.supportedLocales,
      title: 'BrandSome',
      routes: fullRoutesList,
      initialRoute: NavRoutes.nav_rout,
    );
  }
  @override
  void initState() {
    activeThem = widget._themeDataService.getActiveTheme();
    widget._themeDataService.darkModeStream.listen((event) {
      activeThem = event;
      setState(() {});
    });
  }
}
