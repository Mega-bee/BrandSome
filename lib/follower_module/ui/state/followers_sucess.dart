import 'package:flutter/material.dart';

import '../../../abstracts/states/state.dart';
import '../../response/follower_response.dart';
import '../widget/followers_card.dart';

class FollowersSuccess extends States {
  final List<FollowersResp> bussfollowers;

  FollowersSuccess({required this.bussfollowers}) : super(false);

  @override
  Widget getUI(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: 30,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 38.0),
        child: Text("You are following ${bussfollowers.length} businesses"),
      ),
      SizedBox(
        height: 15,
      ),
      Padding(
        padding: const EdgeInsets.only(right: 38.0, left: 38.0),
        child: Divider(
          thickness: 1,
        ),
      ),
      ListView.builder(
          shrinkWrap: true,
          itemCount: bussfollowers.length,
          itemBuilder: (context, index) {
            return FollowCard(
              bussfol: bussfollowers[index],
            );
          })
    ]);
  }

  @override
  Widget getAlert(BuildContext context) {
    // TODO: implement getAlert
    throw UnimplementedError();
  }
}
