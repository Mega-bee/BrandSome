import 'package:brandsome/utils/images/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../response/follower_response.dart';

class FollowCard extends StatefulWidget {
  final FollowersResp bussfol;
  FollowCard({required this.bussfol});
  @override
  State<FollowCard> createState() => _FollowCardState();
}

class _FollowCardState extends State<FollowCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 20,top: 20),
      child: Column(
        children: [
          ListTile(
            // leading: Image.asset(ImageAsset.TEST_IMAGE),
            leading:  CircleAvatar(
              backgroundImage: NetworkImage(widget.bussfol.image.toString()),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.bussfol.name.toString(),
                     ),
                    Text(
                      widget.bussfol.type.toString(),
                      style: TextStyle(fontSize: 14),
                     ),
                  ],
                ),
                isSelected
                    ? TextButton(
                  onPressed: () {
                    isSelected = !isSelected;

                    setState(() {

                    });
                  },
                  child: Text("Follow",),
                  style: TextButton.styleFrom(
                      backgroundColor:   Theme.of(context).primaryColor,
                    // shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                      side: BorderSide(color: Theme.of(context).primaryColor)),
                )
                    : TextButton(
                        onPressed: () {
                          isSelected = !isSelected;
                          setState(() {

                          });
                        },
                        child: Text("Unfollow",),
                        style: TextButton.styleFrom(
                            // shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                            side: BorderSide(color: Theme.of(context).primaryColor)),
                      )
              ],
            ),
          ),
          Divider(height: 3,)
        ],
      ),
    );
  }
}
