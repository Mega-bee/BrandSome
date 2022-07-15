import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';
import '../../request/follow_request.dart';
import '../../state_manager/follower.dart';


@injectable
class Followers extends StatefulWidget {
  final FollowersCubit cubit;
  const Followers(this.cubit);

  @override

  State<Followers> createState() => FollowersState();
}

class FollowersState extends State<Followers> {
  @override
  void initState() {

    widget.cubit.getFoll(this);
  }

  void follow(FollowRequest request,String?id){
    widget.cubit.following(request,id,this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 5,
          centerTitle: true,
          title: Text(
            "Followers",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),

          ),
        ),
        body: BlocBuilder<FollowersCubit, States>(
    bloc: widget.cubit,
    builder: (context, state) {
    return state.getUI(context);
    }));
  }
}
