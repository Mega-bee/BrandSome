import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/liked_module/reponse/get_likes_list_response.dart';
import 'package:flutter/material.dart';
import '../../../utils/components/costom_search.dart';
import '../screen/liked_by_screen.dart';
import '../widget/likes_card.dart';

class LikedListSuccess extends States {
  final List<LikedByModel> likedmodel;
  final LikeByScreenState likeByScreenState;

  LikedListSuccess(this.likedmodel, this.likeByScreenState) : super(false) {
    likedmodelSearch = likedmodel;
  }

  List<LikedByModel> likedmodelSearch = [];

  @override
  Widget getUI(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: CustomSearch(
            hintText: 'Search for location',
            onChanged: (searchText) {
              searchText = searchText.toLowerCase();
              print(searchText);
              print("search test");
              likedmodelSearch = likedmodel
                  .where((string) => string.name!
                      .toLowerCase()
                      .contains(searchText.toLowerCase()))
                  .toList();
              likeByScreenState.refrech();
            },
          ),
        ),
        Padding(
            padding: const EdgeInsetsDirectional.only(start: 30, end: 30),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Liked by :",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${likedmodel.length} ${likedmodel.length == 1 ? "person" : "people"}",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  )
                ])),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: likedmodelSearch.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: LikesCard(likedmodelSearch[index]),
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
