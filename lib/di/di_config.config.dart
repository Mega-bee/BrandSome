// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../business_module/business_module.dart' as _i18;
import '../business_module/repository/business_repository.dart' as _i10;
import '../business_module/state_manager/business_list_bloc.dart' as _i13;
import '../business_module/ui/screen/add_business.dart' as _i3;
import '../business_module/ui/screen/business_screen.dart' as _i14;
import '../business_module/ui/screen/searbarfilter_business_screen.dart' as _i8;
import '../follower_module/follower_module.dart' as _i21;
import '../follower_module/repository/follower_repository.dart' as _i12;
import '../follower_module/state_manager/follower.dart' as _i15;
import '../follower_module/ui/screens/follower_list.dart' as _i19;
import '../main.dart' as _i22;
import '../module_network/http_client/http_client.dart' as _i9;
import '../navigation_bar/navigator_module.dart' as _i7;
import '../navigation_bar/ui/screens/navigationBar.dart' as _i6;
import '../setting_module/repository/setting_repository.dart' as _i11;
import '../setting_module/setting_module.dart' as _i20;
import '../setting_module/state_manager/setting.dart' as _i16;
import '../setting_module/ui/screen/setting_screen.dart' as _i17;
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
  gh.factory<_i13.BusinessListCubit>(
      () => _i13.BusinessListCubit(get<_i10.BusinessRepository>()));
  gh.factory<_i14.BusinessScreen>(
      () => _i14.BusinessScreen(get<_i13.BusinessListCubit>()));
  gh.factory<_i15.FollowersCubit>(
      () => _i15.FollowersCubit(get<_i12.SettingRepository>()));
  gh.factory<_i16.SettingCubit>(
      () => _i16.SettingCubit(get<_i11.SettingRepository>()));
  gh.factory<_i17.SettingsScreen>(
      () => _i17.SettingsScreen(get<_i16.SettingCubit>()));
  gh.factory<_i18.BusinessModule>(() => _i18.BusinessModule(
      get<_i14.BusinessScreen>(),
      get<_i3.AddBusiness>(),
      get<_i8.SearchBarFilterBusinessScreen>()));
  gh.factory<_i19.Followers>(() => _i19.Followers(get<_i15.FollowersCubit>()));
  gh.factory<_i20.SettingModule>(
      () => _i20.SettingModule(get<_i17.SettingsScreen>()));
  gh.factory<_i21.FollowerModule>(
      () => _i21.FollowerModule(get<_i19.Followers>()));
  gh.factory<_i22.MyApp>(() => _i22.MyApp(
      get<_i4.AppThemeDataService>(),
      get<_i7.NavigatorModule>(),
      get<_i18.BusinessModule>(),
      get<_i20.SettingModule>(),
      get<_i21.FollowerModule>()));
  return get;
}
