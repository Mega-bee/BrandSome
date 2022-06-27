import 'package:brandsome/abstracts/states/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoadingAlertState extends States{
  @override
  Widget getUI(BuildContext context) {
    return  AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Text('Loading'),
      content: CircularProgressIndicator(),
    );
  }

}