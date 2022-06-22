import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widget/followers_card.dart';


class Followers extends StatefulWidget {
  const Followers({Key? key}) : super(key: key);

  @override
  State<Followers> createState() => _FollowersState();
}

class _FollowersState extends State<Followers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 3,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Padding(
            padding: const EdgeInsetsDirectional.only(start: 10.0),
            child: Text(
              "Flowers",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
        body: SizedBox(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(left: 38.0),
                  child: Text("You are following 100 businesses"),
                ),
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.only(right: 38.0,left: 38.0),
                  child: Divider(
                    thickness:
                    1,
                   ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return FollowCard();
                    })]),
        )

    );

  }
}
