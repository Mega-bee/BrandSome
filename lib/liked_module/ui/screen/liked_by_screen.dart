import 'package:brandsome/liked_module/ui/widget/likes_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';
import '../../../utils/components/Seperator/seperator_doted.dart';
import '../../state_manager/business_list_bloc.dart';

@injectable
class LikeByScreen extends StatefulWidget {
final LikedListCubit likedListCubit;
LikeByScreen({required this.likedListCubit});
  @override
  State<LikeByScreen> createState() => _LikeByScreenState();
}

class _LikeByScreenState extends State<LikeByScreen> {
  String? id = "-1";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && id == "-1") {
      id = args as String;
      widget.likedListCubit.getLikesList(id);
    }
    return Scaffold(
        appBar: AppBar(
          elevation: 3,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Padding(
            padding: const EdgeInsetsDirectional.only(start: 10.0),
            child: Text(
              "Likes",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
        body:  BlocBuilder<LikedListCubit, States>(
            bloc: widget.likedListCubit,
            builder: (context, state) {
              return state.getUI(context);
            }),

    );  }
}
