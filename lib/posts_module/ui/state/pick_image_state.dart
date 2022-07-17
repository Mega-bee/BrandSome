
import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/posts_module/model/file_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PickImagesState extends States {
  final Future<void>   openImages;
  PickImagesState({required this.openImages}) : super(false);

  @override
  Widget getAlert(BuildContext context) {
    // TODO: implement getAlert
    throw UnimplementedError();
  }

  List<FileModel>? files;
  FileModel? selectedModel;
  String? image;

  @override
  Widget getUI(BuildContext context) {
    return Container();
  }
}
