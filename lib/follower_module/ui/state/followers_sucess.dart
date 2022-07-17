import 'package:flutter/material.dart';

import '../../../abstracts/states/state.dart';
import '../../../generated/l10n.dart';
import '../../request/follow_request.dart';
import '../../response/follower_response.dart';
import '../screens/follower_list.dart';
import '../widget/followers_card.dart';

class FollowersSuccess extends States {
  final List<FollowersResp> bussfollowers;
  FollowersState followers;
  FollowersSuccess({required this.bussfollowers,required this.followers}) : super(false);

  @override
  Widget getUI(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: 30,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 38.0),
        child: Text("${S.of(context).youAreFollowing} ${bussfollowers.length} ${S.of(context).Business}"),
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
              onFollowClick: (int id,isSelected){
                followers.follow(FollowRequest(isFollow:isSelected), id.toString());
              },
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
