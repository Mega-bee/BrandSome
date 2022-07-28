import 'package:brandsome/business_details_module/reponse/business_detailes_response.dart';
import 'package:brandsome/test_select_Image/picker_method.dart';
import 'package:brandsome/test_select_Image/widgets/selected_assets_list_view.dart';
import 'package:brandsome/utils/images/images.dart';
import 'package:flutter/material.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';
import '../../../abstracts/states/state.dart';
import '../screen/createPost.dart';

class CreatePostInit extends States {
  final CreatePostScreenState screenState;
  final List<Services> services;
  final List<City> cities;

  CreatePostInit(
      {required this.services, required this.cities, required this.screenState})
      : super(false){
   selectedCity = cities.first;
   selectedCity?.isSelected= true;
   selectedService = services.first;
   selectedService?.isSelected = true;
  }

  final description = TextEditingController();
  City? selectedCity;
  Services? selectedService;
  List<AssetEntity> assets = <AssetEntity>[];
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
            onPressed: () {},
            icon: Icon(
              Icons.check,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: ListTile(
              title: Text('Tannn'),
              subtitle: Row(
                children: [
                  FilterChip(
                    avatar: Icon(Icons.category),
                    label: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(selectedService?.name ?? ''),
                    ),
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onSelected: (bool value) {
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          isDismissible: true,
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(builder:
                                (BuildContext context, StateSetter mystate) {
                              return Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Theme.of(context)
                                        .dialogBackgroundColor),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Select Service',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Row(
                                          children: techChips(context, () {
                                        mystate(() {});
                                      })),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Select City',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Row(
                                          children: cityChips(context, () {
                                        mystate(() {});
                                      }))
                                    ],
                                  ),
                                ),
                              );
                            });
                          });
                    },
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  FilterChip(
                    avatar: Icon(Icons.location_on),
                    label: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(selectedCity?.name ?? ''),
                    ),
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onSelected: (bool value) {
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          isDismissible: true,
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(builder:
                                (BuildContext context, StateSetter mystate) {
                              return Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Theme.of(context)
                                        .dialogBackgroundColor),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Select Service',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Row(
                                          children: techChips(context, () {
                                            mystate(() {});
                                          })),
                                      Divider(
                                        indent: 16,
                                        endIndent: 16,
                                        color: Theme.of(context)
                                            .backgroundColor,
                                        thickness: 2.5,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Select City',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Row(
                                          children: cityChips(context, () {
                                            mystate(() {});
                                          }))
                                    ],
                                  ),
                                ),
                              );
                            });
                          });
                    },
                  ),
                ],
              ),
              leading: CircleAvatar(
                  backgroundImage: AssetImage(ImageAsset.TEST_IMAGE)),

            ),
          ),
          Divider(
            indent: 16,
            endIndent: 16,
            color: Theme.of(context)
                .backgroundColor,
            thickness: 2.5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
//            expands: true,
              controller: description,
                keyboardType: TextInputType.multiline,
                minLines: 1,//Normal textInputField will be displayed
                maxLines: 5,// when user presses enter it will adapt to it
                maxLength: 150,
                decoration:  InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                    hintText: "Write caption"),
              ),
            ),
          ),
          InkWell(
            onTap: (){
              selectAssets(PickMethod.cameraAndStay(maxAssetsCount: 10),context);
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                      color: Theme.of(context).dialogBackgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(12))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(child: Image.asset(ImageAsset.ADD_IMAGES , height: 70,)),
                  )),
            ),
          ),
          if (assets.isNotEmpty)
            SelectedAssetsListView(
              assets: assets,
              isDisplayingDetail: isDisplayingDetail,
              onResult: onResult,
              onRemoveAsset: removeAsset,
            ),
        ],
      ),
    );
  }

  @override
  Widget getAlert(BuildContext context) {
    throw UnimplementedError();
  }

  List<Widget> techChips(BuildContext context, Function refresh) {
    List<Widget> chips = [];
    for (int i = 0; i < services.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 10, right: 5),
        child: FilterChip(
          backgroundColor: Theme.of(context).primaryColorDark,
          label: Text(services[i].name ?? ''),
          labelStyle: TextStyle(color: Colors.white),
          selected: services[i].isSelected,
          selectedColor: Theme.of(context).primaryColor,
          onSelected: (bool value) {
            services.forEach((element) {
              element.isSelected = false;
              selectedService?.isSelected = false;
            });
            services[i].isSelected = true;
            selectedService = services[i];
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
    for (int i = 0; i < cities.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 10, right: 5),
        child: FilterChip(
          backgroundColor: Theme.of(context).primaryColorDark,
          label: Text(cities[i].name ?? ''),
          labelStyle: TextStyle(color: Colors.white),
          selected: cities[i].isSelected,
          selectedColor: Theme.of(context).primaryColor,
          onSelected: (bool value) {
            cities.forEach((element) {
              element.isSelected = false;
              selectedCity?.isSelected = false;
            });
            cities[i].isSelected = true;
            selectedCity = cities[i];
            refresh();
            screenState.refresh();
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }


  Future<void> selectAssets(PickMethod model,BuildContext context) async {

    final List<AssetEntity>? result = await model.method(context, assets);
    if (result != null) {
      assets = List<AssetEntity>.from(result);
      screenState.refresh();
    }
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
}
