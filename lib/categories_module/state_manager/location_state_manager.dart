import 'package:brandsome/abstracts/states/error_state.dart';
import 'package:brandsome/abstracts/states/loading_state.dart';
import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/categories_module/reponse/category_response.dart';
import 'package:brandsome/categories_module/ui/screen/categories_list_screen.dart';
import 'package:brandsome/categories_module/ui/states/categories_success.dart';
import 'package:brandsome/hive/hive.dart';
import 'package:brandsome/hive/hive_category.dart';
import 'package:brandsome/hive/hive_city.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../reponse/add_location_response.dart';
import '../ui/screen/add_location.dart';
import '../ui/states/location_success.dart';

@injectable
class GeneralDataCubit extends Cubit<States> {
  final GeneralDataHelper _dataHelper;

  GeneralDataCubit(this._dataHelper) : super(LoadingState());

  getLocation(AddLocationScreenState state,
      List<AddLocationResponse>? alreadySelected) {
    List<HiveCity>? hiveCity = _dataHelper.getCities();
    List<AddLocationResponse>? cities = [];
    if (hiveCity == null) {
      emit(ErrorState(errorMessage: 'Faild to load cities', retry: () {}));
    } else {
      for (var element in hiveCity) {
        cities.add(AddLocationResponse(
            value: false, id: element.id, name: element.name));
      }
      if (alreadySelected != null && alreadySelected.isNotEmpty) {
        print('check Selected');
        for (var selec in alreadySelected) {
          for (var city in cities) {
            if (selec.id == city.id) {
              city.value = true;
              print(1111);
            }
          }
        }
//        List<AddLocationResponse>? citiesb =   cities.where((item) => alreadySelected.contains(item)).toList();
//        print(citiesb);
      }
      emit(LocationSuccess(cities, state));
    }
  }

  getCategories(CategoryListScreenState state) {
    List<HiveMainCategory>? catHive = _dataHelper.getCategories();
    List<MainCategoryModel> cateigories = [];
    if (catHive == null) {
      emit(ErrorState(errorMessage: 'Faild to load categories', retry: () {}));
    } else {
      for (var element in catHive) {
        List<SubCategoryModel> subCategories = [];
        element.subs?.forEach((element) {
          List<ServiceModel> service = [];
          element.service?.forEach((element) {
            service.add(ServiceModel(id: element.id, name: element.name, isUserInterest: element.isUserSelected,));
          });
          subCategories.add(SubCategoryModel(
              name: element.name, id: element.id, services: service));
        });
        cateigories.add(MainCategoryModel(
            name: element.name, id: element.id, subs: subCategories));
      }
      emit(CategorySuccess(cateigories, state));
    }
  }
}
