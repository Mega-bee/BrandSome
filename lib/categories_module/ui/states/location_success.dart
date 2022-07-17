import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/setting_module/ui/widget/citiy_card.dart';
import 'package:brandsome/utils/components/costom_search.dart';
import 'package:flutter/material.dart';

import '../../reponse/add_location_response.dart';
import '../screen/add_location.dart';

class LocationSuccess extends States {
  List<AddLocationResponse>? loca;

  final AddLocationScreenState addLocationScreenState;

  LocationSuccess(this.loca, this.addLocationScreenState) : super(false);

  String? search;

  @override
  Widget getUI(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
centerTitle: true,
        title: Text('Select Location',  style: TextStyle(
          color: Theme.of(context).primaryColor,
        ),),
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 15),
            child: IconButton(
              onPressed: () {
                print(loca?.where((element) => element.value == true));
                Navigator.pop(context,
                    loca?.where((element) => element.value == true).toList());
              },
              icon: Icon(
                Icons.check,
                color: Theme.of(context).primaryColor,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: Column(children: getCitiesCard()),
      ),
    );
  }

  @override
  Widget getAlert(BuildContext context) {
    // TODO: implement getAlert
    throw UnimplementedError();
  }

  List<Widget> getCitiesCard() {
    List<Widget> widgets = [];
    if (loca == null) {
      return widgets;
    } else if (loca!.isEmpty) {
      return widgets;
    } else {
      for (var element in loca!) {
        if (element.name?.toLowerCase().contains(search ?? '') == false) {
          continue;
        }
        widgets.add(CityCard(city: element, onCheckClicked: () {}));
      }
      if (loca != null) {
        widgets.insert(
            0,
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 16),
              child: CustomSearch(
                hintText: 'Search for city',
                onChanged: (s) {
                  if (s == '' || s.isEmpty) {
                    search = null;
                    addLocationScreenState.refresh();
                  } else {
                    search = s;
                    addLocationScreenState.refresh();
                  }
                },
              ),
            ));
      }
    }
    widgets.add(const SizedBox(height: 75));
    return widgets;
  }
}
