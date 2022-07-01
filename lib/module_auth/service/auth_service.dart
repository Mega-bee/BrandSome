import 'package:brandsome/hive/hive.dart';
import 'package:brandsome/module_auth/repository/auth_repository.dart';
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