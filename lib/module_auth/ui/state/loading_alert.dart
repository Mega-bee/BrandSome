import 'package:brandsome/abstracts/states/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoadingAlertState extends States{
  LoadingAlertState( ) : super(true);

  @override
  Widget getUI(BuildContext context) {
    return  Container();
  }
  @override
  Widget getAlert(BuildContext context) {
   return AlertDialog(
     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
     title: Text('Waiting to send otp'),
     content: SizedBox(
       height: 100,
       child: Column(
         children: [
           SizedBox(height: 5,),
           CircularProgressIndicator(),
         ],
       ),
     ),
   );
  }
}