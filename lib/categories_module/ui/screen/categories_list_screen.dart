import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/categories_module/reponse/category_response.dart';
import 'package:brandsome/categories_module/state_manager/cate_stats_manager.dart';
import 'package:brandsome/utils/components/costom_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoryListScreen extends StatefulWidget {
  final CategoryListCubit _getCategoryListCubit;
  CategoryListScreen(this._getCategoryListCubit);
  @override
  State<CategoryListScreen> createState() => CategoryListScreenState();
}

class CategoryListScreenState extends State<CategoryListScreen> {
  final searchbarFilter = TextEditingController();
  List<ServiceModel> selectedServiceCa = [];
  @override
  void initState() {
    widget._getCategoryListCubit.getCategoryList(this);
  }
  returnedService() {
    print("selectedLocation${selectedServiceCa}");
    Navigator.pop(context, selectedServiceCa);
  }

  void refresh(){
    if(mounted){
      setState(() {

      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select category'),
        elevation: 5,
        actions: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: IconButton(
              onPressed: () {
                returnedService();
              },
              icon: Icon(
                Icons.check,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomSearch(hintText: 'Search for service'),
            ),
            BlocBuilder<CategoryListCubit, States>(
                bloc: widget._getCategoryListCubit,
                builder: (context, state) {
                  return state.getUI(context);
                }),
          ],
        ),
      ),
    );
  }
}
