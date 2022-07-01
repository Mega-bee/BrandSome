import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../reponse/posts_reponse.dart';

class PostCard extends StatefulWidget {
  final postModel posts;
  final Function onLikeTap;

  PostCard({required this.posts ,required this.onLikeTap } );

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        color: Theme.of(context).cardColor,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("${widget.posts.autherImage}"),
              ),
              title: Text(
                "${widget.posts.title}",
              ),
              subtitle: Text(
                "${widget.posts.subTitle}",
              ),
            ),
//            Image.network(
//              "${posts.imgTwo}",
//              fit: BoxFit.cover,
//            ),
            Column(
              children: [
                CarouselSlider.builder(
                  options: CarouselOptions(
                    height: 350,
                      autoPlay: false,
                      onPageChanged: (index, reason) {
                        _currentIndex = index;
                        print(_currentIndex);
                        setState(() {});
                      }),
                  itemCount: widget.posts.imgTwo?.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Container(

                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 3.0),
                    child:Image.network(
                      widget.posts.imgTwo![itemIndex],
                      fit: BoxFit.cover,
                    ) ,

                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.posts.imgTwo!
                        .map((e) => Container(
                              width: 8.0,
                              height: 8.0,
                              margin: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 2.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _currentIndex ==
                                          widget.posts.imgTwo!.indexOf(e)
                                      ? Colors.white
                                      : Colors.black),
                            ))
                        .toList() //
                    )
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 15.0, end: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){
                      widget.onLikeTap();
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Icon(
                          Icons.thumb_up_alt_outlined,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${widget.posts.titleTwo}",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Properties/Appartments/Electricians",
                    style: Theme.of(context).textTheme.caption,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${widget.posts.paragraph}",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
