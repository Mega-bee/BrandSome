///
/// @Author Alex (https://github.com/AlexV525)
/// [Date] 2020-05-31 21:38
///
import 'package:brandsome/test_select_Image/multi_assets_page.dart';
import 'package:brandsome/test_select_Image/single_assets_page.dart';
import 'package:brandsome/utils/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
  );
  AssetPicker.registerObserve();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WeChat Asset Picker Demo',
      home: const HomePage(),
//      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
//        GlobalWidgetsLocalizations.delegate,
//        GlobalMaterialLocalizations.delegate,
//        GlobalCupertinoLocalizations.delegate,
//      ],
//      supportedLocales: const <Locale>[
//        Locale('zh'), // Chinese
//        // Locale('iw'), // Hebrew
//      ],
//      locale: const Locale('zh'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController controller = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(pageControllerListener);
  }

  void selectIndex(int index) {
    if (index == currentIndex) {
      return;
    }
    controller.animateToPage(
      index,
      duration: kThemeAnimationDuration,
      curve: Curves.easeInOut,
    );
  }

  void pageControllerListener() {
    final int? currentPage = controller.page?.round();
    if (currentPage != null && currentPage != currentIndex) {
      currentIndex = currentPage;
      if (mounted) {
        setState(() {});
      }
    }
  }

  Widget header(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(top: 30.0),
      height: 60.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.0,
            child: Hero(
              tag: 'LOGO',
              child: Image.asset(ImageAsset.LOGO),
            ),
          ),
          const SizedBox(width: 10.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Semantics(
                sortKey: const OrdinalSortKey(0),
                child: Text(
                  'WeChat Asset Picker',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Semantics(
                sortKey: const OrdinalSortKey(0.1),
                child: Text(
                  'Version:',
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
            ],
          ),
          const SizedBox(width: 20.0),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value:  SystemUiOverlayStyle.light,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
            
              Expanded(
                child: PageView(
                  controller: controller,
                  children: <Widget>[
//                    MultiAssetsPage(),
//                    SingleAssetPage(),
//                    CustomPickersPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: selectIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.photo_library),
              label: 'Multi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.photo),
              label: 'Single',
            ),
          ],
        ),
      ),
    );
  }
}
