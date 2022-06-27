// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../business_details_module/business_details_module.dart' as _i22;
import '../business_details_module/repository/business_repository.dart' as _i10;
import '../business_details_module/state_manager/business_list_bloc.dart'
    as _i17;
import '../business_details_module/ui/screen/business_details.dart' as _i19;
import '../business_module/business_module.dart' as _i23;
import '../business_module/repository/business_repository.dart' as _i9;
import '../business_module/state_manager/business_list_bloc.dart' as _i16;
import '../business_module/state_manager/get_category_list_bloc.dart' as _i12;
import '../business_module/ui/screen/add_business.dart' as _i3;
import '../business_module/ui/screen/business_screen.dart' as _i18;
import '../business_module/ui/screen/searbarfilter_business_screen.dart'
    as _i15;
import '../home_page/repository/business_repository.dart' as _i11;
import '../liked_module/liked_list_module.dart' as _i21;
import '../liked_module/repository/likes_list_repository.dart' as _i13;
import '../liked_module/state_manager/liked_list_bloc.dart' as _i14;
import '../liked_module/ui/screen/liked_by_screen.dart' as _i20;
import '../main.dart' as _i24;
import '../module_network/http_client/http_client.dart' as _i8;
import '../navigation_bar/navigator_module.dart' as _i7;
import '../navigation_bar/ui/screens/navigationBar.dart' as _i6;
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
  gh.factory<_i8.ApiClient>(() => _i8.ApiClient(get<_i5.Logger>()));
  gh.factory<_i9.BusinessRepository>(
      () => _i9.BusinessRepository(get<_i8.ApiClient>()));
  gh.factory<_i10.BusinessRepositoryDetails>(
      () => _i10.BusinessRepositoryDetails(get<_i8.ApiClient>()));
  gh.factory<_i11.FilterRepo>(() => _i11.FilterRepo(get<_i8.ApiClient>()));
  gh.factory<_i12.GetCategoryListCubit>(
      () => _i12.GetCategoryListCubit(get<_i9.BusinessRepository>()));
  gh.factory<_i13.LikedList>(() => _i13.LikedList(get<_i8.ApiClient>()));
  gh.factory<_i14.LikedListCubit>(
      () => _i14.LikedListCubit(get<_i13.LikedList>()));
  gh.factory<_i15.SearchBarFilterBusinessScreen>(() =>
      _i15.SearchBarFilterBusinessScreen(get<_i12.GetCategoryListCubit>()));
  gh.factory<_i16.BusinessListCubit>(
      () => _i16.BusinessListCubit(get<_i9.BusinessRepository>()));
  gh.factory<_i17.BusinessListDetailsCubit>(() =>
      _i17.BusinessListDetailsCubit(get<_i10.BusinessRepositoryDetails>()));
  gh.factory<_i18.BusinessScreen>(
      () => _i18.BusinessScreen(get<_i16.BusinessListCubit>()));
  gh.factory<_i19.BusnessDetailsScreen>(
      () => _i19.BusnessDetailsScreen(get<_i17.BusinessListDetailsCubit>()));
  gh.factory<_i20.LikeByScreen>(
      () => _i20.LikeByScreen(likedListCubit: get<_i14.LikedListCubit>()));
  gh.factory<_i21.LikedListModule>(
      () => _i21.LikedListModule(get<_i20.LikeByScreen>()));
  gh.factory<_i22.BusinessDetailsModule>(
      () => _i22.BusinessDetailsModule(get<_i19.BusnessDetailsScreen>()));
  gh.factory<_i23.BusinessModule>(() => _i23.BusinessModule(
      get<_i18.BusinessScreen>(),
      get<_i3.AddBusiness>(),
      get<_i15.SearchBarFilterBusinessScreen>()));
  gh.factory<_i24.MyApp>(() => _i24.MyApp(
      get<_i4.AppThemeDataService>(),
      get<_i7.NavigatorModule>(),
      get<_i23.BusinessModule>(),
      get<_i22.BusinessDetailsModule>(),
      get<_i21.LikedListModule>()));
  return get;
}
