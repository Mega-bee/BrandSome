// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../business_details_module/business_details_module.dart' as _i45;
import '../business_details_module/repository/business_repository.dart' as _i12;
import '../business_details_module/state_manager/business_details_state_manager.dart'
    as _i26;
import '../business_details_module/ui/screen/business_details.dart' as _i28;
import '../business_details_module/ui/screen/update_business.dart' as _i40;
import '../business_module/business_module.dart' as _i46;
import '../business_module/repository/business_repository.dart' as _i11;
import '../business_module/state_manager/add_business_bloc.dart' as _i24;
import '../business_module/state_manager/business_list_bloc.dart' as _i25;
import '../business_module/ui/screen/add_business.dart' as _i43;
import '../business_module/ui/screen/business_screen.dart' as _i27;
import '../categories_module/categories_module.dart' as _i31;
import '../categories_module/repository/category_repository.dart' as _i13;
import '../categories_module/state_manager/cate_stats_manager.dart' as _i29;
import '../categories_module/ui/screen/categories_list_screen.dart' as _i30;
import '../follower_module/follower_module.dart' as _i48;
import '../follower_module/repository/follower_repository.dart' as _i15;
import '../follower_module/state_manager/follower.dart' as _i16;
import '../follower_module/ui/screens/follower_list.dart' as _i33;
import '../hive/hive.dart' as _i4;
import '../home_page/home_module.dart' as _i49;
import '../home_page/repository/business_repository.dart' as _i17;
import '../home_page/state_manager/home_page_state_manager.dart' as _i18;
import '../home_page/ui/screen/homePage.dart' as _i34;
import '../liked_module/liked_list_module.dart' as _i36;
import '../liked_module/repository/likes_list_repository.dart' as _i19;
import '../liked_module/state_manager/liked_list_bloc.dart' as _i20;
import '../liked_module/ui/screen/liked_by_screen.dart' as _i35;
import '../main.dart' as _i52;
import '../module_auth/repository/auth_repository.dart' as _i10;
import '../module_auth/service/auth_service.dart' as _i5;
import '../module_network/http_client/http_client.dart' as _i9;
import '../navigation_bar/navigator_module.dart' as _i8;
import '../navigation_bar/ui/screens/navigationBar.dart' as _i7;
import '../posts_module/post_module.dart' as _i50;
import '../posts_module/repository/create_post_repo.dart' as _i14;
import '../posts_module/state_manager/create_post_state_manager.dart' as _i32;
import '../posts_module/ui/screen/createPost.dart' as _i47;
import '../setting_module/repository/account_repository.dart' as _i23;
import '../setting_module/repository/location_repository.dart' as _i21;
import '../setting_module/repository/setting_repository.dart' as _i22;
import '../setting_module/setting_module.dart' as _i51;
import '../setting_module/state_manager/account_state_manager.dart' as _i41;
import '../setting_module/state_manager/location_state_manager.dart' as _i37;
import '../setting_module/state_manager/setting.dart' as _i38;
import '../setting_module/ui/screen/account_info_screen.dart' as _i42;
import '../setting_module/ui/screen/add_location.dart' as _i44;
import '../setting_module/ui/screen/setting_screen.dart' as _i39;
import '../utils/logger/logger.dart' as _i6;
import '../utils/service/theme_serrvice/theme_service.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AppThemeDataService>(() => _i3.AppThemeDataService());
  gh.factory<_i4.AuthPrefsHelper>(() => _i4.AuthPrefsHelper());
  gh.factory<_i5.ImeiService>(() => _i5.ImeiService());
  gh.factory<_i6.Logger>(() => _i6.Logger());
  gh.factory<_i7.NavigationScreen>(() => _i7.NavigationScreen());
  gh.factory<_i8.NavigatorModule>(
      () => _i8.NavigatorModule(get<_i7.NavigationScreen>()));
  gh.factory<_i9.ApiClient>(() => _i9.ApiClient(get<_i6.Logger>()));
  gh.factory<_i10.AuthRepository>(
      () => _i10.AuthRepository(get<_i9.ApiClient>()));
  gh.factory<_i5.AuthService>(() =>
      _i5.AuthService(get<_i4.AuthPrefsHelper>(), get<_i10.AuthRepository>()));
  gh.factory<_i11.BusinessRepository>(() =>
      _i11.BusinessRepository(get<_i9.ApiClient>(), get<_i5.AuthService>()));
  gh.factory<_i12.BusinessRepositoryDetails>(() =>
      _i12.BusinessRepositoryDetails(get<_i9.ApiClient>(),
          get<_i5.AuthService>(), get<_i5.ImeiService>()));
  gh.factory<_i13.CategoryRepository>(() =>
      _i13.CategoryRepository(get<_i9.ApiClient>(), get<_i5.AuthService>()));
  gh.factory<_i14.CreatePostRepo>(
      () => _i14.CreatePostRepo(get<_i9.ApiClient>(), get<_i5.AuthService>()));
  gh.factory<_i15.FollowerRepository>(() =>
      _i15.FollowerRepository(get<_i9.ApiClient>(), get<_i5.AuthService>()));
  gh.factory<_i16.FollowersCubit>(
      () => _i16.FollowersCubit(get<_i15.FollowerRepository>()));
  gh.factory<_i17.HomeP>(
      () => _i17.HomeP(get<_i9.ApiClient>(), get<_i5.AuthService>()));
  gh.factory<_i18.HomePageCubit>(() => _i18.HomePageCubit(
      get<_i5.AuthService>(), get<_i10.AuthRepository>(), get<_i17.HomeP>()));
  gh.factory<_i19.LikedList>(
      () => _i19.LikedList(get<_i9.ApiClient>(), get<_i5.AuthService>()));
  gh.factory<_i20.LikedListCubit>(
      () => _i20.LikedListCubit(get<_i19.LikedList>()));
  gh.factory<_i21.LocationRepository>(
      () => _i21.LocationRepository(get<_i9.ApiClient>()));
  gh.factory<_i22.SettingRepository>(() =>
      _i22.SettingRepository(get<_i9.ApiClient>(), get<_i5.AuthService>()));
  gh.factory<_i23.AccountRepository>(() =>
      _i23.AccountRepository(get<_i9.ApiClient>(), get<_i5.AuthService>()));
  gh.factory<_i24.AddBusinessCubit>(
      () => _i24.AddBusinessCubit(get<_i11.BusinessRepository>()));
  gh.factory<_i25.BusinessListCubit>(
      () => _i25.BusinessListCubit(get<_i11.BusinessRepository>()));
  gh.factory<_i26.BusinessListDetailsCubit>(() => _i26.BusinessListDetailsCubit(
      get<_i12.BusinessRepositoryDetails>(),
      get<_i10.AuthRepository>(),
      get<_i5.AuthService>()));
  gh.factory<_i27.BusinessScreen>(
      () => _i27.BusinessScreen(get<_i25.BusinessListCubit>()));
  gh.factory<_i28.BusnessDetailsScreen>(
      () => _i28.BusnessDetailsScreen(get<_i26.BusinessListDetailsCubit>()));
  gh.factory<_i29.CategoryListCubit>(
      () => _i29.CategoryListCubit(get<_i13.CategoryRepository>()));
  gh.factory<_i30.CategoryListScreen>(
      () => _i30.CategoryListScreen(get<_i29.CategoryListCubit>()));
  gh.factory<_i31.CategoryModule>(
      () => _i31.CategoryModule(get<_i30.CategoryListScreen>()));
  gh.factory<_i32.CreatePostCubit>(() => _i32.CreatePostCubit(
      get<_i5.AuthService>(),
      get<_i10.AuthRepository>(),
      get<_i14.CreatePostRepo>()));
  gh.factory<_i33.Followers>(() => _i33.Followers(get<_i16.FollowersCubit>()));
  gh.factory<_i34.HomePage>(
      () => _i34.HomePage(cubit: get<_i18.HomePageCubit>()));
  gh.factory<_i35.LikeByScreen>(
      () => _i35.LikeByScreen(likedListCubit: get<_i20.LikedListCubit>()));
  gh.factory<_i36.LikedListModule>(
      () => _i36.LikedListModule(get<_i35.LikeByScreen>()));
  gh.factory<_i37.LocationCubit>(
      () => _i37.LocationCubit(get<_i21.LocationRepository>()));
  gh.factory<_i38.SettingCubit>(() => _i38.SettingCubit(
      get<_i22.SettingRepository>(),
      get<_i5.AuthService>(),
      get<_i10.AuthRepository>()));
  gh.factory<_i39.SettingsScreen>(
      () => _i39.SettingsScreen(get<_i38.SettingCubit>()));
  gh.factory<_i40.UpdateBusiness>(
      () => _i40.UpdateBusiness(get<_i26.BusinessListDetailsCubit>()));
  gh.factory<_i41.AccountCubit>(() =>
      _i41.AccountCubit(get<_i23.AccountRepository>(), get<_i5.AuthService>()));
  gh.factory<_i42.AccountInfoScreen>(
      () => _i42.AccountInfoScreen(get<_i41.AccountCubit>()));
  gh.factory<_i43.AddBusiness>(
      () => _i43.AddBusiness(get<_i24.AddBusinessCubit>()));
  gh.factory<_i44.AddLocationScreen>(
      () => _i44.AddLocationScreen(get<_i37.LocationCubit>()));
  gh.factory<_i45.BusinessDetailsModule>(() => _i45.BusinessDetailsModule(
      get<_i28.BusnessDetailsScreen>(), get<_i40.UpdateBusiness>()));
  gh.factory<_i46.BusinessModule>(() => _i46.BusinessModule(
      get<_i27.BusinessScreen>(),
      get<_i43.AddBusiness>(),
      get<_i44.AddLocationScreen>()));
  gh.factory<_i47.CreatePost>(
      () => _i47.CreatePost(createPostCubit: get<_i32.CreatePostCubit>()));
  gh.factory<_i48.FollowerModule>(
      () => _i48.FollowerModule(get<_i33.Followers>()));
  gh.factory<_i49.HomeModule>(() => _i49.HomeModule(get<_i34.HomePage>()));
  gh.factory<_i50.PostModule>(
      () => _i50.PostModule(get<_i47.CreatePost>(), get<_i34.HomePage>()));
  gh.factory<_i51.SettingModule>(() => _i51.SettingModule(
      get<_i39.SettingsScreen>(), get<_i42.AccountInfoScreen>()));
  gh.factory<_i52.MyApp>(() => _i52.MyApp(
      get<_i3.AppThemeDataService>(),
      get<_i8.NavigatorModule>(),
      get<_i46.BusinessModule>(),
      get<_i45.BusinessDetailsModule>(),
      get<_i36.LikedListModule>(),
      get<_i51.SettingModule>(),
      get<_i48.FollowerModule>(),
      get<_i31.CategoryModule>(),
      get<_i49.HomeModule>(),
      get<_i50.PostModule>()));
  return get;
}
