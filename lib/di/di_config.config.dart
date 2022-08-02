// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../business_details_module/business_details_module.dart' as _i49;
import '../business_details_module/repository/business__detailes_repository.dart'
    as _i14;
import '../business_details_module/state_manager/business_details_state_manager.dart'
    as _i31;
import '../business_details_module/ui/screen/business_details.dart' as _i33;
import '../business_details_module/ui/screen/update_business.dart' as _i45;
import '../business_module/business_module.dart' as _i50;
import '../business_module/repository/business_repository.dart' as _i13;
import '../business_module/state_manager/add_business_bloc.dart' as _i28;
import '../business_module/state_manager/business_list_bloc.dart' as _i30;
import '../business_module/ui/screen/add_business.dart' as _i48;
import '../business_module/ui/screen/business_screen.dart' as _i32;
import '../categories_module/categories_module.dart' as _i35;
import '../categories_module/state_manager/location_state_manager.dart' as _i19;
import '../categories_module/ui/screen/add_location.dart' as _i29;
import '../categories_module/ui/screen/categories_list_screen.dart' as _i34;
import '../follower_module/follower_module.dart' as _i51;
import '../follower_module/repository/follower_repository.dart' as _i17;
import '../follower_module/state_manager/follower.dart' as _i18;
import '../follower_module/ui/screens/follower_list.dart' as _i38;
import '../hive/hive.dart' as _i4;
import '../home_page/home_module.dart' as _i52;
import '../home_page/repository/home_repository.dart' as _i20;
import '../home_page/state_manager/home_page_state_manager.dart' as _i21;
import '../home_page/ui/screen/homePage.dart' as _i39;
import '../liked_module/liked_list_module.dart' as _i41;
import '../liked_module/repository/likes_list_repository.dart' as _i22;
import '../liked_module/state_manager/liked_list_bloc.dart' as _i23;
import '../liked_module/ui/screen/liked_by_screen.dart' as _i40;
import '../localization_service/localizationSservice.dart' as _i7;
import '../main.dart' as _i54;
import '../module_auth/repository/auth_repository.dart' as _i12;
import '../module_auth/service/auth_service.dart' as _i5;
import '../module_network/http_client/http_client.dart' as _i11;
import '../navigation_bar/navigator_module.dart' as _i10;
import '../navigation_bar/ui/screens/navigationBar.dart' as _i9;
import '../notification_module/repository/firebase_token_repository.dart'
    as _i16;
