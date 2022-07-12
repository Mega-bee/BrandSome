import 'package:brandsome/abstracts/states/state.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class LoadingState extends States {
  LoadingState() : super(false);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget getAlert(BuildContext context) {
    // TODO: implement getAlert
    throw UnimplementedError();
  }
}

class LoadingWaitingState extends States {
 final String msg;
  LoadingWaitingState(this.msg) : super(true);

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget getAlert(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Text(msg),
      content: SizedBox(
        height: 100,
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
