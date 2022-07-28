///
/// @Author Alex (https://github.com/AlexV525)
/// [Date] 2020-05-31 20:21
///
import 'package:brandsome/test_select_Image/page_mixin.dart';
import 'package:brandsome/test_select_Image/picker_method.dart';
import 'package:flutter/material.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class MultiAssetsPage extends StatefulWidget {
  @override
  _MultiAssetsPageState createState() => _MultiAssetsPageState();
}

class _MultiAssetsPageState extends State<MultiAssetsPage>
    with AutomaticKeepAliveClientMixin, ExamplePageMixin {
  @override
  int get maxAssetsCount => 9;

  /// Check each method's source code for more details.
  @override
  List<PickMethod> get pickMethods {
    return <PickMethod>[
      PickMethod.cameraAndStay(maxAssetsCount: maxAssetsCount),
    ];
  }

  @override
  bool get wantKeepAlive => true;
}
