import 'package:brandsome/utils/components/cutom_network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
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
  List<String>   imagesUrl= [];

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    asyncOne();
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
            leading: SizedBox(
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
                placeholder: (context, url) => Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: LoadingAnimationWidget.staggeredDotsWave(
                      color: Theme.of(context).primaryColor, size: 10),
                ),
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
          SizedBox(
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
                  itemCount: widget.posthome.postMedia.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      widget.posthome.postMedia[itemIndex].mediaTypeId == 1
                          ? CustomNetworkImage(
                              thumbnail:
                                  widget.posthome.postMedia[itemIndex].url ??
                                      '',
                              imageSource: imagesUrl,
                            )
                          : Container(),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.posthome.postMedia
                        .map((e) => Container(
                              width: 5.0,
                              height: 5.0,
                              margin: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 2.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _currentIndex ==
                                          widget.posthome.postMedia.indexOf(e)
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
                            if (like) {
                              widget.posthome.likeCount++;
                            } else {
                              widget.posthome.likeCount--;
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
                        onTap: () {
                          widget.onViewLikeTap(widget.posthome.id.toString());
                        },
                        child: Text(
                          widget.posthome.likeCount.toString() + ' Likes',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ))
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.posthome.type ?? '',
                  style: Theme.of(context).textTheme.caption,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "${widget.posthome.description}",
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

// Widget VideoCheck(PostMedia m) {
//
//   var _controller =   VideoPlayerController.network('${m.url}')
//     ..initialize().then((_) {
//       setState(() {
//
//       });
//     });
//
//   if (m.mediaTypeId == 1) {
//     return CustomNetworkImage(imageSource: m.url ?? '',);
//   } else  {
//     print("hellooo videooooooooooooooooooo");
//     // return Container();
//
//      return
//
//        Stack(children: [
//
//
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
//
//                      setState(() {
//                        _controller?.pause();});
//                    }
//                  },
//                  child: Container(
//
//                      child:
//                      _controller.value.isInitialized?
//                      AspectRatio(
//                          aspectRatio: 120/200,
//                          child: VideoPlayer(
//                            _controller!,
//                          )):Container(),),
//                ),
//              ),
//            ),
//            Padding(
//              padding: EdgeInsets.only(
//                top: 420,
//              ),
//              child: VideoProgressIndicator(
//                _controller!, //controller
//                allowScrubbing: false,
//
//
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
//          ]);
//
//
//
//   }

// }

  asyncOne() async {
    print("asyncOne start");
    await Future.forEach(widget.posthome.postMedia, (PostMedia e)   {
         imagesUrl.add(e.url ?? '');
    });

  }
}
