import 'dart:io';
import 'dart:typed_data';
import 'package:brandsome/business_module/reponse/business_response.dart';
import 'package:brandsome/posts_module/request/creat_post_request.dart';
import 'package:brandsome/posts_module/ui/widgets/preview_full_screen.dart';
import 'package:brandsome/test_select_Image/picker_method.dart';
import 'package:brandsome/utils/images/images.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_editor_plus/data/image_item.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';
import '../../../abstracts/states/state.dart';
import '../screen/createPost.dart';

class CreatePostInit extends States {
  final CreatePostScreenState screenState;
  final List<BusinessResponse> business;

  CreatePostInit(
      {required this.business, required this.screenState})
      : super(false) {
    if(business.isNotEmpty){
      selectedBusiness = business.first;
      selectedBusiness?.isSelected = true;
      selectedCity = selectedBusiness?.city?.first;
      selectedCity?.isSelected = true;
      selectedService = selectedBusiness?.services?.first;
      selectedService?.isSelected = true;
    }

  }

  final description = TextEditingController();
  BusinessResponse? selectedBusiness;
  City? selectedCity;
  Service? selectedService;
  List<AssetEntity> assets = <AssetEntity>[];
  List<Uint8List> imagesFile = [];
  List<ImageItem> imagesAfterEdit = [];
  CreatePostRequest request = CreatePostRequest(media: []);

  final ValueNotifier<bool> isDisplayingDetail = ValueNotifier<bool>(true);

  @override
  Widget getUI(BuildContext context) {
    print('IN Statate');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).primaryColor,
          ),
        ),
        title: const Text("Add Post"),
        actions: [
          IconButton(
            onPressed: () {
              request.cityId = selectedCity?.businessCityId;
              request.serviceId = selectedService?.businessServiceId;
              request.description = description.text;
              screenState.createPostRequest(request);
            },
            icon: Icon(
              Icons.check,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // caption
            ListTile(
              leading: imagesAfterEdit.isNotEmpty
                  ? InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  FullscreenSlider(imagesAfterEdit)),
                        );
                      },
                      child: Image.memory(imagesAfterEdit.first.image))
                  : InkWell(
                      onTap: () {
                        selectAssets(
                            PickMethod.cameraAndStay(maxAssetsCount: 10),
                            context);
                      },
                      child: Container(
                          height: 100,
                          width: 50,
                          child: Center(
                              child: Image.asset(
                            ImageAsset.ADD_IMAGES,
                            height: 70,
                          ))),
                    ),
              title: TextFormField(
                controller: description,
                keyboardType: TextInputType.multiline,
                minLines: 1, //Normal textInputField will be displayed
                maxLines: 5, // when user presses enter it will adapt to it
                maxLength: 150,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: "Write caption"),
              ),
            ),
            Divider(
              indent: 16,
              endIndent: 16,
              color: Theme.of(context).backgroundColor,
              thickness: 1,
            ),
            ListTile(
              leading: Text(
                'Bussines : ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              title: FilterChip(
                label: Text(selectedBusiness?.name ?? ''),
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onSelected: (bool value) {
                  showBttonAlert(context);
                },
              ),
            ),

            Divider(
                indent: 16,
                endIndent: 16,
                color: Theme.of(context).backgroundColor,
                thickness: 1),
            SizedBox(
              height: 8,
            ),
            ListTile(
              leading: Text(
                'Service : ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              title: FilterChip(
                label: Text(selectedService?.name ?? ''),
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onSelected: (bool value) {
                  showBttonAlert(context);
                },
              ),
            ),

            Divider(
                indent: 16,
                endIndent: 16,
                color: Theme.of(context).backgroundColor,
                thickness: 1),
            SizedBox(
              height: 8,
            ),
            ListTile(
              leading: Text(
                'Location : ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              title: FilterChip(
                label: Text(selectedCity?.name ?? ''),
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onSelected: (bool value) {
                  showBttonAlert(context);
                },
              ),
            ),

            Divider(
                indent: 16,
                endIndent: 16,
                color: Theme.of(context).backgroundColor,
                thickness: 1),
            //select image
//          if (assets.isEmpty)
//            InkWell(
//              onTap: () {
//                selectAssets(
//                    PickMethod.cameraAndStay(maxAssetsCount: 10), context);
//              },
//              child: Padding(
//                padding: const EdgeInsets.all(10.0),
//                child: Container(
//                    height: 200,
//                    decoration: BoxDecoration(
//                        color: Theme.of(context).dialogBackgroundColor,
//                        borderRadius: BorderRadius.all(Radius.circular(12))),
//                    child: Padding(
//                      padding: const EdgeInsets.all(20.0),
//                      child: Center(
//                          child: Image.asset(
//                        ImageAsset.ADD_IMAGES,
//                        height: 70,
//                      )),
//                    )),
//              ),
//            )
//               if (assets.isNotEmpty)
//              SelectedAssetsListView(
//                assets: assets,
//                isDisplayingDetail: isDisplayingDetail,
//                onResult: onResult,
//                onRemoveAsset: removeAsset,
//                eeditedImages: imagesFile,
//                onResultAfterEdit: onResultAfterEdit,
//              ),

