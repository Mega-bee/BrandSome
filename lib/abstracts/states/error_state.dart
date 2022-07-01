import 'package:brandsome/abstracts/states/state.dart';
import 'package:flutter/material.dart';
class ErrorState extends States {
  final String errorMessage;
  final Function retry;
 ErrorState({required this.errorMessage,required this.retry}) : super(false);
  @override
  Widget getUI(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/wifi.png"),
          const SizedBox(
            height: 15,
          ),
          Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
          const   SizedBox(
            height: 30,
          ),
          RaisedButton(
              onPressed: () {
               retry();
              },
              child:const Text(
                'Retry',
                style: TextStyle(color: Colors.black),
              ),
              // color: AppColors.greenBasic,
              elevation: 5.0,
              shape:const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))))
        ],
      ),
    );
  }

  @override
  Widget getAlert(BuildContext context) {
    // TODO: implement getAlert
    throw UnimplementedError();
  }
}