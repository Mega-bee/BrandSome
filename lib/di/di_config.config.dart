// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../business_details_module/business_details_module.dart' as _i43;
import '../business_details_module/repository/business_repository.dart' as _i13;
import '../business_details_module/state_manager/business_details_state_manager.dart'
    as _i27;
import '../business_details_module/ui/screen/business_details.dart' as _i29;
import '../business_details_module/ui/screen/update_business.dart' as _i39;
import '../business_module/business_module.dart' as _i44;
import '../business_module/repository/business_repository.dart' as _i12;
import '../business_module/state_manager/add_business_bloc.dart' as _i24;
import '../business_module/state_manager/business_list_bloc.dart' as _i26;
import '../business_module/ui/screen/add_business.dart' as _i42;
import '../business_module/ui/screen/business_screen.dart' as _i28;
import '../categories_module/categories_module.dart' as _i31;
import '../categories_module/state_manager/location_state_manager.dart' as _i17;
import '../categories_module/ui/screen/add_location.dart' as _i25;
import '../categories_module/ui/screen/categories_list_screen.dart' as _i30;
import '../follower_module/follower_module.dart' as _i46;
import '../follower_module/repository/follower_repository.dart' as _i15;
import '../follower_module/state_manager/follower.dart' as _i16;
import '../follower_module/ui/screens/follower_list.dart' as _i33;
import '../hive/hive.dart' as _i4;
import '../home_page/home_module.dart' as _i47;
import '../home_page/repository/home_repository.dart' as _i18;
import '../home_page/state_manager/home_page_state_manager.dart' as _i19;
import '../home_page/ui/screen/homePage.dart' as _i34;
import '../liked_module/liked_list_module.dart' as _i36;
import '../liked_module/repository/likes_list_repository.dart' as _i20;
import '../liked_module/state_manager/liked_list_bloc.dart' as _i21;
import '../liked_module/ui/screen/liked_by_screen.dart' as _i35;
import '../main.dart' as _i50;
import '../module_auth/repository/auth_repository.dart' as _i11;
import '../module_auth/service/auth_service.dart' as _i6;
import '../module_network/http_client/http_client.dart' as _i10;
import '../navigation_bar/navigator_module.dart' as _i9;
import '../navigation_bar/ui/screens/navigationBar.dart' as _i8;
import '../posts_module/post_module.dart' as _i48;
import '../posts_module/repository/create_post_repo.dart' as _i14;
import '../posts_module/state_manager/create_post_state_manager.dart' as _i32;
import '../posts_module/ui/screen/createPost.dart' as _i45;
import '../setting_module/repository/account_repository.dart' as _i23;
import '../setting_module/repository/setting_repository.dart' as _i22;
import '../setting_module/setting_module.dart' as _i49;
import '../setting_module/state_manager/account_state_manager.dart' as _i40;
import '../setting_module/state_manager/setting.dart' as _i37;
import '../setting_module/ui/screen/account_info_screen.dart' as _i41;
import '../setting_module/ui/screen/setting_screen.dart' as _i38;
import '../utils/global/global_state_manager.dart' as _i5;
import '../utils/logger/logger.dart' as _i7;
import '../utils/service/theme_serrvice/theme_service.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AppThemeDataService>(() => _i3.AppThemeDataService());
  gh.factory<_i4.AuthPrefsHelper>(() => _i4.AuthPrefsHelper());
  gh.factory<_i4.GeneralDataHelper>(() => _i4.GeneralDataHelper());
  gh.singleton<_i5.GlobalStateManager>(_i5.GlobalStateManager());
  gh.factory<_i6.ImeiService>(() => _i6.ImeiService());
  gh.factory<_i7.Logger>(() => _i7.Logger());
  gh.factory<_i8.NavigationScreen>(() => _i8.NavigationScreen());
  gh.factory<_i9.NavigatorModule>(
      () => _i9.NavigatorModule(get<_i8.NavigationScreen>()));
  gh.factory<_i10.ApiClient>(() => _i10.ApiClient(get<_i7.Logger>()));
  gh.factory<_i11.AuthRepository>(
      () => _i11.AuthRepository(get<_i10.ApiClient>()));
  gh.factory<_i6.AuthService>(() =>
      _i6.AuthService(get<_i4.AuthPrefsHelper>(), get<_i11.AuthRepository>()));
  gh.factory<_i12.BusinessRepository>(() =>
      _i12.BusinessRepository(get<_i10.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i13.BusinessRepositoryDetails>(() =>
      _i13.BusinessRepositoryDetails(get<_i10.ApiClient>(),
          get<_i6.AuthService>(), get<_i6.ImeiService>()));
  gh.factory<_i14.CreatePostRepo>(
      () => _i14.CreatePostRepo(get<_i10.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i15.FollowerRepository>(() =>
      _i15.FollowerRepository(get<_i10.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i16.FollowersCubit>(
      () => _i16.FollowersCubit(get<_i15.FollowerRepository>()));
  gh.factory<_i17.GeneralDataCubit>(
      () => _i17.GeneralDataCubit(get<_i4.GeneralDataHelper>()));
  gh.factory<_i18.HomeP>(
      () => _i18.HomeP(get<_i10.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i19.HomePageCubit>(() => _i19.HomePageCubit(
      get<_i6.AuthService>(),
      get<_i11.AuthRepository>(),
      get<_i18.HomeP>(),
      get<_i4.GeneralDataHelper>()));
  gh.factory<_i20.LikedList>(
      () => _i20.LikedList(get<_i10.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i21.LikedListCubit>(
      () => _i21.LikedListCubit(get<_i20.LikedList>()));
  gh.factory<_i22.SettingRepository>(() =>
      _i22.SettingRepository(get<_i10.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i23.AccountRepository>(() =>
      _i23.AccountRepository(get<_i10.ApiClient>(), get<_i6.AuthService>()));
  gh.factory<_i24.AddBusinessCubit>(
      () => _i24.AddBusinessCubit(get<_i12.BusinessRepository>()));
  gh.factory<_i25.AddLocationScreen>(
      () => _i25.AddLocationScreen(get<_i17.GeneralDataCubit>()));
  gh.factory<_i26.BusinessListCubit>(() => _i26.BusinessListCubit(
      get<_i12.BusinessRepository>(), get<_i6.AuthService>()));
  gh.factory<_i27.BusinessListDetailsCubit>(() => _i27.BusinessListDetailsCubit(
      get<_i13.BusinessRepositoryDetails>(),
      get<_i11.AuthRepository>(),
      get<_i6.AuthService>()));
  gh.factory<_i28.BusinessScreen>(
      () => _i28.BusinessScreen(get<_i26.BusinessListCubit>()));
  gh.factory<_i29.BusnessDetailsScreen>(
      () => _i29.BusnessDetailsScreen(get<_i27.BusinessListDetailsCubit>()));
  gh.factory<_i30.CategoryListScreen>(
      () => _i30.CategoryListScreen(get<_i17.GeneralDataCubit>()));
  gh.factory<_i31.CategoryModule>(() => _i31.CategoryModule(
      get<_i30.CategoryListScreen>(), get<_i25.AddLocationScreen>()));
  gh.factory<_i32.CreatePostCubit>(() => _i32.CreatePostCubit(
      get<_i6.AuthService>(),
      get<_i11.AuthRepository>(),
      get<_i14.CreatePostRepo>()));
  gh.factory<_i33.Followers>(() => _i33.Followers(get<_i16.FollowersCubit>()));
  gh.factory<_i34.HomePage>(
      () => _i34.HomePage(cubit: get<_i19.HomePageCubit>()));
  gh.factory<_i35.LikeByScreen>(
      () => _i35.LikeByScreen(likedListCubit: get<_i21.LikedListCubit>()));
  gh.factory<_i36.LikedListModule>(
      () => _i36.LikedListModule(get<_i35.LikeByScreen>()));
  gh.factory<_i37.SettingCubit>(() => _i37.SettingCubit(
      get<_i22.SettingRepository>(),
      get<_i6.AuthService>(),
      get<_i11.AuthRepository>()));
  gh.factory<_i38.SettingsScreen>(
      () => _i38.SettingsScreen(get<_i37.SettingCubit>()));
  gh.factory<_i39.UpdateBusiness>(
      () => _i39.UpdateBusiness(get<_i27.BusinessListDetailsCubit>()));
  gh.factory<_i40.AccountCubit>(() =>
      _i40.AccountCubit(get<_i23.AccountRepository>(), get<_i6.AuthService>()));
  gh.factory<_i41.AccountInfoScreen>(
      () => _i41.AccountInfoScreen(get<_i40.AccountCubit>()));
  gh.factory<_i42.AddBusiness>(
      () => _i42.AddBusiness(get<_i24.AddBusinessCubit>()));
  gh.factory<_i43.BusinessDetailsModule>(() => _i43.BusinessDetailsModule(
      get<_i29.BusnessDetailsScreen>(), get<_i39.UpdateBusiness>()));
  gh.factory<_i44.BusinessModule>(() =>
      _i44.BusinessModule(get<_i28.BusinessScreen>(), get<_i42.AddBusiness>()));
  gh.factory<_i45.CreatePost>(
      () => _i45.CreatePost(createPostCubit: get<_i32.CreatePostCubit>()));
  gh.factory<_i46.FollowerModule>(
      () => _i46.FollowerModule(get<_i33.Followers>()));
  gh.factory<_i47.HomeModule>(() => _i47.HomeModule(get<_i34.HomePage>()));
  gh.factory<_i48.PostModule>(
      () => _i48.PostModule(get<_i45.CreatePost>(), get<_i34.HomePage>()));
  gh.factory<_i49.SettingModule>(() => _i49.SettingModule(
      get<_i38.SettingsScreen>(), get<_i41.AccountInfoScreen>()));
  gh.factory<_i50.MyApp>(() => _i50.MyApp(
      get<_i3.AppThemeDataService>(),
      get<_i9.NavigatorModule>(),
      get<_i44.BusinessModule>(),
      get<_i43.BusinessDetailsModule>(),
      get<_i36.LikedListModule>(),
      get<_i49.SettingModule>(),
      get<_i46.FollowerModule>(),
      get<_i31.CategoryModule>(),
      get<_i47.HomeModule>(),
      get<_i48.PostModule>()));
  return get;
}
