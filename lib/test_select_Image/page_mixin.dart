//import 'dart:io';
//
//import 'package:brandsome/test_select_Image/widgets/method_list_view.dart';
//import 'package:brandsome/test_select_Image/widgets/selected_assets_list_view.dart';
//import 'package:flutter/widgets.dart';
//import 'package:image_editor_plus/data/image_item.dart';
//import 'package:wechat_assets_picker/wechat_assets_picker.dart'
//    show
//        AssetEntity,
//        DefaultAssetPickerProvider,
//        DefaultAssetPickerBuilderDelegate;
//import 'picker_method.dart';
//
//@optionalTypeArgs
//mixin ExamplePageMixin<T extends StatefulWidget> on State<T> {
//  final ValueNotifier<bool> isDisplayingDetail = ValueNotifier<bool>(true);
//
//  @override
//  void dispose() {
//    isDisplayingDetail.dispose();
//    super.dispose();
//  }
//
//  int get maxAssetsCount;
//
//  List<AssetEntity> assets = <AssetEntity>[];
//
//  int get assetsLength => assets.length;
//
//  List<PickMethod> get pickMethods;
//
//  /// These fields are for the keep scroll position feature.
//  late DefaultAssetPickerProvider keepScrollProvider =
//      DefaultAssetPickerProvider();
//  DefaultAssetPickerBuilderDelegate? keepScrollDelegate;
//
//  Future<void> selectAssets(PickMethod model) async {
//    final List<AssetEntity>? result = await model.method(context, assets);
//    if (result != null) {
//      assets = List<AssetEntity>.from(result);
//      if (mounted) {
//        setState(() {});
//      }
//    }
//  }
//
//  void removeAsset(int index) {
//    assets.removeAt(index);
//    if (assets.isEmpty) {
//      isDisplayingDetail.value = false;
//    }
//    setState(() {});
//  }
//
//  void onResult(List<AssetEntity>? result) {
//    if (result != null && result != assets) {
//      assets = List<AssetEntity>.from(result);
//      if (mounted) {
//        setState(() {});
//      }
//    }
//  }
//
//  @override
//  @mustCallSuper
//  Widget build(BuildContext context) {
//    super.build(context);
//    return Column(
//      children: <Widget>[
//        Expanded(
//          child: MethodListView(
//            pickMethods: pickMethods,
//            onSelectMethod: selectAssets,
//          ),
//        ),
//        if (assets.isNotEmpty)
//          SelectedAssetsListView(
//            assets: assets,
//            isDisplayingDetail: isDisplayingDetail,
//            onResult: onResult,
//            onRemoveAsset: removeAsset,
//            eeditedImages: changeToUtfImage(assets),
//          ),
//      ],
//    );
//  }
//
//  List<ImageItem> changeToUtfImage(List<AssetEntity>? result) {
//    List<ImageItem> imageFiles = [];
//    if (result != null) {
//      result.forEach((element) async {
//        await element.file.then((value) {
//          if (value != null) {
//           ImageItem(value.readAsBytesSync());
//          }
//        });
//      });
//    }
//    return imageFiles;
//  }
//}
