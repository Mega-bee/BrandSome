import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';
import '../../state_manager/follower.dart';


@injectable
class Followers extends StatefulWidget {
  final FollowersCubit cubit;
  const Followers(this.cubit);

  @override

  State<Followers> createState() => _FollowersState();
}

class _FollowersState extends State<Followers> {
  @override
  void initState() {

    widget.cubit.getFoll();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 5,
          title: Text(
            "Followers",
          ),
        ),
        body: BlocBuilder<FollowersCubit, States>(
    bloc: widget.cubit,
    builder: (context, state) {
    return state.getUI(context);
    }));
  }
}