//            if(imagesAfterEdit.isNotEmpty)
//              ListView.builder(itemBuilder: (context, index) {
//                return Image.memory(imagesAfterEdit[index].image);
//              },itemCount: imagesAfterEdit.length,shrinkWrap: true,)
          ],
        ),
      ),
    );
  }

  @override
  Widget getAlert(BuildContext context) {
    throw UnimplementedError();
  }
  List<Widget> busChips(BuildContext context, Function refresh) {
    List<Widget> chips = [];
    for (int i = 0; i < business.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 10, right: 5),
        child: FilterChip(
          backgroundColor: Theme.of(context).primaryColorDark,
          label: Text(business[i].name ?? ''),
          labelStyle: TextStyle(color: Colors.white),
          selected: business[i].isSelected,
          selectedColor: Theme.of(context).primaryColor,
          onSelected: (bool value) {
            business.forEach((element) {
              element.isSelected = false;
              selectedBusiness?.isSelected = false;
            });
            business[i].isSelected = true;
            selectedBusiness = business[i];

            selectedService =  business[i].services?.first;
            business[i].services?.forEach((element) {
              element.isSelected = false;
            });
            business[i].services?.first.isSelected = true;

            selectedCity =  business[i].city?.first;
            business[i].city?.forEach((element) {
              element.isSelected = false;
            });
            business[i].city?.first.isSelected = true;
            refresh();
            screenState.refresh();
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }

  List<Widget> serviceChips(BuildContext context, Function refresh) {
    List<Widget> chips = [];
    for (int i = 0; i < selectedBusiness!.services!.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 10, right: 5),
        child: FilterChip(
          backgroundColor: Theme.of(context).primaryColorDark,
          label: Text(selectedBusiness!.services![i].name ?? ''),
          labelStyle: TextStyle(color: Colors.white),
          selected: selectedBusiness!.services![i].isSelected,
          selectedColor: Theme.of(context).primaryColor,
          onSelected: (bool value) {
            selectedBusiness!.services!.forEach((element) {
              element.isSelected = false;
              selectedService?.isSelected = false;
            });
            selectedBusiness!.services![i].isSelected = true;
            selectedService = selectedBusiness!.services![i];
            refresh();
            screenState.refresh();
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }

  List<Widget> cityChips(BuildContext context, Function refresh) {
    List<Widget> chips = [];
    for (int i = 0; i < selectedBusiness!.city!.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 10, right: 5),
        child: FilterChip(
          backgroundColor: Theme.of(context).primaryColorDark,
          label: Text(selectedBusiness!.city![i].name ?? ''),
          labelStyle: TextStyle(color: Colors.white),
          selected: selectedBusiness!.city![i].isSelected,
          selectedColor: Theme.of(context).primaryColor,
          onSelected: (bool value) {
            selectedBusiness!.city!.forEach((element) {
              element.isSelected = false;
              selectedCity?.isSelected = false;
            });
            selectedBusiness!.city![i].isSelected = true;
            selectedCity = selectedBusiness!.city![i];
            refresh();
            screenState.refresh();
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }

  Future<void> selectAssets(PickMethod model, BuildContext context) async {
    print('selecttteddd');
    final List<AssetEntity>? result = await model.method(context, assets);
    if (result != null) {
      assets = List<AssetEntity>.from(result);
      await Future.forEach(assets, (AssetEntity element) async {
        await element.file.then((value) {
          if (value != null) {
            print('pathhhhh ${value}');
            Uint8List bytes = value.readAsBytesSync();
            imagesFile.add(bytes);
          }
        });
      });
      imagesAfterEdit = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ImageEditor(
            images: imagesFile,
            allowGallery: true,
            allowMultiple: true,
          ),
        ),
      );
      imagesAfterEdit.forEach((element) async {
        int i =1 ;
        final tempDir = await getTemporaryDirectory();
        File file = await File('${tempDir.path}/image${i}.png').create();
        file.writeAsBytesSync(element.image);
        MultipartFile nn = await MultipartFile.fromBytes(File(file.path).readAsBytesSync(), filename: file.path.split("/").last);
        request.media.add(nn);
        i++;
      });
    }
    screenState.refresh();
  }

  void removeAsset(int index) {
    assets.removeAt(index);
    if (assets.isEmpty) {
      isDisplayingDetail.value = false;
    }
    screenState.refresh();
  }

  void onResult(List<AssetEntity>? result) {
    if (result != null && result != assets) {
      assets = List<AssetEntity>.from(result);
      print("lenghhhhtttt '${assets.length}");
      screenState.refresh();
    }
  }

  void onResultAfterEdit(List<ImageItem>? result) {
    if (result != null) {
      imagesAfterEdit = result;
//      imagesAfterEdit.forEach((element) async {
//        File mu = File.fromRawPath(element.image);
//        MultipartFile nn = await MultipartFile.fromFile(mu.path);
//        request.media.add(nn);
//      });
      screenState.refresh();
    }
  }

  showBttonAlert(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isDismissible: true,
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter mystate) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Theme.of(context).dialogBackgroundColor),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Select Busines',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Wrap(
                        children: busChips(context, () {
                          mystate(() {});
                        })),
                    Divider(
                      indent: 16,
                      endIndent: 16,
                      color: Theme.of(context).backgroundColor,
                      thickness: 2.5,
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Select Service',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Wrap(
                        children: serviceChips(context, () {
                      mystate(() {});
                    })),
                    Divider(
                      indent: 16,
                      endIndent: 16,
                      color: Theme.of(context).backgroundColor,
                      thickness: 2.5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Select City',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Wrap(
                        children: cityChips(context, () {
                      mystate(() {});
                    }))
                  ],
                ),
              ),
            );
          });
        });
  }
}
