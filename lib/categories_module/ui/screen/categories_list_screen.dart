import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/categories_module/reponse/category_response.dart';
import 'package:brandsome/categories_module/state_manager/location_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoryListScreen extends StatefulWidget {
  final GeneralDataCubit _getCategoryListCubit;
  CategoryListScreen(this._getCategoryListCubit);
  @override
  State<CategoryListScreen> createState() => CategoryListScreenState();
}

class CategoryListScreenState extends State<CategoryListScreen> {
  @override
  void initState() {
    widget._getCategoryListCubit.getCategories(this);
  }
  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<GeneralDataCubit, States>(
            bloc: widget._getCategoryListCubit,
            builder: (context, state) {
              return state.getUI(context);
            }));
  }
}
