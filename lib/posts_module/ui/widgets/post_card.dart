import 'package:brandsome/utils/components/cutom_network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import '../../../home_page/response/home_page.dart';

class PostCard extends StatefulWidget {
  final Function onViewLikeTap;
  final Post posthome;
  final Function onLikeClick;
  final bool isLogged;

  PostCard(
      {required this.onViewLikeTap,
      required this.posthome,
      required this.onLikeClick,
      required this.isLogged});

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
    return Card(
      color: Theme.of(context).cardColor,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
      child: Column(
        children: [
          ListTile(
            leading: Container(
              width: 50,
              height: 50,
              child: CachedNetworkImage(
                imageUrl: widget.posthome.profileImage.toString(),
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            title: Text(
              "${widget.posthome.name}",
            ),
            subtitle: Text(
              "${widget.posthome.city}",
            ),
          ),
//            Image.network(
//              "${posts.imgTwo}",
//              fit: BoxFit.cover,
//            ),
          Container(
            height: 500,
            width: 500,
            child: Column(
              children: [
                CarouselSlider.builder(
                  options: CarouselOptions(
                      height: 450,
                      enlargeStrategy: CenterPageEnlargeStrategy.scale,
                      padEnds: true,
                      pageSnapping: true,
                      autoPlay: false,
                      enlargeCenterPage: true,
                      reverse: false,
                      disableCenter: true,
                      enableInfiniteScroll: false,
                      onPageChanged: (index, reason) {
                        _currentIndex = index;
                        print(_currentIndex);
                        setState(() {});
                      }),
                  itemCount: widget.posthome.postMedia?.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Container(
                          width: 500,

                          // margin: EdgeInsets.symmetric(horizontal: .0),
                          child: VideoCheck(
                              widget.posthome.postMedia![itemIndex])),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.posthome.postMedia!
                        .map((e) => Container(
                              width: 5.0,
                              height: 5.0,
                              margin: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 2.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _currentIndex ==
                                          widget.posthome.postMedia!.indexOf(e)
                                      ? Colors.white
                                      : Colors.grey),
                            ))
                        .toList() //
                    )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 15.0, end: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          bool like = !widget.posthome.isLiked;
                          if (widget.isLogged) {
                            widget.posthome.isLiked = like;
                            if(like){
                              widget.posthome.likeCount ++;
                            }else{
                              widget.posthome.likeCount --;
                            }

                            print('persooon lllooggedd');
                            setState(() {});

                          }
                          widget.onLikeClick(like);
                        },
                        child: widget.posthome.isLiked
                            ? Icon(
                                Icons.thumb_up,
                                color: Theme.of(context).primaryColor,
                          size: 25,
                              )
                            : Icon(
                                Icons.thumb_up_alt_outlined,
                          size: 25,
                              )),
                    InkWell(
                       onTap: (){
                         widget.onViewLikeTap(widget.posthome.id.toString());
                       },
                         child: Text(widget.posthome.likeCount.toString() + ' Likes',
                           style: TextStyle(
                           decoration: TextDecoration.underline,
                         ),))
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.posthome.type ?? '',
                  style: Theme.of(context).textTheme.caption,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "${widget.posthome.description}",
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget VideoCheck(PostMedia m) {
    if (m.mediaTypeId == 1) {
      return CustomNetworkImage(imageSource: m.url ?? '',);
    } else {
      print("hellooo videooooooooooooooooooo");
      return Container();
//      var _controller = VideoPlayerController.network('${m.url}')
//        ..initialize().then((_) {
//          setState(() {
//
//          });
//        });
//        return AspectRatio(
//          aspectRatio: _controller!.value.aspectRatio,
//          child: Stack(children: [
//            FittedBox(
//              alignment: Alignment.center,
//              fit: BoxFit.fill,
//              child: SizedBox(
//                height: 429,
//                width: 339,
//                child: VisibilityDetector(
//                  key: ObjectKey(_controller),
//                  onVisibilityChanged: (visibility) {
//                    if (visibility.visibleBounds == 0 &&
//                        this.mounted &&
//                        _controller!.value.isPlaying) {
//                      _controller?.pause();
//                      setState(() {});
//                    }
//                  },
//                  child: Container(
//                      child: AspectRatio(
//                          aspectRatio: 1280 / 720,
//                          child: VideoPlayer(
//                            _controller!,
//                          ))),
//                ),
//              ),
//            ),
//            Padding(
//              padding: EdgeInsets.only(
//                top: 420,
//              ),
//              child: VideoProgressIndicator(
//                _controller!, //controller
//                allowScrubbing: true,
//
//                colors: VideoProgressColors(
//                  playedColor: Colors.red,
//                  bufferedColor: Colors.grey,
//                  backgroundColor: Colors.transparent,
//                ),
//              ),
//            ),
//
//                Center(
//                    child: IconButton(
//                        onPressed: () {
//                          setState(() {
//                            _controller!.value.isPlaying
//                                ? _controller!.pause()
//                                : _controller!.play();
//                          });
//                        },
//                        icon: _controller!.value.isPlaying
//                            ? AnimatedOpacity(
//                                duration: Duration(seconds: 2),
//                                opacity: 0,
//                                child: Icon(
//                                  Icons.pause,
//                                ))
//                            : AnimatedOpacity(
//                                duration: Duration(seconds: 2),
//                                opacity: 1,
//                                child: Icon(
//                                  Icons.play_arrow,
//                                ))))
//
//          ]),
//        );

    }
  }
}
