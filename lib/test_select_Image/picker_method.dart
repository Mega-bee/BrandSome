import 'package:flutter/material.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

Future<AssetEntity?> _pickFromCamera(BuildContext c) {
  return CameraPicker.pickFromCamera(
    c,
    pickerConfig: const CameraPickerConfig(enableRecording: true),
  );
}

/// Define a regular pick method.
class PickMethod {
  const PickMethod({
    required this.icon,
    required this.name,
    required this.description,
    required this.method,
    this.onLongPress,
  });

  factory PickMethod.cameraAndStay({required int maxAssetsCount}) {
    return PickMethod(
      icon: '📸',
      name: 'Pick from camera and stay',
      description: 'Take a photo or video with the camera picker, '
          'select the result and stay in the entities list.',
      method: (BuildContext context, List<AssetEntity> assets) {
        const AssetPickerTextDelegate textDelegate = AssetPickerTextDelegate();
        return AssetPicker.pickAssets(
          context,
          pickerConfig: AssetPickerConfig(

            maxAssets: maxAssetsCount,
            selectedAssets: assets,
            requestType: RequestType.common,
            gridCount: 3,
            pageSize: 120,
//            pickerTheme: AssetPicker.themeData(
//              Colors.lightBlueAccent,
//              light: true,
//            ),
            specialItemPosition: SpecialItemPosition.prepend,
            specialItemBuilder: (
              BuildContext context,
              AssetPathEntity? path,
              int length,
            ) {
              if (path?.isAll != true) {
                return null;
              }
              return Semantics(
                label: textDelegate.sActionUseCameraHint,
                button: true,
                onTapHint: textDelegate.sActionUseCameraHint,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () async {
                    final AssetEntity? result = await _pickFromCamera(context);
                    if (result == null) {
                      return;
                    }
                    final AssetPicker<AssetEntity, AssetPathEntity> picker =
                        context.findAncestorWidgetOfExactType()!;
                    final DefaultAssetPickerBuilderDelegate builder =
                        picker.builder as DefaultAssetPickerBuilderDelegate;
                    final DefaultAssetPickerProvider p = builder.provider;
                    p.currentPath =
                        await p.currentPath!.obtainForNewProperties();
                    await p.switchPath(p.currentPath!);
                    p.selectAsset(result);
                  },
                  child: const Center(
                    child: Icon(Icons.camera_enhance, size: 42.0),
                  ),
                ),
              );
            },
          ),
        );
      },

    );
  }

  factory PickMethod.keepScrollOffset({
    required DefaultAssetPickerBuilderDelegate Function() delegate,
    required Function(PermissionState state) onPermission,
    GestureLongPressCallback? onLongPress,
  }) {
    return PickMethod(
      icon: '💾',
      name: 'Keep scroll offset',
      description: 'Pick assets from same scroll position.',
      method: (BuildContext context, List<AssetEntity> assets) async {
        final PermissionState _ps =
            await PhotoManager.requestPermissionExtend();
        if (_ps != PermissionState.authorized &&
            _ps != PermissionState.limited) {
          throw StateError('Permission state error with $_ps.');
        }
        onPermission(_ps);
        return AssetPicker.pickAssetsWithDelegate(
          context,
          delegate: delegate(),
        );
      },
      onLongPress: onLongPress,
    );
  }


  final String icon;
  final String name;
  final String description;

  /// The core function that defines how to use the picker.
  final Future<List<AssetEntity>?> Function(
    BuildContext context,
    List<AssetEntity> selectedAssets,
  ) method;

  final GestureLongPressCallback? onLongPress;
}
