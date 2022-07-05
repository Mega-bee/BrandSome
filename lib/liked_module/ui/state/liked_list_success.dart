import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/liked_module/reponse/get_likes_list_response.dart';
import 'package:flutter/material.dart';

import '../../../utils/components/Seperator/seperator_doted.dart';
import '../../../utils/components/costom_search.dart';
import '../screen/liked_by_screen.dart';
import '../widget/likes_card.dart';

class LikedListSuccess extends States {
  final List<LikedByModel> likedmodel;
  final LikeByScreenState likeByScreenState;

  LikedListSuccess(this.likedmodel, this.likeByScreenState) : super(false);

  @override
  Widget getUI(BuildContext context) {

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
            padding: const EdgeInsetsDirectional.all(20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Liked by :",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                  Text(
                    "${likedmodel.length} ${likedmodel.length == 1 ? "person" : "people"}",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  )
                ])),
        CustomSearch(
          hintText: 'Search for location',
          onChanged: (searchText) {
            searchText = searchText.toLowerCase();
            print(searchText);
            print("search test");
            likeByScreenState.likedmodel1 = likedmodel
                .where(
                  (string) => string.name!.toLowerCase().contains(
                        searchText.toLowerCase(),
                      ),
                )
                .toList();
            likeByScreenState.refrech();
          },
        ),
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: likeByScreenState.likedmodel1.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: LikesCard(likeByScreenState.likedmodel1[index]),
              );
            })
      ]),
    );
  }

  @override
  Widget getAlert(BuildContext context) {
    // TODO: implement getAlert
    throw UnimplementedError();
  }
}
