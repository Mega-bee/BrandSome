import 'package:brandsome/abstracts/module/rout_module.dart';
import 'package:brandsome/posts_module/post_route.dart';
import 'package:brandsome/posts_module/ui/screen/createPost.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class PostModule extends RoutModule {
  final CreatePostScreen _createPost;
  PostModule(this._createPost) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {
      PostRoutes.ADD_POST: (context) => _createPost,
    };
  }
}
