import 'package:brandsome/utils/components/costom_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../abstracts/states/state.dart';
import '../../state_manager/get_category_list_bloc.dart';


@injectable
class SearchBarFilterBusinessScreen extends StatefulWidget {
final GetCategoryListCubit _getCategoryListCubit;
SearchBarFilterBusinessScreen(this._getCategoryListCubit);
  @override
  State<SearchBarFilterBusinessScreen> createState() => _SearchBarFilterBusinessScreenState();
}

class _SearchBarFilterBusinessScreenState extends State<SearchBarFilterBusinessScreen> {
  final searchbarFilter = TextEditingController();


  @override
  void initState() {
    widget._getCategoryListCubit.getCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomSearch(hintText: 'Search for service'),
            ),


            BlocBuilder<GetCategoryListCubit, States>(
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