import '../notification_module/state_manager/notification.dart' as _i24;
import '../notification_module/ui/screens/notification_screen.dart' as _i25;
import '../posts_module/post_module.dart' as _i42;
import '../posts_module/repository/create_post_repo.dart' as _i15;
import '../posts_module/state_manager/create_post_state_manager.dart' as _i36;
import '../posts_module/ui/screen/createPost.dart' as _i37;
import '../setting_module/repository/account_repository.dart' as _i27;
import '../setting_module/repository/setting_repository.dart' as _i26;
import '../setting_module/setting_module.dart' as _i53;
import '../setting_module/state_manager/account_state_manager.dart' as _i46;
import '../setting_module/state_manager/setting.dart' as _i43;
import '../setting_module/ui/screen/account_info_screen.dart' as _i47;
import '../setting_module/ui/screen/setting_screen.dart' as _i44;
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
  gh.factory<_i16.FireBaseToken>(
      () => _i16.FireBaseToken(get<_i11.ApiClient>(), get<_i5.AuthService>()));
  gh.factory<_i17.FollowerRepository>(() =>
      _i17.FollowerRepository(get<_i11.ApiClient>(), get<_i5.AuthService>()));
  gh.factory<_i18.FollowersCubit>(
      () => _i18.FollowersCubit(get<_i17.FollowerRepository>()));
  gh.factory<_i19.GeneralDataCubit>(
      () => _i19.GeneralDataCubit(get<_i4.GeneralDataHelper>()));
  gh.factory<_i20.HomeP>(
      () => _i20.HomeP(get<_i11.ApiClient>(), get<_i5.AuthService>()));
  gh.factory<_i21.HomePageCubit>(() => _i21.HomePageCubit(
      get<_i5.AuthService>(),
      get<_i12.AuthRepository>(),
      get<_i20.HomeP>(),
      get<_i4.GeneralDataHelper>()));
  gh.factory<_i22.LikedList>(
      () => _i22.LikedList(get<_i11.ApiClient>(), get<_i5.AuthService>()));
  gh.factory<_i23.LikedListCubit>(
      () => _i23.LikedListCubit(get<_i22.LikedList>()));
  gh.factory<_i24.NotificationCubit>(
      () => _i24.NotificationCubit(get<_i16.FireBaseToken>()));
  gh.factory<_i25.NotificationScreen>(
      () => _i25.NotificationScreen(get<_i24.NotificationCubit>()));
  gh.factory<_i26.SettingRepository>(() =>
      _i26.SettingRepository(get<_i11.ApiClient>(), get<_i5.AuthService>()));
  gh.factory<_i27.AccountRepository>(() =>
      _i27.AccountRepository(get<_i11.ApiClient>(), get<_i5.AuthService>()));
  gh.factory<_i28.AddBusinessCubit>(
      () => _i28.AddBusinessCubit(get<_i13.BusinessRepository>()));
  gh.factory<_i29.AddLocationScreen>(
      () => _i29.AddLocationScreen(get<_i19.GeneralDataCubit>()));
  gh.factory<_i30.BusinessListCubit>(() => _i30.BusinessListCubit(
      get<_i13.BusinessRepository>(),
      get<_i5.AuthService>(),
      get<_i12.AuthRepository>()));
  gh.factory<_i31.BusinessListDetailsCubit>(() => _i31.BusinessListDetailsCubit(
      get<_i14.BusinessRepositoryDetails>(),
      get<_i12.AuthRepository>(),
      get<_i5.AuthService>(),
      get<_i20.HomeP>()));
  gh.factory<_i32.BusinessScreen>(
      () => _i32.BusinessScreen(get<_i30.BusinessListCubit>()));
  gh.factory<_i33.BusnessDetailsScreen>(
      () => _i33.BusnessDetailsScreen(get<_i31.BusinessListDetailsCubit>()));
  gh.factory<_i34.CategoryListScreen>(
      () => _i34.CategoryListScreen(get<_i19.GeneralDataCubit>()));
  gh.factory<_i35.CategoryModule>(() => _i35.CategoryModule(
      get<_i34.CategoryListScreen>(), get<_i29.AddLocationScreen>()));
  gh.factory<_i36.CreatePostCubit>(() => _i36.CreatePostCubit(
      get<_i15.CreatePostRepo>(), get<_i13.BusinessRepository>()));
  gh.factory<_i37.CreatePostScreen>(() =>
      _i37.CreatePostScreen(createPostCubit: get<_i36.CreatePostCubit>()));
  gh.factory<_i38.Followers>(() => _i38.Followers(get<_i18.FollowersCubit>()));
  gh.factory<_i39.HomePage>(() => _i39.HomePage(
      cubit: get<_i21.HomePageCubit>(), authService: get<_i5.AuthService>()));
  gh.factory<_i40.LikeByScreen>(
      () => _i40.LikeByScreen(likedListCubit: get<_i23.LikedListCubit>()));
  gh.factory<_i41.LikedListModule>(
      () => _i41.LikedListModule(get<_i40.LikeByScreen>()));
  gh.factory<_i42.PostModule>(
      () => _i42.PostModule(get<_i37.CreatePostScreen>()));
  gh.factory<_i43.SettingCubit>(() => _i43.SettingCubit(
      get<_i26.SettingRepository>(),
      get<_i5.AuthService>(),
      get<_i12.AuthRepository>()));
  gh.factory<_i44.SettingsScreen>(
      () => _i44.SettingsScreen(get<_i43.SettingCubit>()));
  gh.factory<_i45.UpdateBusiness>(
      () => _i45.UpdateBusiness(get<_i31.BusinessListDetailsCubit>()));
  gh.factory<_i46.AccountCubit>(() => _i46.AccountCubit(
      get<_i27.AccountRepository>(),
      get<_i5.AuthService>(),
      get<_i12.AuthRepository>()));
  gh.factory<_i47.AccountInfoScreen>(
      () => _i47.AccountInfoScreen(get<_i46.AccountCubit>()));
  gh.factory<_i48.AddBusiness>(
      () => _i48.AddBusiness(get<_i28.AddBusinessCubit>()));
  gh.factory<_i49.BusinessDetailsModule>(() => _i49.BusinessDetailsModule(
      get<_i33.BusnessDetailsScreen>(), get<_i45.UpdateBusiness>()));
  gh.factory<_i50.BusinessModule>(() =>
      _i50.BusinessModule(get<_i32.BusinessScreen>(), get<_i48.AddBusiness>()));
  gh.factory<_i51.FollowerModule>(
      () => _i51.FollowerModule(get<_i38.Followers>()));
  gh.factory<_i52.HomeModule>(() =>
      _i52.HomeModule(get<_i39.HomePage>(), get<_i25.NotificationScreen>()));
  gh.factory<_i53.SettingModule>(() => _i53.SettingModule(
      get<_i44.SettingsScreen>(), get<_i47.AccountInfoScreen>()));
  gh.factory<_i54.MyApp>(() => _i54.MyApp(
      get<_i3.AppThemeDataService>(),
      get<_i10.NavigatorModule>(),
      get<_i50.BusinessModule>(),
      get<_i49.BusinessDetailsModule>(),
      get<_i41.LikedListModule>(),
      get<_i53.SettingModule>(),
      get<_i51.FollowerModule>(),
      get<_i35.CategoryModule>(),
      get<_i52.HomeModule>(),
      get<_i42.PostModule>(),
      get<_i7.LocalizationService>()));
  return get;
}
