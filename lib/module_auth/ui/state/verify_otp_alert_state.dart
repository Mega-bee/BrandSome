import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/module_auth/request/otp_request.dart';
import 'package:flutter/material.dart';

class VerifyOtpState extends States{
  dynamic screenState;
  String? phoneNumber;
  String? errorMessage;

  VerifyOtpState({required this.phoneNumber ,required this.screenState ,this.errorMessage}): super(true);

  final otpController = TextEditingController();


  @override
  Widget getUI(BuildContext    context) {
    return Container();
  }

  @override
  Widget getAlert(BuildContext context) {
   return  AlertDialog(
     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
     title: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Align(
           alignment: Alignment.centerRight,
           child: InkWell(
             onTap: () {
               Navigator.pop(context);
             },
             child: Icon(
               Icons.cancel,
               color: Theme.of(context).primaryColor,
             ),
           ),
         ),
         Container(
           child: const Text(
             'Verify Otp',
             style: TextStyle(
                 fontSize: 14,
                 fontWeight: FontWeight.bold,
                 fontFamily: "BerlinSansFB"),
             textAlign: TextAlign.center,
           ),
         ),
       ],
     ),
     content: Column(
       mainAxisSize: MainAxisSize.min,
       children: [
         RichText(
           text: TextSpan(
             children: <TextSpan>[
               const TextSpan(
                   text: 'Enter the OTP you received to\n',
//                    style: TextStyle(color: darkWhiteColor, fontSize: 17),
                   children: [
                     WidgetSpan(
                       child: SizedBox(
                         height: 30,
                       ),
                     ),
                   ]),
               TextSpan(
                 text: '+961 $phoneNumber',
//                  style: TextStyle(color: blackColor, fontSize: 17),
               )
             ],
           ),
         ),
         const SizedBox(
           height: 30,
         ),
         Center(
             child: Container(
               child: TextField(
                 controller: otpController,
                 maxLength: 4,
                 keyboardType: TextInputType.phone,
                 textAlign: TextAlign.center,
                 decoration: InputDecoration(
                     border: OutlineInputBorder(
                       borderSide: BorderSide(
                         color: Theme.of(context).primaryColor,
                         width: 5,
                       ),
                     ),
                     hintText: 'Enter Otp',
//                        hintStyle:
//                            TextStyle(fontSize: 12, color: darkWhiteColor),
                     contentPadding: const EdgeInsetsDirectional.only(
                         top: 10, bottom: 10, start: 10)),
               ),
             )),
         const SizedBox(
           height: 30,
         ),
         Text(errorMessage?? '',style: const TextStyle(color: Colors.red),),

         ElevatedButton(
           onPressed: () {
             Navigator.pop(context);
             screenState.verifyOtp(VerifyOtpRequest(number: phoneNumber,otp:otpController.text ));
           },
           child: const Text("Verify",style: TextStyle(color: Colors.white),),
           style: ElevatedButton.styleFrom(
               primary: Theme.of(context).primaryColor,
               padding: const EdgeInsets.fromLTRB(30, 12, 30, 12)),
         ),
       ],
     ),
   );
  }
}