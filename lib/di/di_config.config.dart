// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../business_module/business_module.dart' as _i11;
import '../business_module/repository/business_repository.dart' as _i8;
import '../business_module/state_manager/business_list_bloc.dart' as _i9;
import '../business_module/ui/screen/business_screen.dart' as _i10;
import '../main.dart' as _i12;
import '../module_network/http_client/http_client.dart' as _i7;
import '../navigation_bar/navigator_module.dart' as _i6;
import '../navigation_bar/ui/screens/navigationBar.dart' as _i5;
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
  gh.factory<_i8.BusinessRepository>(
      () => _i8.BusinessRepository(get<_i7.ApiClient>()));
  gh.factory<_i9.BusinessListCubit>(
      () => _i9.BusinessListCubit(get<_i8.BusinessRepository>()));
  gh.factory<_i10.BusinessScreen>(
      () => _i10.BusinessScreen(get<_i9.BusinessListCubit>()));
  gh.factory<_i11.BusinessModule>(
      () => _i11.BusinessModule(get<_i10.BusinessScreen>()));
  gh.factory<_i12.MyApp>(() => _i12.MyApp(get<_i3.AppThemeDataService>(),
      get<_i6.NavigatorModule>(), get<_i11.BusinessModule>()));
  return get;
}
