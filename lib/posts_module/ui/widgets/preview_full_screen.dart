import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_editor_plus/data/image_item.dart';

class FullscreenSlider extends StatelessWidget {
 final List<ImageItem> imgList;


  FullscreenSlider(this.imgList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Preview'),),
      body: Builder(
        builder: (context) {
          final double height = MediaQuery.of(context).size.height;
          return CarouselSlider(
            options: CarouselOptions(
              height: height,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              // autoPlay: false,
            ),
            items: imgList
                .map((item) => Container(
              child: Center(
                  child: Image.memory(
                    item.image,
                    fit: BoxFit.contain,
                    height: height,
                  )),
            ))
                .toList(),
          );
        },
      ),
    );
  }
}