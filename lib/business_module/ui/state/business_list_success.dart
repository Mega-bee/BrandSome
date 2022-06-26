import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/business_module/reponse/business_response.dart';
import 'package:brandsome/business_module/ui/widget/business_card.dart';
import 'package:flutter/material.dart';

class BusinessListSuccess extends States {
  final List<BusinessResponse> business;
  BusinessListSuccess({required this.business});

  @override
  Widget getUI(BuildContext context) {
    return  ListView.builder(
        physics:const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        itemCount: business.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              BusinessCard(
                business[index],
              ),
            ],
          );
        });
  }
}
