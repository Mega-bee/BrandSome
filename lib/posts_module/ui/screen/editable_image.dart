import 'dart:io';
import 'package:brandsome/generated/l10n.dart';
import 'package:brandsome/utils/helpers/image_crop_helper.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:photofilters/photofilters.dart';
import 'package:image/image.dart' as imageLib;
import 'package:path/path.dart';

class EditerImageList extends StatefulWidget {
  List<File> images;

  EditerImageList(this.images);

  @override
  _EditerImageListState createState() => _EditerImageListState();
}

class _EditerImageListState extends State<EditerImageList> {
  File? selectedImage;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedImage = widget.images.first;
    selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomSheet: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                  onTap: () async {
                    var fileName = basename(selectedImage!.path);
                    var image = imageLib
                        .decodeImage(await selectedImage!.readAsBytes());
                    image = imageLib.copyResize(image!, width: 600);
                    Map? imagefile = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PhotoFilterSelector(
                          title: Text(
                            S.of(context).photoFilter,
                          ),
                          image: image!,
                          filters: presetFiltersList,
                          filename: fileName,
                          appBarColor: Colors.black,
                          loader: Center(child: CircularProgressIndicator()),
                          fit: BoxFit.contain,
                        ),
                      ),
                    );

                    if (imagefile != null &&
                        imagefile.containsKey('image_filtered')) {
                      widget.images[selectedIndex] =
                          imagefile['image_filtered'];
                      selectedImage = imagefile['image_filtered'];
                      setState(() {});
                    }
                  },
                  child: Icon(
                    Icons.edit,
                    size: 35,
                  )),
              InkWell(
                onTap: () async {
                  CroppedFile? d = await ImageCropHelper.cropSelectedImage(
                      selectedImage!.path);
                  if (d != null) {
                    selectedImage = File(d.path);
                    widget.images[selectedIndex] = File(d.path);
                    setState(() {});
                  }
                },
                child: Icon(
                  Icons.crop,
                  size: 35,
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Edit Images'),
          actions: [
            InkWell(
                onTap: () {
                  Navigator.pop(context, widget.images);
                },
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(end: 30),
                  child: Icon(Icons.check),
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 400,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 200,
                      width: 200,
                      child: InkWell(
                        onTap: () async {
                          selectedImage = widget.images[index];
                          selectedIndex = index;
                          setState(() {});
//                          var fileName = basename(widget.images[index].path);
//                          var image = imageLib.decodeImage(
//                              await widget.images[index].readAsBytes());
//                          image = imageLib.copyResize(image!, width: 600);
//                          Map? imagefile = await Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                              builder: (context) => PhotoFilterSelector(
//                                title: Text(
//                                  S.of(context).photoFilter,
//                                ),
//                                image: image!,
//                                filters: presetFiltersList,
//                                filename: fileName,
//                                appBarColor: Colors.black,
//                                loader:
//                                    Center(child: CircularProgressIndicator()),
//                                fit: BoxFit.contain,
//                              ),
//                            ),
//                          );
//
//                          if (imagefile != null &&
//                              imagefile.containsKey('image_filtered')) {
//                            widget.images[index] = imagefile['image_filtered'];
//                            setState(() {});
//                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.file(
                            widget.images[index],
                            height: 200,
                            width: 200,
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: widget.images.length,
                ),
              ),
              Divider(
                thickness: 2,
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.file(
                  selectedImage!,
                  height: 400,
                  width: 400,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ));
  }
}
