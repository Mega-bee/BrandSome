import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';
import '../../../generated/l10n.dart';
import '../../reponse/get_likes_list_response.dart';
import '../../state_manager/liked_list_bloc.dart';

@injectable
class LikeByScreen extends StatefulWidget {
  final LikedListCubit likedListCubit;

  const LikeByScreen({required this.likedListCubit});

  @override
  State<LikeByScreen> createState() => LikeByScreenState();
}

class LikeByScreenState extends State<LikeByScreen> {
  String? id = "-1";
  List<LikedByModel> likedmodel1 = [];

  void refrech() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && id == "-1") {
      id = args as String;
      widget.likedListCubit.getLikesList(id, this);
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
//        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Padding(
          padding: const EdgeInsetsDirectional.only(start: 10.0),
          child: Text(
            S.of(context).Likes,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ),
      body: BlocConsumer<LikedListCubit, States>(
        bloc: widget.likedListCubit,
        builder: (context, state) {
          if (!state.isListener) {
            return state.getUI(context);
          }
          return Container();
        },
        listener: (context, state) {
          if (state.isListener) {
            showDialog(
                context: context,
                builder: (context) => state.getAlert(context));
          }
        },
      ),
    );
  }
}
