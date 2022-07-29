/////
///// @Author Alex (https://github.com/AlexV525)
///// [Date] 2021/7/13 10:51
/////
////import 'dart:io';
//import 'dart:io';
//import 'dart:typed_data';
//
//import 'package:flutter/material.dart';
//import 'package:image_editor_plus/data/image_item.dart';
//import 'package:image_editor_plus/image_editor_plus.dart';
//import 'package:wechat_assets_picker/wechat_assets_picker.dart'
//    show AssetEntity, AssetPicker, AssetPickerViewer;
//import 'asset_widget_builder.dart';
//
//class SelectedAssetsListView extends StatefulWidget {
//  const SelectedAssetsListView({
//    Key? key,
//    required this.assets,
//    required this.isDisplayingDetail,
//    required this.onResult,
//    required this.onResultAfterEdit,
//    required this.onRemoveAsset,
//    required this.eeditedImages,
//  }) : super(key: key);
//
//  final List<AssetEntity> assets;
//  final  List<Uint8List> eeditedImages;
//  final ValueNotifier<bool> isDisplayingDetail;
//  final void Function(List<AssetEntity>? result) onResult;
//  final void Function(List<ImageItem>? result) onResultAfterEdit;
//  final void Function(int index) onRemoveAsset;
//
//  @override
//  State<SelectedAssetsListView> createState() => _SelectedAssetsListViewState();
//}
//
//class _SelectedAssetsListViewState extends State<SelectedAssetsListView> {
//  Widget _selectedAssetWidget(BuildContext context, int index) {
//    final AssetEntity asset = widget.assets.elementAt(index);
//    return ValueListenableBuilder<bool>(
//      valueListenable: widget.isDisplayingDetail,
//      builder: (_, bool value, __) => GestureDetector(
//        onTap: () async {
//          if (value) {
//             print('ingoo');
//             print(widget.eeditedImages.length);
//             List<ImageItem> images = await Navigator.push(
//              context,
//              MaterialPageRoute(
//                builder: (context) => ImageEditor(
//                  images:widget.eeditedImages,
//                  allowGallery: true,
//                  allowMultiple: true,
//                ),
//              ),
//            );
//             widget.onResultAfterEdit(images);
//
//          }
//
////            final List<AssetEntity>? result =
////                await AssetPickerViewer.pushToViewer(
////              context,
////              currentIndex: index,
////              previewAssets: assets,
////              themeData: AssetPicker.themeData(Color(0xff00bc56)),
////            );
//          },
//        child: RepaintBoundary(
//          child: ClipRRect(
//            borderRadius: BorderRadius.circular(8.0),
//            child: AssetWidgetBuilder(
//              entity: asset,
//              isDisplayingDetail: value,
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//
//  Widget _selectedAssetDeleteButton(BuildContext context, int index) {
//    return GestureDetector(
//      onTap: () => widget.onRemoveAsset(index),
//      child: DecoratedBox(
//        decoration: BoxDecoration(
//          borderRadius: BorderRadius.circular(4.0),
//          color: Theme.of(context).canvasColor.withOpacity(0.5),
//        ),
//        child: const Icon(Icons.close, size: 18.0),
//      ),
//    );
//  }
//
//  Widget get selectedAssetsListView {
//    return Expanded(
//      child: GridView.builder(
//        gridDelegate:
//        const SliverGridDelegateWithMaxCrossAxisExtent(
//            maxCrossAxisExtent: 200,
//            childAspectRatio: 3 / 2.1,
//            crossAxisSpacing: 20,
//            mainAxisSpacing: 20),
//        shrinkWrap: true,
//        physics: const BouncingScrollPhysics(),
//        padding: const EdgeInsets.symmetric(horizontal: 8.0),
//        scrollDirection: Axis.horizontal,
//        itemCount: widget.assets.length,
//        itemBuilder: (BuildContext c, int index) {
//          return Padding(
//            padding: const EdgeInsets.symmetric(
//              horizontal: 8.0,
//              vertical: 16.0,
//            ),
//            child: AspectRatio(
//              aspectRatio: 1.0,
//              child: Stack(
//                children: <Widget>[
//                  Positioned.fill(child: _selectedAssetWidget(c, index)),
//                  ValueListenableBuilder<bool>(
//                    valueListenable: widget.isDisplayingDetail,
//                    builder: (_, bool value, __) => AnimatedPositioned(
//                      duration: kThemeAnimationDuration,
//                      top: value ? 6.0 : -30.0,
//                      right: value ? 6.0 : -30.0,
//                      child: _selectedAssetDeleteButton(c, index),
//                    ),
//                  ),
//                ],
//              ),
//            ),
//          );
//        },
//      ),
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return ValueListenableBuilder<bool>(
//      valueListenable: widget.isDisplayingDetail,
//      builder: (_, bool value, __) => AnimatedContainer(
//        duration: kThemeChangeDuration,
//        curve: Curves.easeInOut,
//        height: widget.assets.isNotEmpty
//            ? value
//                ? 120.0
//                : 80.0
//            : 40.0,
//        child: Column(
//          children: <Widget>[
//            selectedAssetsListView,
//          ],
//        ),
//      ),
//    );
//  }
//}
