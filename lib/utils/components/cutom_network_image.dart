import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pinch_zoom/pinch_zoom.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageSource;
   CustomNetworkImage({
    required this.imageSource,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (_) {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.black,
                  elevation: 0,
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      customBorder: CircleBorder(),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black38,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                backgroundColor: Colors.black,
                body: PinchZoom(
                  child: CachedNetworkImage(
                    imageUrl:imageSource,
                    imageBuilder: (context, imageProvider) => Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                    placeholder: (context, url) => Container(
                        alignment: Alignment.topCenter,
                        margin: EdgeInsets.only(top: 20),
                        child: Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.grey,
                          ),
                        )),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  resetDuration: const Duration(milliseconds: 150),
                  onZoomStart: () {},
                  onZoomEnd: () {},
                ),
              );
            });

      },
      child: CachedNetworkImage(
        imageUrl:imageSource,
        imageBuilder: (context, imageProvider) => Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        placeholder: (context, url) => Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 20),
            child: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey,
              ),
            )),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
