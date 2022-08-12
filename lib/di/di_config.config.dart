// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../business_details_module/business_details_module.dart' as _i50;
import '../business_details_module/repository/business__detailes_repository.dart'
    as _i15;
import '../business_details_module/state_manager/business_details_state_manager.dart'
    as _i32;
import '../business_details_module/ui/screen/business_details.dart' as _i34;
import '../business_details_module/ui/screen/update_business.dart' as _i46;
import '../business_module/business_module.dart' as _i51;
import '../business_module/repository/business_repository.dart' as _i14;
import '../business_module/state_manager/add_business_bloc.dart' as _i29;
import '../business_module/state_manager/business_list_bloc.dart' as _i31;
import '../business_module/ui/screen/add_business.dart' as _i49;
import '../business_module/ui/screen/business_screen.dart' as _i33;
import '../categories_module/categories_module.dart' as _i36;
import '../categories_module/state_manager/location_state_manager.dart' as _i20;
import '../categories_module/ui/screen/add_location.dart' as _i30;
import '../categories_module/ui/screen/categories_list_screen.dart' as _i35;
import '../follower_module/follower_module.dart' as _i52;
import '../follower_module/repository/follower_repository.dart' as _i18;
import '../follower_module/state_manager/follower.dart' as _i19;
import '../follower_module/ui/screens/follower_list.dart' as _i39;
import '../hive/hive.dart' as _i4;
import '../home_page/home_module.dart' as _i53;
import '../home_page/repository/home_repository.dart' as _i21;
import '../home_page/state_manager/home_page_state_manager.dart' as _i22;
import '../home_page/ui/screen/homePage.dart' as _i40;
import '../liked_module/liked_list_module.dart' as _i42;
import '../liked_module/repository/likes_list_repository.dart' as _i23;
import '../liked_module/state_manager/liked_list_bloc.dart' as _i24;
import '../liked_module/ui/screen/liked_by_screen.dart' as _i41;
import '../localization_service/localizationSservice.dart' as _i8;
import '../main.dart' as _i55;
import '../module_auth/repository/auth_repository.dart' as _i13;
import '../module_auth/service/auth_service.dart' as _i5;
import '../module_network/http_client/http_client.dart' as _i12;
import '../navigation_bar/navigator_module.dart' as _i11;
import '../navigation_bar/ui/screens/navigationBar.dart' as _i10;
import '../notification_module/repository/firebase_token_repository.dart'
    as _i17;
