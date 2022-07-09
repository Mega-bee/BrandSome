import 'package:brandsome/hive/hive.dart';

import 'package:brandsome/module_auth/repository/auth_repository.dart';
import 'package:device_information/device_information.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import 'package:permission_handler/permission_handler.dart';

@injectable
class AuthService {
  final AuthPrefsHelper _prefsHelper;
  final AuthRepository _authRepository;

  AuthService(this._prefsHelper, this._authRepository);

  bool get isLoggedIn => _prefsHelper.isSignedIn();

  setToken(String token) {
    _prefsHelper.setToken(token);
  }

  String? getToken() {
    return _prefsHelper.getToken();
  }
}

@injectable
class ImeiService {
  String imeiNo = "";

  Future<String> initPlatformState() async {

   await askPermission().then((value) async {
      if (value != null && value) {
        try {
//      platformVersion = await DeviceInformation.platformVersion;
          imeiNo = await DeviceInformation.deviceIMEINumber;
          print('IMIE');
          print(imeiNo);
        } on PlatformException catch (e) {
//      platformVersion = '${e.message}';
          print(e.message);
        }
      }
    });

    print('Hellllllo from herer');
    print(imeiNo);
    return imeiNo;
  }

  Future<bool?> askPermission() async{
    PermissionStatus status = await Permission.phone.request();
    if(status.isDenied == true)
    {
      askPermission();
    }
    else
    {
      return true;
    }
  }


}
