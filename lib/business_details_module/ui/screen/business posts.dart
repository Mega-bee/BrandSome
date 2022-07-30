import 'package:brandsome/posts_module/post_route.dart';
import 'package:brandsome/posts_module/ui/widgets/post_card.dart';
import 'package:flutter/material.dart';
import '../../../generated/l10n.dart';
import '../../../utils/images/images.dart';
import '../../reponse/business_detailes_response.dart';

class BusinessPosts extends StatefulWidget {
  final BusinessInfoResponse businessInfoModel;
  final Function onDeletePost;
  final Function onViewLikeTap;
  final Function onLikeClick;
  final bool isMyBuss;
  final bool isLoggedIn;
  const BusinessPosts(
      {required this.businessInfoModel,
      required this.onDeletePost,
      required this.isMyBuss ,required this.isLoggedIn ,  required this.onLikeClick ,required this.onViewLikeTap});

  @override
  State<BusinessPosts> createState() => _BusinessPostsState();
}

class _BusinessPostsState extends State<BusinessPosts> {
//  void onSelected(BuildContext context, item) {
//    switch (item) {
//      case 0:
//        print("Clicking add business");
//        break;
//      case 1:
//        widget.onDeletePost();
//        break;
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
            shrinkWrap: true,
            itemCount: widget.businessInfoModel.posts!.length,
            itemBuilder: (context, index) {
              return PostCard(
                  onViewLikeTap: (id){
                    widget.onViewLikeTap(id);
                  },
                  posthome:  widget.businessInfoModel.posts![index],
                  onLikeClick: (onLikeClick){
                    widget.onLikeClick(onLikeClick,widget.businessInfoModel.posts![index].id.toString());
                  },
                  isLogged: widget.isLoggedIn);
            });
  }
}
