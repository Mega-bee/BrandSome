// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../business_details_module/business_details_module.dart' as _i35;
import '../business_details_module/repository/business_repository.dart' as _i10;
import '../business_details_module/state_manager/business_details_state_manager.dart'
    as _i24;
import '../business_details_module/ui/screen/business_details.dart' as _i26;
import '../business_module/business_module.dart' as _i36;
import '../business_module/repository/business_repository.dart' as _i9;
import '../business_module/state_manager/add_business_bloc.dart' as _i20;
import '../business_module/state_manager/business_list_bloc.dart' as _i23;
import '../business_module/state_manager/get_category_list_bloc.dart' as _i12;
import '../business_module/ui/screen/add_business.dart' as _i34;
import '../business_module/ui/screen/business_screen.dart' as _i25;
import '../business_module/ui/screen/searbarfilter_business_screen.dart'
    as _i16;
import '../follower_module/follower_module.dart' as _i39;
import '../follower_module/repository/follower_repository.dart' as _i17;
import '../follower_module/state_manager/follower.dart' as _i27;
import '../follower_module/ui/screens/follower_list.dart' as _i37;
import '../home_page/repository/business_repository.dart' as _i11;
import '../liked_module/liked_list_module.dart' as _i29;
import '../liked_module/repository/likes_list_repository.dart' as _i13;
import '../liked_module/state_manager/liked_list_bloc.dart' as _i14;
import '../liked_module/ui/screen/liked_by_screen.dart' as _i28;
import '../main.dart' as _i40;
import '../module_auth/authoriazation_module.dart' as _i22;
import '../module_auth/repository/auth_repository.dart' as _i8;
import '../module_auth/state_manager/request_otp_state_manager.dart' as _i15;
import '../module_auth/ui/screen/auth_screen.dart' as _i21;
import '../module_network/http_client/http_client.dart' as _i7;
import '../navigation_bar/navigator_module.dart' as _i6;
import '../navigation_bar/ui/screens/navigationBar.dart' as _i5;
import '../setting_module/repository/account_repository.dart' as _i19;
import '../setting_module/repository/setting_repository.dart' as _i18;
import '../setting_module/setting_module.dart' as _i38;
import '../setting_module/state_manager/account_state_manager.dart' as _i32;
import '../setting_module/state_manager/setting.dart' as _i30;
import '../setting_module/ui/screen/account_info_screen.dart' as _i33;
import '../setting_module/ui/screen/setting_screen.dart' as _i31;
import '../utils/logger/logger.dart' as _i4;
import '../utils/service/theme_serrvice/theme_service.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AppThemeDataService>(() => _i3.AppThemeDataService());
  gh.factory<_i4.Logger>(() => _i4.Logger());
  gh.factory<_i5.NavigationScreen>(() => _i5.NavigationScreen());
  gh.factory<_i6.NavigatorModule>(
      () => _i6.NavigatorModule(get<_i5.NavigationScreen>()));
  gh.factory<_i7.ApiClient>(() => _i7.ApiClient(get<_i4.Logger>()));
  gh.factory<_i8.AuthRepository>(
      () => _i8.AuthRepository(get<_i7.ApiClient>()));
  gh.factory<_i9.BusinessRepository>(
      () => _i9.BusinessRepository(get<_i7.ApiClient>()));
  gh.factory<_i10.BusinessRepositoryDetails>(
      () => _i10.BusinessRepositoryDetails(get<_i7.ApiClient>()));
  gh.factory<_i11.FilterRepo>(() => _i11.FilterRepo(get<_i7.ApiClient>()));
  gh.factory<_i12.GetCategoryListCubit>(
      () => _i12.GetCategoryListCubit(get<_i9.BusinessRepository>()));
  gh.factory<_i13.LikedList>(() => _i13.LikedList(get<_i7.ApiClient>()));
  gh.factory<_i14.LikedListCubit>(
      () => _i14.LikedListCubit(get<_i13.LikedList>()));
  gh.factory<_i15.RequestOtpStateManager>(
      () => _i15.RequestOtpStateManager(get<_i8.AuthRepository>()));
  gh.factory<_i16.SearchBarFilterBusinessScreen>(() =>
      _i16.SearchBarFilterBusinessScreen(get<_i12.GetCategoryListCubit>()));
  gh.factory<_i17.SettingRepository>(
      () => _i17.SettingRepository(get<_i7.ApiClient>()));
  gh.factory<_i18.SettingRepository>(
      () => _i18.SettingRepository(get<_i7.ApiClient>()));
  gh.factory<_i19.AccountRepository>(
      () => _i19.AccountRepository(get<_i7.ApiClient>()));
  gh.factory<_i20.AddBusinessCubit>(
      () => _i20.AddBusinessCubit(get<_i9.BusinessRepository>()));
  gh.factory<_i21.AuthScreen>(
      () => _i21.AuthScreen(get<_i15.RequestOtpStateManager>()));
  gh.factory<_i22.AuthorizationModule>(
      () => _i22.AuthorizationModule(get<_i21.AuthScreen>()));
  gh.factory<_i23.BusinessListCubit>(
      () => _i23.BusinessListCubit(get<_i9.BusinessRepository>()));
  gh.factory<_i24.BusinessListDetailsCubit>(() =>
      _i24.BusinessListDetailsCubit(get<_i10.BusinessRepositoryDetails>()));
  gh.factory<_i25.BusinessScreen>(
      () => _i25.BusinessScreen(get<_i23.BusinessListCubit>()));
  gh.factory<_i26.BusnessDetailsScreen>(
      () => _i26.BusnessDetailsScreen(get<_i24.BusinessListDetailsCubit>()));
  gh.factory<_i27.FollowersCubit>(
      () => _i27.FollowersCubit(get<_i17.SettingRepository>()));
  gh.factory<_i28.LikeByScreen>(
      () => _i28.LikeByScreen(likedListCubit: get<_i14.LikedListCubit>()));
  gh.factory<_i29.LikedListModule>(
      () => _i29.LikedListModule(get<_i28.LikeByScreen>()));
  gh.factory<_i30.SettingCubit>(
      () => _i30.SettingCubit(get<_i18.SettingRepository>()));
  gh.factory<_i31.SettingsScreen>(
      () => _i31.SettingsScreen(get<_i30.SettingCubit>()));
  gh.factory<_i32.AccountCubit>(
      () => _i32.AccountCubit(get<_i19.AccountRepository>()));
  gh.factory<_i33.AccountInfoScreen>(
      () => _i33.AccountInfoScreen(get<_i32.AccountCubit>()));
  gh.factory<_i34.AddBusiness>(
      () => _i34.AddBusiness(get<_i20.AddBusinessCubit>()));
  gh.factory<_i35.BusinessDetailsModule>(
      () => _i35.BusinessDetailsModule(get<_i26.BusnessDetailsScreen>()));
  gh.factory<_i36.BusinessModule>(() => _i36.BusinessModule(
      get<_i25.BusinessScreen>(),
      get<_i34.AddBusiness>(),
      get<_i16.SearchBarFilterBusinessScreen>()));
  gh.factory<_i37.Followers>(() => _i37.Followers(get<_i27.FollowersCubit>()));
  gh.factory<_i38.SettingModule>(() => _i38.SettingModule(
      get<_i31.SettingsScreen>(), get<_i33.AccountInfoScreen>()));
  gh.factory<_i39.FollowerModule>(
      () => _i39.FollowerModule(get<_i37.Followers>()));
  gh.factory<_i40.MyApp>(() => _i40.MyApp(
      get<_i3.AppThemeDataService>(),
      get<_i6.NavigatorModule>(),
      get<_i36.BusinessModule>(),
      get<_i35.BusinessDetailsModule>(),
      get<_i29.LikedListModule>(),
      get<_i38.SettingModule>(),
      get<_i39.FollowerModule>(),
      get<_i22.AuthorizationModule>()));
  return get;
}
