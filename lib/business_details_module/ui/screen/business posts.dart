import 'package:flutter/material.dart';
import '../../../generated/l10n.dart';
import '../../../utils/images/images.dart';
import '../../reponse/business_response.dart';

class BusinessPosts extends StatefulWidget {
  final List<Posts> businessInfoModel;
  final Function onDeletePost;

  BusinessPosts({required this.businessInfoModel, required this.onDeletePost});

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
    return widget.businessInfoModel.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImageAsset.NO_POST,
                  height: 200,
                ),
                Text(S.of(context).noPostsYet)
              ],
            ),
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: widget.businessInfoModel.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          widget.businessInfoModel[index].profileImage
                              .toString(),
                        ),
                      ),
                    ),
                    // The
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${widget.businessInfoModel[index].name.toString()}",
                        ),
//                    PopupMenuButton(
//                        icon: Icon(
//                          Icons.more_vert,
//                          color: Colors.white,
//                          size: 20,
//                        ),
//                        onSelected: (item) => onSelected(context, item),
//                        itemBuilder: (context) => [
//                              PopupMenuItem(
//                                value: 0,
//                                child: Column(
//                                  children: [
//                                    Row(
//                                      children: [
//                                        SvgPicture.asset(
//                                          SvgImg.RATE,
//                                          height: 17,
//                                        ),
//                                        SizedBox(
//                                          width: 20,
//                                        ),
//                                        Text(
//                                          "Update post",
//                                          style: TextStyle(
//                                            color: Colors.white,
//                                          ),
//                                        ),
//                                      ],
//                                    ),
//                                    SizedBox(
//                                      height: 20,
//                                    ),
//                                    Divider(
//                                        thickness: 1,
//                                        height: 2,
//                                    ),
//                                  ],
//                                ),
//                              ),
//                              PopupMenuItem(
//                                value: 1,
//                                child: Row(
//                                  children: [
//                                    Icon(
//                                      Icons.delete_outline,
//                                      color: Colors.white,
//                                    ),
//                                    SizedBox(
//                                      width: 13,
//                                    ),
//                                    Text(
//                                      "Delete post",
//                                      style: TextStyle(color: Colors.white),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ]),
                      ],
                    ),

                    subtitle: Text(
                      widget.businessInfoModel[index].city.toString(),
                      style: TextStyle(fontSize: 11),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          "https://static.remove.bg/remove-bg-web/913b22608288cd03cc357799d0d4594e2d1c6b41/assets/start-1abfb4fe2980eabfbbaaa4365a0692539f7cd2725f324f904565a9a744f8e214.jpg",
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.thumb_up_alt_outlined,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "${S.of(context).likedBy} ${widget.businessInfoModel[index].likeCount} ${S.of(context).visitors}",
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text("${widget.businessInfoModel[index].type}",
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            widget.businessInfoModel[index].description
                                .toString(),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  ),
                ],
              );
            });
  }
}
