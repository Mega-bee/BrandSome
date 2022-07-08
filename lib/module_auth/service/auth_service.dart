import 'package:brandsome/hive/hive.dart';

import 'package:brandsome/module_auth/repository/auth_repository.dart';
import 'package:device_information/device_information.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';


@injectable
class AuthService {
  final AuthPrefsHelper _prefsHelper;
 final AuthRepository _authRepository;

  AuthService(this._prefsHelper, this._authRepository);

  bool get isLoggedIn => _prefsHelper.isSignedIn();

  setToken(String  token){
    _prefsHelper.setToken(token);
  }
  String? getToken( ){
   return _prefsHelper.getToken();
  }
}
@injectable
class ImeiService {
  String platformVersion = 'Unknown',
      imeiNo = "";

  var apiLevel;
  Future<String> initPlatformState() async {
    print('Hellllllo from herer');
    late String platformVersion,
        imeiNo = '';

    // Platform messages may fail,
    // so we use a try/catch PlatformException.
    try {
      platformVersion = await DeviceInformation.platformVersion;
      imeiNo = await DeviceInformation.deviceIMEINumber;
      print('IMIE');
      print(imeiNo);

    } on PlatformException catch (e) {
      platformVersion = '${e.message}';
      print(e.message);
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    return imeiNo;


  }


}