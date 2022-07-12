import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/business_module/reponse/business_response.dart';
import 'package:brandsome/business_module/request/bussines_filter_request.dart';
import 'package:brandsome/business_module/ui/screen/business_screen.dart';
import 'package:brandsome/business_module/ui/widget/business_card.dart';
import 'package:flutter/material.dart';

class BusinessListSuccess extends States {
  final List<BusinessResponse> business;
  final BusinessScreenState _screenState;
  BusinessListSuccess(this._screenState, {required this.business}) : super(false);

  @override
  Widget getUI(BuildContext context) {
    return  RefreshIndicator(
      onRefresh: ()async{
        _screenState.request =  BusinessFilterRequest(services: []);
        _screenState.query='';
        _screenState.returnServiceName=null;
        _screenState.getBusiness();
      },
      child: ListView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children:getBussCard() ,
      ),
    );
  }
  List<Widget> getBussCard() {
    List<Widget> widgets = [];
    if (business == null) {
      return widgets;
    } else if (business.isEmpty) {
      return widgets;
    } else {
      for (var element in business ) {
        if (element.name?.toLowerCase().contains(_screenState.query ?? '') == false) {
          continue;
        }
        widgets.add(BusinessCard(element));
      }
    }
    widgets.add(SizedBox(height: 30));
    return widgets;
  }
  @override
  Widget getAlert(BuildContext context) {
    // TODO: implement getAlert
    throw UnimplementedError();
  }
}
