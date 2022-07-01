import 'package:brandsome/abstracts/states/error_state.dart';
import 'package:brandsome/abstracts/states/loading_state.dart';
import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/categories_module/reponse/category_response.dart';
import 'package:brandsome/categories_module/repository/category_repository.dart';
import 'package:brandsome/categories_module/ui/screen/categories_list_screen.dart';
import 'package:brandsome/categories_module/ui/states/categories_success.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoryListCubit extends Cubit<States> {
  final CategoryRepository _categoryRepository;

  CategoryListCubit(this._categoryRepository) : super(LoadingState());

  getCategoryList(CategoryListScreenState screenState) {
    emit(LoadingState());
    _categoryRepository.getAllCategory().then((value) {
      if(value == null){
        emit(ErrorState(errorMessage: 'Connection error', retry: (){
          getCategoryList(screenState);
        }));
      }
      else if (value.code == 200){
        List<MainCategoryModel> filt = [];
        for (var item in value.data.insideData) {
          filt.add(MainCategoryModel.fromJson(item));
        }
        emit(CategorySuccess(filt,screenState));
      }
    });
  }
}