import '../notification_module/state_manager/notification.dart' as _i25;
import '../notification_module/ui/screens/notification_screen.dart' as _i26;
import '../posts_module/post_module.dart' as _i43;
import '../posts_module/repository/create_post_repo.dart' as _i16;
import '../posts_module/state_manager/create_post_state_manager.dart' as _i37;
import '../posts_module/ui/screen/createPost.dart' as _i38;
import '../services/local_notification_service.dart' as _i7;
import '../setting_module/repository/account_repository.dart' as _i28;
import '../setting_module/repository/setting_repository.dart' as _i27;
import '../setting_module/setting_module.dart' as _i54;
import '../setting_module/state_manager/account_state_manager.dart' as _i47;
import '../setting_module/state_manager/setting.dart' as _i44;
import '../setting_module/ui/screen/account_info_screen.dart' as _i48;
import '../setting_module/ui/screen/setting_screen.dart' as _i45;
import '../utils/global/global_state_manager.dart' as _i6;
import '../utils/logger/logger.dart' as _i9;
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
  gh.factory<_i7.LocalNotificationService>(
      () => _i7.LocalNotificationService());
  gh.factory<_i8.LocalizationService>(() => _i8.LocalizationService());
  gh.factory<_i9.Logger>(() => _i9.Logger());
  gh.factory<_i10.NavigationScreen>(() => _i10.NavigationScreen());
  gh.factory<_i11.NavigatorModule>(
      () => _i11.NavigatorModule(get<_i10.NavigationScreen>()));
  gh.factory<_i12.ApiClient>(() => _i12.ApiClient(get<_i9.Logger>()));
  gh.factory<_i13.AuthRepository>(
      () => _i13.AuthRepository(get<_i12.ApiClient>(), get<_i5.AuthService>()));
  gh.factory<_i14.BusinessRepository>(() =>
      _i14.BusinessRepository(get<_i12.ApiClient>(), get<_i5.AuthService>()));
  gh.factory<_i15.BusinessRepositoryDetails>(() =>
      _i15.BusinessRepositoryDetails(get<_i12.ApiClient>(),
          get<_i5.AuthService>(), get<_i5.ImeiService>()));
  gh.factory<_i16.CreatePostRepo>(
      () => _i16.CreatePostRepo(get<_i12.ApiClient>(), get<_i5.AuthService>()));
  gh.factory<_i17.FireBaseToken>(
      () => _i17.FireBaseToken(get<_i12.ApiClient>(), get<_i5.AuthService>()));
  gh.factory<_i18.FollowerRepository>(() =>
      _i18.FollowerRepository(get<_i12.ApiClient>(), get<_i5.AuthService>()));
  gh.factory<_i19.FollowersCubit>(
      () => _i19.FollowersCubit(get<_i18.FollowerRepository>()));
  gh.factory<_i20.GeneralDataCubit>(
      () => _i20.GeneralDataCubit(get<_i4.GeneralDataHelper>()));
  gh.factory<_i21.HomeP>(
      () => _i21.HomeP(get<_i12.ApiClient>(), get<_i5.AuthService>()));
  gh.factory<_i22.HomePageCubit>(() => _i22.HomePageCubit(
      get<_i5.AuthService>(),
      get<_i13.AuthRepository>(),
      get<_i21.HomeP>(),
      get<_i4.GeneralDataHelper>()));
  gh.factory<_i23.LikedList>(
      () => _i23.LikedList(get<_i12.ApiClient>(), get<_i5.AuthService>()));
  gh.factory<_i24.LikedListCubit>(
      () => _i24.LikedListCubit(get<_i23.LikedList>()));
  gh.factory<_i25.NotificationCubit>(
      () => _i25.NotificationCubit(get<_i17.FireBaseToken>()));
  gh.factory<_i26.NotificationScreen>(
      () => _i26.NotificationScreen(get<_i25.NotificationCubit>()));
  gh.factory<_i27.SettingRepository>(() =>
      _i27.SettingRepository(get<_i12.ApiClient>(), get<_i5.AuthService>()));
  gh.factory<_i28.AccountRepository>(() =>
      _i28.AccountRepository(get<_i12.ApiClient>(), get<_i5.AuthService>()));
  gh.factory<_i29.AddBusinessCubit>(
      () => _i29.AddBusinessCubit(get<_i14.BusinessRepository>()));
  gh.factory<_i30.AddLocationScreen>(
      () => _i30.AddLocationScreen(get<_i20.GeneralDataCubit>()));
  gh.factory<_i31.BusinessListCubit>(() => _i31.BusinessListCubit(
      get<_i14.BusinessRepository>(),
      get<_i5.AuthService>(),
      get<_i13.AuthRepository>()));
  gh.factory<_i32.BusinessListDetailsCubit>(() => _i32.BusinessListDetailsCubit(
      get<_i15.BusinessRepositoryDetails>(),
      get<_i13.AuthRepository>(),
      get<_i5.AuthService>(),
      get<_i21.HomeP>()));
  gh.factory<_i33.BusinessScreen>(
      () => _i33.BusinessScreen(get<_i31.BusinessListCubit>()));
  gh.factory<_i34.BusnessDetailsScreen>(
      () => _i34.BusnessDetailsScreen(get<_i32.BusinessListDetailsCubit>()));
  gh.factory<_i35.CategoryListScreen>(
      () => _i35.CategoryListScreen(get<_i20.GeneralDataCubit>()));
  gh.factory<_i36.CategoryModule>(() => _i36.CategoryModule(
      get<_i35.CategoryListScreen>(), get<_i30.AddLocationScreen>()));
  gh.factory<_i37.CreatePostCubit>(() => _i37.CreatePostCubit(
      get<_i16.CreatePostRepo>(), get<_i14.BusinessRepository>()));
  gh.factory<_i38.CreatePostScreen>(() =>
      _i38.CreatePostScreen(createPostCubit: get<_i37.CreatePostCubit>()));
  gh.factory<_i39.Followers>(() => _i39.Followers(get<_i19.FollowersCubit>()));
  gh.factory<_i40.HomePage>(() => _i40.HomePage(
      cubit: get<_i22.HomePageCubit>(), authService: get<_i5.AuthService>()));
  gh.factory<_i41.LikeByScreen>(
      () => _i41.LikeByScreen(likedListCubit: get<_i24.LikedListCubit>()));
  gh.factory<_i42.LikedListModule>(
      () => _i42.LikedListModule(get<_i41.LikeByScreen>()));
  gh.factory<_i43.PostModule>(
      () => _i43.PostModule(get<_i38.CreatePostScreen>()));
  gh.factory<_i44.SettingCubit>(() => _i44.SettingCubit(
      get<_i27.SettingRepository>(),
      get<_i5.AuthService>(),
      get<_i13.AuthRepository>()));
  gh.factory<_i45.SettingsScreen>(
      () => _i45.SettingsScreen(get<_i44.SettingCubit>()));
  gh.factory<_i46.UpdateBusiness>(
      () => _i46.UpdateBusiness(get<_i32.BusinessListDetailsCubit>()));
  gh.factory<_i47.AccountCubit>(() => _i47.AccountCubit(
      get<_i28.AccountRepository>(),
      get<_i5.AuthService>(),
      get<_i13.AuthRepository>()));
  gh.factory<_i48.AccountInfoScreen>(
      () => _i48.AccountInfoScreen(get<_i47.AccountCubit>()));
  gh.factory<_i49.AddBusiness>(
      () => _i49.AddBusiness(get<_i29.AddBusinessCubit>()));
  gh.factory<_i50.BusinessDetailsModule>(() => _i50.BusinessDetailsModule(
      get<_i34.BusnessDetailsScreen>(), get<_i46.UpdateBusiness>()));
  gh.factory<_i51.BusinessModule>(() =>
      _i51.BusinessModule(get<_i33.BusinessScreen>(), get<_i49.AddBusiness>()));
  gh.factory<_i52.FollowerModule>(
      () => _i52.FollowerModule(get<_i39.Followers>()));
  gh.factory<_i53.HomeModule>(() =>
      _i53.HomeModule(get<_i40.HomePage>(), get<_i26.NotificationScreen>()));
  gh.factory<_i54.SettingModule>(() => _i54.SettingModule(
      get<_i45.SettingsScreen>(), get<_i48.AccountInfoScreen>()));
  gh.factory<_i55.MyApp>(() => _i55.MyApp(
      get<_i7.LocalNotificationService>(),
      get<_i3.AppThemeDataService>(),
      get<_i11.NavigatorModule>(),
      get<_i51.BusinessModule>(),
      get<_i50.BusinessDetailsModule>(),
      get<_i42.LikedListModule>(),
      get<_i54.SettingModule>(),
      get<_i52.FollowerModule>(),
      get<_i36.CategoryModule>(),
      get<_i53.HomeModule>(),
      get<_i43.PostModule>(),
      get<_i8.LocalizationService>()));
  return get;
}
