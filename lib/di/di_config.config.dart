// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../business_details_module/business_details_module.dart' as _i43;
import '../business_details_module/repository/business_repository.dart' as _i12;
import '../business_details_module/state_manager/business_details_state_manager.dart'
    as _i25;
import '../business_details_module/ui/screen/business_details.dart' as _i27;
import '../business_details_module/ui/screen/update_business.dart' as _i38;
import '../business_module/business_module.dart' as _i44;
import '../business_module/repository/business_repository.dart' as _i11;
import '../business_module/state_manager/add_business_bloc.dart' as _i23;
import '../business_module/state_manager/business_list_bloc.dart' as _i24;
import '../business_module/ui/screen/add_business.dart' as _i41;
import '../business_module/ui/screen/business_screen.dart' as _i26;
import '../categories_module/categories_module.dart' as _i30;
import '../categories_module/repository/category_repository.dart' as _i13;
import '../categories_module/state_manager/cate_stats_manager.dart' as _i28;
import '../categories_module/ui/screen/categories_list_screen.dart' as _i29;
import '../follower_module/follower_module.dart' as _i45;
import '../follower_module/repository/follower_repository.dart' as _i15;
import '../follower_module/state_manager/follower.dart' as _i16;
import '../follower_module/ui/screens/follower_list.dart' as _i31;
import '../hive/hive.dart' as _i4;
import '../home_page/home_module.dart' as _i46;
import '../home_page/repository/business_repository.dart' as _i14;
import '../home_page/state_manager/home_page_state_manager.dart' as _i17;
import '../home_page/ui/screen/homePage.dart' as _i32;
import '../liked_module/liked_list_module.dart' as _i34;
import '../liked_module/repository/likes_list_repository.dart' as _i18;
import '../liked_module/state_manager/liked_list_bloc.dart' as _i19;
import '../liked_module/ui/screen/liked_by_screen.dart' as _i33;
import '../main.dart' as _i48;
import '../module_auth/repository/auth_repository.dart' as _i9;
import '../module_auth/service/auth_service.dart' as _i10;
import '../module_network/http_client/http_client.dart' as _i8;
import '../navigation_bar/navigator_module.dart' as _i7;
import '../navigation_bar/ui/screens/navigationBar.dart' as _i6;
import '../setting_module/repository/account_repository.dart' as _i22;
import '../setting_module/repository/location_repository.dart' as _i20;
import '../setting_module/repository/setting_repository.dart' as _i21;
import '../setting_module/setting_module.dart' as _i47;
import '../setting_module/state_manager/account_state_manager.dart' as _i39;
import '../setting_module/state_manager/location_state_manager.dart' as _i35;
import '../setting_module/state_manager/setting.dart' as _i36;
import '../setting_module/ui/screen/account_info_screen.dart' as _i40;
import '../setting_module/ui/screen/add_location.dart' as _i42;
import '../setting_module/ui/screen/setting_screen.dart' as _i37;
import '../utils/logger/logger.dart' as _i5;
import '../utils/service/theme_serrvice/theme_service.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AppThemeDataService>(() => _i3.AppThemeDataService());
  gh.factory<_i4.AuthPrefsHelper>(() => _i4.AuthPrefsHelper());
  gh.factory<_i5.Logger>(() => _i5.Logger());
  gh.factory<_i6.NavigationScreen>(() => _i6.NavigationScreen());
  gh.factory<_i7.NavigatorModule>(
      () => _i7.NavigatorModule(get<_i6.NavigationScreen>()));
  gh.factory<_i8.ApiClient>(() => _i8.ApiClient(get<_i5.Logger>()));
  gh.factory<_i9.AuthRepository>(
      () => _i9.AuthRepository(get<_i8.ApiClient>()));
  gh.factory<_i10.AuthService>(() =>
      _i10.AuthService(get<_i4.AuthPrefsHelper>(), get<_i9.AuthRepository>()));
  gh.factory<_i11.BusinessRepository>(() =>
      _i11.BusinessRepository(get<_i8.ApiClient>(), get<_i10.AuthService>()));
  gh.factory<_i12.BusinessRepositoryDetails>(() =>
      _i12.BusinessRepositoryDetails(
          get<_i8.ApiClient>(), get<_i10.AuthService>()));
  gh.factory<_i13.CategoryRepository>(() =>
      _i13.CategoryRepository(get<_i8.ApiClient>(), get<_i10.AuthService>()));
  gh.factory<_i14.FilterRepo>(() => _i14.FilterRepo(get<_i8.ApiClient>()));
  gh.factory<_i15.FollowerRepository>(() =>
      _i15.FollowerRepository(get<_i8.ApiClient>(), get<_i10.AuthService>()));
  gh.factory<_i16.FollowersCubit>(
      () => _i16.FollowersCubit(get<_i15.FollowerRepository>()));
  gh.factory<_i17.HomePageCubit>(() =>
      _i17.HomePageCubit(get<_i10.AuthService>(), get<_i9.AuthRepository>()));
  gh.factory<_i18.LikedList>(
      () => _i18.LikedList(get<_i8.ApiClient>(), get<_i10.AuthService>()));
  gh.factory<_i19.LikedListCubit>(
      () => _i19.LikedListCubit(get<_i18.LikedList>()));
  gh.factory<_i20.LocationRepository>(
      () => _i20.LocationRepository(get<_i8.ApiClient>()));
  gh.factory<_i21.SettingRepository>(() =>
      _i21.SettingRepository(get<_i8.ApiClient>(), get<_i10.AuthService>()));
  gh.factory<_i22.AccountRepository>(() =>
      _i22.AccountRepository(get<_i8.ApiClient>(), get<_i10.AuthService>()));
  gh.factory<_i23.AddBusinessCubit>(
      () => _i23.AddBusinessCubit(get<_i11.BusinessRepository>()));
  gh.factory<_i24.BusinessListCubit>(
      () => _i24.BusinessListCubit(get<_i11.BusinessRepository>()));
  gh.factory<_i25.BusinessListDetailsCubit>(() => _i25.BusinessListDetailsCubit(
      get<_i12.BusinessRepositoryDetails>(),
      get<_i9.AuthRepository>(),
      get<_i10.AuthService>()));
  gh.factory<_i26.BusinessScreen>(
      () => _i26.BusinessScreen(get<_i24.BusinessListCubit>()));
  gh.factory<_i27.BusnessDetailsScreen>(
      () => _i27.BusnessDetailsScreen(get<_i25.BusinessListDetailsCubit>()));
  gh.factory<_i28.CategoryListCubit>(
      () => _i28.CategoryListCubit(get<_i13.CategoryRepository>()));
  gh.factory<_i29.CategoryListScreen>(
      () => _i29.CategoryListScreen(get<_i28.CategoryListCubit>()));
  gh.factory<_i30.CategoryModule>(
      () => _i30.CategoryModule(get<_i29.CategoryListScreen>()));
  gh.factory<_i31.Followers>(() => _i31.Followers(get<_i16.FollowersCubit>()));
  gh.factory<_i32.HomePage>(
      () => _i32.HomePage(cubit: get<_i17.HomePageCubit>()));
  gh.factory<_i33.LikeByScreen>(
      () => _i33.LikeByScreen(likedListCubit: get<_i19.LikedListCubit>()));
  gh.factory<_i34.LikedListModule>(
      () => _i34.LikedListModule(get<_i33.LikeByScreen>()));
  gh.factory<_i35.LocationCubit>(
      () => _i35.LocationCubit(get<_i20.LocationRepository>()));
  gh.factory<_i36.SettingCubit>(() => _i36.SettingCubit(
      get<_i21.SettingRepository>(),
      get<_i10.AuthService>(),
      get<_i9.AuthRepository>()));
  gh.factory<_i37.SettingsScreen>(
      () => _i37.SettingsScreen(get<_i36.SettingCubit>()));
  gh.factory<_i38.UpdateBusiness>(
      () => _i38.UpdateBusiness(get<_i25.BusinessListDetailsCubit>()));
  gh.factory<_i39.AccountCubit>(() => _i39.AccountCubit(
      get<_i22.AccountRepository>(), get<_i10.AuthService>()));
  gh.factory<_i40.AccountInfoScreen>(
      () => _i40.AccountInfoScreen(get<_i39.AccountCubit>()));
  gh.factory<_i41.AddBusiness>(
      () => _i41.AddBusiness(get<_i23.AddBusinessCubit>()));
  gh.factory<_i42.AddLocationScreen>(
      () => _i42.AddLocationScreen(get<_i35.LocationCubit>()));
  gh.factory<_i43.BusinessDetailsModule>(() => _i43.BusinessDetailsModule(
      get<_i27.BusnessDetailsScreen>(), get<_i38.UpdateBusiness>()));
  gh.factory<_i44.BusinessModule>(() => _i44.BusinessModule(
      get<_i26.BusinessScreen>(),
      get<_i41.AddBusiness>(),
      get<_i42.AddLocationScreen>()));
  gh.factory<_i45.FollowerModule>(
      () => _i45.FollowerModule(get<_i31.Followers>()));
  gh.factory<_i46.HomeModule>(() => _i46.HomeModule(get<_i32.HomePage>()));
  gh.factory<_i47.SettingModule>(() => _i47.SettingModule(
      get<_i37.SettingsScreen>(), get<_i40.AccountInfoScreen>()));
  gh.factory<_i48.MyApp>(() => _i48.MyApp(
      get<_i3.AppThemeDataService>(),
      get<_i7.NavigatorModule>(),
      get<_i44.BusinessModule>(),
      get<_i43.BusinessDetailsModule>(),
      get<_i34.LikedListModule>(),
      get<_i47.SettingModule>(),
      get<_i45.FollowerModule>(),
      get<_i30.CategoryModule>(),
      get<_i46.HomeModule>()));
  return get;
}
