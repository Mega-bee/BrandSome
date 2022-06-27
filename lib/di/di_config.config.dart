// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../business_module/business_module.dart' as _i25;
import '../business_module/repository/business_repository.dart' as _i11;
import '../business_module/state_manager/business_list_bloc.dart' as _i18;
import '../business_module/ui/screen/add_business.dart' as _i3;
import '../business_module/ui/screen/business_screen.dart' as _i19;
import '../business_module/ui/screen/searbarfilter_business_screen.dart' as _i8;
import '../follower_module/follower_module.dart' as _i28;
import '../follower_module/repository/follower_repository.dart' as _i13;
import '../follower_module/state_manager/follower.dart' as _i20;
import '../follower_module/ui/screens/follower_list.dart' as _i26;
import '../main.dart' as _i29;
import '../module_auth/authoriazation_module.dart' as _i17;
import '../module_auth/repository/auth_repository.dart' as _i10;
import '../module_auth/state_manager/request_otp_state_manager.dart' as _i12;
import '../module_auth/ui/screen/auth_screen.dart' as _i16;
import '../module_network/http_client/http_client.dart' as _i9;
import '../navigation_bar/navigator_module.dart' as _i7;
import '../navigation_bar/ui/screens/navigationBar.dart' as _i6;
import '../setting_module/repository/account_repository.dart' as _i15;
import '../setting_module/repository/setting_repository.dart' as _i14;
import '../setting_module/setting_module.dart' as _i27;
import '../setting_module/state_manager/account.dart' as _i23;
import '../setting_module/state_manager/setting.dart' as _i21;
import '../setting_module/ui/screen/setting_screen.dart' as _i22;
import '../setting_module/ui/widget/account_info.dart' as _i24;
import '../utils/logger/logger.dart' as _i5;
import '../utils/service/theme_serrvice/theme_service.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AddBusiness>(() => _i3.AddBusiness());
  gh.factory<_i4.AppThemeDataService>(() => _i4.AppThemeDataService());
  gh.factory<_i5.Logger>(() => _i5.Logger());
  gh.factory<_i6.NavigationScreen>(() => _i6.NavigationScreen());
  gh.factory<_i7.NavigatorModule>(
      () => _i7.NavigatorModule(get<_i6.NavigationScreen>()));
  gh.factory<_i8.SearchBarFilterBusinessScreen>(
      () => _i8.SearchBarFilterBusinessScreen());
  gh.factory<_i9.ApiClient>(() => _i9.ApiClient(get<_i5.Logger>()));
  gh.factory<_i10.AuthRepository>(
      () => _i10.AuthRepository(get<_i9.ApiClient>()));
  gh.factory<_i11.BusinessRepository>(
      () => _i11.BusinessRepository(get<_i9.ApiClient>()));
  gh.factory<_i12.RequestOtpStateManager>(
      () => _i12.RequestOtpStateManager(get<_i10.AuthRepository>()));
  gh.factory<_i13.SettingRepository>(
      () => _i13.SettingRepository(get<_i9.ApiClient>()));
  gh.factory<_i14.SettingRepository>(
      () => _i14.SettingRepository(get<_i9.ApiClient>()));
  gh.factory<_i15.AccountRepository>(
      () => _i15.AccountRepository(get<_i9.ApiClient>()));
  gh.factory<_i16.AuthScreen>(
      () => _i16.AuthScreen(get<_i12.RequestOtpStateManager>()));
  gh.factory<_i17.AuthorizationModule>(
      () => _i17.AuthorizationModule(get<_i16.AuthScreen>()));
  gh.factory<_i18.BusinessListCubit>(
      () => _i18.BusinessListCubit(get<_i11.BusinessRepository>()));
  gh.factory<_i19.BusinessScreen>(
      () => _i19.BusinessScreen(get<_i18.BusinessListCubit>()));
  gh.factory<_i20.FollowersCubit>(
      () => _i20.FollowersCubit(get<_i13.SettingRepository>()));
  gh.factory<_i21.SettingCubit>(
      () => _i21.SettingCubit(get<_i14.SettingRepository>()));
  gh.factory<_i22.SettingsScreen>(
      () => _i22.SettingsScreen(get<_i21.SettingCubit>()));
  gh.factory<_i23.AccountCubit>(
      () => _i23.AccountCubit(get<_i15.AccountRepository>()));
  gh.factory<_i24.AccountInfoScreen>(
      () => _i24.AccountInfoScreen(get<_i23.AccountCubit>()));
  gh.factory<_i25.BusinessModule>(() => _i25.BusinessModule(
      get<_i19.BusinessScreen>(),
      get<_i3.AddBusiness>(),
      get<_i8.SearchBarFilterBusinessScreen>()));
  gh.factory<_i26.Followers>(() => _i26.Followers(get<_i20.FollowersCubit>()));
  gh.factory<_i27.SettingModule>(() => _i27.SettingModule(
      get<_i22.SettingsScreen>(), get<_i24.AccountInfoScreen>()));
  gh.factory<_i28.FollowerModule>(
      () => _i28.FollowerModule(get<_i26.Followers>()));
  gh.factory<_i29.MyApp>(() => _i29.MyApp(
      get<_i4.AppThemeDataService>(),
      get<_i7.NavigatorModule>(),
      get<_i25.BusinessModule>(),
      get<_i27.SettingModule>(),
      get<_i28.FollowerModule>(),
      get<_i17.AuthorizationModule>()));
  return get;
}
