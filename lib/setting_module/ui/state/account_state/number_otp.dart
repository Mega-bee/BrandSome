import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/module_auth/request/otp_request.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../generated/l10n.dart';
import '../../../request/Phone_change.dart';
import '../../screen/account_info_screen.dart';

class NumberOtpState extends States {
  AccountInfoScreenState screenState;
  String? errorMessage;
  NumberOtpState(
      this.screenState,

      {String? phonenumber,this.errorMessage,this.countrycode}) : super(true);

  final phonenumber = TextEditingController();
  Country? countrycode;

  @override
  Widget getUI(BuildContext context) {
    return Center(child: Container(child: Text("Super is false"),));
  }


  @override
  Widget getAlert(BuildContext context) {
    return AlertDialog(
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
            child: Text(
              'Register account',
              style: TextStyle(
//                    color: blackColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [



                Text(
                  S.of(context).phoneNumber,
//                    style: TextStyle(color: greyColor, fontSize: 10),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
//                    style: TextStyle(color: hintText, fontSize: 15),
                  keyboardType: TextInputType.phone,
                  controller: phonenumber,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 5,
                        ),
                      ),
                      prefixIcon: TextButton(
                        onPressed: () {
                          showCountryPicker(
                            context: context,
                            //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
                            exclude: <String>['KN', 'MF'],
                            favorite: <String>['SE'],
                            //Optional. Shows phone code before the country name.
                            showPhoneCode: true,
                            onSelect: (Country country) {
                              countrycode = country;
                              screenState.refresh();
                              Text('Select country: ${country.displayName}');
                            },
                            // Optional. Sets the theme for the country list picker.
                            countryListTheme: CountryListThemeData(
                              // Optional. Sets the border radius for the bottomsheet.
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40.0),
                                topRight: Radius.circular(40.0),
                              ),
                              // Optional. Styles the search field.
                              inputDecoration: InputDecoration(
                                labelText: 'Search',
                                hintText: 'Start typing to search',
                                prefixIcon: const Icon(Icons.search),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: const Color(0xFF8C98A8)
                                        .withOpacity(0.2),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        child: countrycode == null
                            ? Wrap(children: [
                          Text(
                            "Country",
                            style: TextStyle(
                              color: Theme.of(context).brightness ==
                                  Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Icon(Icons.arrow_drop_down_outlined)
                        ])
                            : Text(
                          '+${countrycode!.phoneCode}',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                      hintText: S.of(context).enterYourPhoneNumber,
//                        hintStyle:
//                            TextStyle(fontSize: 12, color: darkWhiteColor),
                      contentPadding: EdgeInsetsDirectional.only(
                          top: 10, bottom: 10, start: 10)),
                ),
              ],
            ),
          ),


          errorMessage==null?
              Container():
          Text("${errorMessage}",style: TextStyle(color: Colors.red),),
          SizedBox(
            height: 30,
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              screenState.changeMobilenum(ChangenumberRequest(PhoneNumber:phonenumber.text,counrtyCode: countrycode!.phoneCode
                   ));
            },
            child: Text(
              S.of(context).Continue,
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                padding: EdgeInsets.fromLTRB(30, 12, 30, 12)),
          ),
        ],
      ),
    );
  }
}
