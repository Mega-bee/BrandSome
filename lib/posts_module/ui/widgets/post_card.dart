import 'package:brandsome/business_details_module/reponse/business_response.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../home_page/response/home_page.dart';
import '../../reponse/posts_reponse.dart';
import 'package:video_player/video_player.dart';

class PostCard extends StatefulWidget {

  final Function onLikeTap;
  final Post posthome;

  PostCard({required this.onLikeTap,required this.posthome } );

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  late int _currentIndex;
  VideoPlayerController? _controller;

  @override
  void initState() {


    super.initState();
    _currentIndex = 0;
    _controller = VideoPlayerController.network(
        '${widget.posthome.postMedia![0].url}')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});});
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
              leading:   Container(
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
            Column(
              children: [
                CarouselSlider.builder(

                  options: CarouselOptions(
                    height: 350,

                      autoPlay: false,
                      enlargeCenterPage: true,
                      reverse: false,

                      disableCenter: false,
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

                    width: 350,
                    // margin: EdgeInsets.symmetric(horizontal: .0),
                    child:
    widget.posthome.postMedia![itemIndex].mediaTypeId==1?
                    Image.network(
                      widget.posthome.postMedia![itemIndex].url.toString(),
                      fit: BoxFit.cover,

                    ) :

    _controller!.value.isInitialized
    ? AspectRatio(

    aspectRatio: _controller!.value.aspectRatio,
    child: Stack(children:[
      VideoPlayer(_controller!),
      widget.posthome.postMedia![0].mediaTypeId==2?
      Center(
        child: IconButton(onPressed:() {
          setState(() {
            _controller!.value.isPlaying
                ? _controller!.pause()
                : _controller!.play();
          });
        },
            icon:
            _controller!.value.isPlaying?
            AnimatedOpacity(duration: Duration(seconds: 2),
            opacity: 1,
            child: Icon(  Icons.pause,)):
            AnimatedOpacity(duration: Duration(seconds: 2),
                opacity: 0,
                child: Icon(Icons.play_arrow,))

        )

      )
          :Container()
      ,

    ]),
    )
        : Container(),
                  ),
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
                                      : Colors.grey
                              ),
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
                        widget.posthome.likeCount ==1?
                        Text(
                          "${widget.posthome.likeCount} like",
                        ):Text(
                          "${widget.posthome.likeCount} likes",
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
      ),
    );
  }
}
