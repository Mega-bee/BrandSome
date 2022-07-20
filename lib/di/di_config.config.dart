// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../business_details_module/business_details_module.dart' as _i46;
import '../business_details_module/repository/business__detailes_repository.dart'
    as _i14;
import '../business_details_module/state_manager/business_details_state_manager.dart'
    as _i28;
import '../business_details_module/ui/screen/business_details.dart' as _i30;
import '../business_details_module/ui/screen/update_business.dart' as _i42;
import '../business_module/business_module.dart' as _i47;
import '../business_module/repository/business_repository.dart' as _i13;
import '../business_module/state_manager/add_business_bloc.dart' as _i25;
import '../business_module/state_manager/business_list_bloc.dart' as _i27;
import '../business_module/ui/screen/add_business.dart' as _i45;
import '../business_module/ui/screen/business_screen.dart' as _i29;
import '../categories_module/categories_module.dart' as _i32;
import '../categories_module/state_manager/location_state_manager.dart' as _i18;
import '../categories_module/ui/screen/add_location.dart' as _i26;
import '../categories_module/ui/screen/categories_list_screen.dart' as _i31;
import '../follower_module/follower_module.dart' as _i48;
import '../follower_module/repository/follower_repository.dart' as _i16;
import '../follower_module/state_manager/follower.dart' as _i17;
import '../follower_module/ui/screens/follower_list.dart' as _i35;
import '../hive/hive.dart' as _i4;
import '../home_page/home_module.dart' as _i49;
import '../home_page/repository/home_repository.dart' as _i19;
import '../home_page/state_manager/home_page_state_manager.dart' as _i20;
import '../home_page/ui/screen/homePage.dart' as _i36;
import '../liked_module/liked_list_module.dart' as _i38;
import '../liked_module/repository/likes_list_repository.dart' as _i21;
import '../liked_module/state_manager/liked_list_bloc.dart' as _i22;
import '../liked_module/ui/screen/liked_by_screen.dart' as _i37;
import '../localization_service/localizationSservice.dart' as _i7;
import '../main.dart' as _i51;
import '../module_auth/repository/auth_repository.dart' as _i12;
import '../module_auth/service/auth_service.dart' as _i5;
import '../module_network/http_client/http_client.dart' as _i11;
import '../navigation_bar/navigator_module.dart' as _i10;
import '../navigation_bar/ui/screens/navigationBar.dart' as _i9;
import '../posts_module/post_module.dart' as _i39;
import '../posts_module/repository/create_post_repo.dart' as _i15;
import '../posts_module/state_manager/create_post_state_manager.dart' as _i33;
import '../posts_module/ui/screen/createPost.dart' as _i34;
import '../setting_module/repository/account_repository.dart' as _i24;
import '../setting_module/repository/setting_repository.dart' as _i23;
import '../setting_module/setting_module.dart' as _i50;
import '../setting_module/state_manager/account_state_manager.dart' as _i43;
import '../setting_module/state_manager/setting.dart' as _i40;
import '../setting_module/ui/screen/account_info_screen.dart' as _i44;
import '../setting_module/ui/screen/setting_screen.dart' as _i41;
import '../utils/global/global_state_manager.dart' as _i6;
import '../utils/logger/logger.dart' as _i8;
import '../utils/service/theme_serrvice/theme_service.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AppThemeDataService>(() => _i3.AppThemeDataService());
  gh.factory<_i4.AuthPrefsHelper>(() => _i4.AuthPrefsHelper());
  gh.factory<_i5.AuthService>(
      () => _i5.AuthService(get<_i4.AuthPrefsHelper>()));
  gh.factory<_i4.GeneralDataHelper>(() => _i4.GeneralDataHelper());
  gh.singleton<_i6.GlobalStateManager>(_i6.GlobalStateManager());
  gh.factory<_i5.ImeiService>(() => _i5.ImeiService());
  gh.factory<_i7.LocalizationService>(() => _i7.LocalizationService());
  gh.factory<_i8.Logger>(() => _i8.Logger());
  gh.factory<_i9.NavigationScreen>(() => _i9.NavigationScreen());
  gh.factory<_i10.NavigatorModule>(
      () => _i10.NavigatorModule(get<_i9.NavigationScreen>()));
  gh.factory<_i11.ApiClient>(() => _i11.ApiClient(get<_i8.Logger>()));
  gh.factory<_i12.AuthRepository>(
      () => _i12.AuthRepository(get<_i11.ApiClient>(), get<_i5.AuthService>()));
  gh.factory<_i13.BusinessRepository>(() =>
      _i13.BusinessRepository(get<_i11.ApiClient>(), get<_i5.AuthService>()));
  gh.factory<_i14.BusinessRepositoryDetails>(() =>
      _i14.BusinessRepositoryDetails(get<_i11.ApiClient>(),
          get<_i5.AuthService>(), get<_i5.ImeiService>()));
  gh.factory<_i15.CreatePostRepo>(
      () => _i15.CreatePostRepo(get<_i11.ApiClient>(), get<_i5.AuthService>()));
  gh.factory<_i16.FollowerRepository>(() =>
      _i16.FollowerRepository(get<_i11.ApiClient>(), get<_i5.AuthService>()));
  gh.factory<_i17.FollowersCubit>(
      () => _i17.FollowersCubit(get<_i16.FollowerRepository>()));
  gh.factory<_i18.GeneralDataCubit>(
      () => _i18.GeneralDataCubit(get<_i4.GeneralDataHelper>()));
  gh.factory<_i19.HomeP>(
      () => _i19.HomeP(get<_i11.ApiClient>(), get<_i5.AuthService>()));
  gh.factory<_i20.HomePageCubit>(() => _i20.HomePageCubit(
      get<_i5.AuthService>(),
      get<_i12.AuthRepository>(),
      get<_i19.HomeP>(),
      get<_i4.GeneralDataHelper>()));
  gh.factory<_i21.LikedList>(
      () => _i21.LikedList(get<_i11.ApiClient>(), get<_i5.AuthService>()));
  gh.factory<_i22.LikedListCubit>(
      () => _i22.LikedListCubit(get<_i21.LikedList>()));
  gh.factory<_i23.SettingRepository>(() =>
      _i23.SettingRepository(get<_i11.ApiClient>(), get<_i5.AuthService>()));
  gh.factory<_i24.AccountRepository>(() =>
      _i24.AccountRepository(get<_i11.ApiClient>(), get<_i5.AuthService>()));
  gh.factory<_i25.AddBusinessCubit>(
      () => _i25.AddBusinessCubit(get<_i13.BusinessRepository>()));
  gh.factory<_i26.AddLocationScreen>(
      () => _i26.AddLocationScreen(get<_i18.GeneralDataCubit>()));
  gh.factory<_i27.BusinessListCubit>(() => _i27.BusinessListCubit(
      get<_i13.BusinessRepository>(),
      get<_i5.AuthService>(),
      get<_i12.AuthRepository>()));
  gh.factory<_i28.BusinessListDetailsCubit>(() => _i28.BusinessListDetailsCubit(
      get<_i14.BusinessRepositoryDetails>(),
      get<_i12.AuthRepository>(),
      get<_i5.AuthService>()));
  gh.factory<_i29.BusinessScreen>(
      () => _i29.BusinessScreen(get<_i27.BusinessListCubit>()));
  gh.factory<_i30.BusnessDetailsScreen>(
      () => _i30.BusnessDetailsScreen(get<_i28.BusinessListDetailsCubit>()));
  gh.factory<_i31.CategoryListScreen>(
      () => _i31.CategoryListScreen(get<_i18.GeneralDataCubit>()));
  gh.factory<_i32.CategoryModule>(() => _i32.CategoryModule(
      get<_i31.CategoryListScreen>(), get<_i26.AddLocationScreen>()));
  gh.factory<_i33.CreatePostCubit>(() => _i33.CreatePostCubit(
      get<_i5.AuthService>(),
      get<_i12.AuthRepository>(),
      get<_i15.CreatePostRepo>()));
  gh.factory<_i34.CreatePostScreen>(() =>
      _i34.CreatePostScreen(createPostCubit: get<_i33.CreatePostCubit>()));
  gh.factory<_i35.Followers>(() => _i35.Followers(get<_i17.FollowersCubit>()));
  gh.factory<_i36.HomePage>(() => _i36.HomePage(
      cubit: get<_i20.HomePageCubit>(), authService: get<_i5.AuthService>()));
  gh.factory<_i37.LikeByScreen>(
      () => _i37.LikeByScreen(likedListCubit: get<_i22.LikedListCubit>()));
  gh.factory<_i38.LikedListModule>(
      () => _i38.LikedListModule(get<_i37.LikeByScreen>()));
  gh.factory<_i39.PostModule>(
      () => _i39.PostModule(get<_i34.CreatePostScreen>()));
  gh.factory<_i40.SettingCubit>(() => _i40.SettingCubit(
      get<_i23.SettingRepository>(),
      get<_i5.AuthService>(),
      get<_i12.AuthRepository>()));
  gh.factory<_i41.SettingsScreen>(
      () => _i41.SettingsScreen(get<_i40.SettingCubit>()));
  gh.factory<_i42.UpdateBusiness>(
      () => _i42.UpdateBusiness(get<_i28.BusinessListDetailsCubit>()));
  gh.factory<_i43.AccountCubit>(() => _i43.AccountCubit(
      get<_i24.AccountRepository>(),
      get<_i5.AuthService>(),
      get<_i12.AuthRepository>()));
  gh.factory<_i44.AccountInfoScreen>(
      () => _i44.AccountInfoScreen(get<_i43.AccountCubit>()));
  gh.factory<_i45.AddBusiness>(
      () => _i45.AddBusiness(get<_i25.AddBusinessCubit>()));
  gh.factory<_i46.BusinessDetailsModule>(() => _i46.BusinessDetailsModule(
      get<_i30.BusnessDetailsScreen>(), get<_i42.UpdateBusiness>()));
  gh.factory<_i47.BusinessModule>(() =>
      _i47.BusinessModule(get<_i29.BusinessScreen>(), get<_i45.AddBusiness>()));
  gh.factory<_i48.FollowerModule>(
      () => _i48.FollowerModule(get<_i35.Followers>()));
  gh.factory<_i49.HomeModule>(() => _i49.HomeModule(get<_i36.HomePage>()));
  gh.factory<_i50.SettingModule>(() => _i50.SettingModule(
      get<_i41.SettingsScreen>(), get<_i44.AccountInfoScreen>()));
  gh.factory<_i51.MyApp>(() => _i51.MyApp(
      get<_i3.AppThemeDataService>(),
      get<_i10.NavigatorModule>(),
      get<_i47.BusinessModule>(),
      get<_i46.BusinessDetailsModule>(),
      get<_i38.LikedListModule>(),
      get<_i50.SettingModule>(),
      get<_i48.FollowerModule>(),
      get<_i32.CategoryModule>(),
      get<_i49.HomeModule>(),
      get<_i39.PostModule>(),
      get<_i7.LocalizationService>()));
  return get;
}
