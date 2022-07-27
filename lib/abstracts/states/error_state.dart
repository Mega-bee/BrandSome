import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:brandsome/abstracts/states/state.dart';
import 'package:flutter/material.dart';
class ErrorState extends States {
  final String errorMessage;
  final Function retry;

 ErrorState({required this.errorMessage,required this.retry}) : super(false);
  @override
  Widget getUI(BuildContext context) {
    final text=["$errorMessage !!",''];
    return  SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 90,
          ),
          Center(child: Image.asset("assets/images/cerror-removebg.png",height: 250,color: Theme.of(context).primaryColor,)),
          const SizedBox(
            height: 10,
          ),
          AnimatedTextKit(animatedTexts: [
            for(final txt in text)TyperAnimatedText(txt)

          ],
          repeatForever: true,
          ),

          const   SizedBox(
            height: 30,
          ),
          // RaisedButton(
          //     onPressed: () {
          //      retry();
          //     },
          //     child:const Text(
          //       'Retry',
          //       style: TextStyle(color: Colors.black),
          //     ),
          //     // color: AppColors.greenBasic,
          //     elevation: 5.0,
          //     shape:const RoundedRectangleBorder(
          //         borderRadius: BorderRadius.all(Radius.circular(20.0))))
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