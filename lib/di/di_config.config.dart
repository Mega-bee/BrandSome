// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../business_module/business_module.dart' as _i22;
import '../business_module/repository/business_repository.dart' as _i10;
import '../business_module/state_manager/business_list_bloc.dart' as _i14;
import '../business_module/ui/screen/add_business.dart' as _i3;
import '../business_module/ui/screen/business_screen.dart' as _i15;
import '../business_module/ui/screen/searbarfilter_business_screen.dart' as _i8;
import '../follower_module/follower_module.dart' as _i25;
import '../follower_module/repository/follower_repository.dart' as _i12;
import '../follower_module/state_manager/follower.dart' as _i16;
import '../follower_module/ui/screens/follower_list.dart' as _i23;
import '../main.dart' as _i26;
import '../module_network/http_client/http_client.dart' as _i9;
import '../navigation_bar/navigator_module.dart' as _i7;
import '../navigation_bar/ui/screens/navigationBar.dart' as _i6;
import '../setting_module/account_module.dart' as _i21;
import '../setting_module/repository/account_repository.dart' as _i13;
import '../setting_module/repository/setting_repository.dart' as _i11;
import '../setting_module/setting_module.dart' as _i24;
import '../setting_module/state_manager/account.dart' as _i19;
import '../setting_module/state_manager/setting.dart' as _i17;
import '../setting_module/ui/screen/setting_screen.dart' as _i18;
import '../setting_module/ui/widget/account_info.dart' as _i20;
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
  gh.factory<_i10.BusinessRepository>(
      () => _i10.BusinessRepository(get<_i9.ApiClient>()));
  gh.factory<_i11.SettingRepository>(
      () => _i11.SettingRepository(get<_i9.ApiClient>()));
  gh.factory<_i12.SettingRepository>(
      () => _i12.SettingRepository(get<_i9.ApiClient>()));
  gh.factory<_i13.AccountRepository>(
      () => _i13.AccountRepository(get<_i9.ApiClient>()));
  gh.factory<_i14.BusinessListCubit>(
      () => _i14.BusinessListCubit(get<_i10.BusinessRepository>()));
  gh.factory<_i15.BusinessScreen>(
      () => _i15.BusinessScreen(get<_i14.BusinessListCubit>()));
  gh.factory<_i16.FollowersCubit>(
      () => _i16.FollowersCubit(get<_i12.SettingRepository>()));
  gh.factory<_i17.SettingCubit>(
      () => _i17.SettingCubit(get<_i11.SettingRepository>()));
  gh.factory<_i18.SettingsScreen>(
      () => _i18.SettingsScreen(get<_i17.SettingCubit>()));
  gh.factory<_i19.AccountCubit>(
      () => _i19.AccountCubit(get<_i13.AccountRepository>()));
  gh.factory<_i20.AccountInfoScreen>(
      () => _i20.AccountInfoScreen(get<_i19.AccountCubit>()));
  gh.factory<_i21.AccountModule>(
      () => _i21.AccountModule(get<_i20.AccountInfoScreen>()));
  gh.factory<_i22.BusinessModule>(() => _i22.BusinessModule(
      get<_i15.BusinessScreen>(),
      get<_i3.AddBusiness>(),
      get<_i8.SearchBarFilterBusinessScreen>()));
  gh.factory<_i23.Followers>(() => _i23.Followers(get<_i16.FollowersCubit>()));
  gh.factory<_i24.SettingModule>(
      () => _i24.SettingModule(get<_i18.SettingsScreen>()));
  gh.factory<_i25.FollowerModule>(
      () => _i25.FollowerModule(get<_i23.Followers>()));
  gh.factory<_i26.MyApp>(() => _i26.MyApp(
      get<_i4.AppThemeDataService>(),
      get<_i7.NavigatorModule>(),
      get<_i22.BusinessModule>(),
      get<_i24.SettingModule>(),
      get<_i21.AccountModule>(),
      get<_i25.FollowerModule>()));
  return get;
}
