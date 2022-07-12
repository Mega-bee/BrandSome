import 'package:brandsome/abstracts/module/rout_module.dart';
import 'package:brandsome/home_page/home_route.dart';
import 'package:brandsome/posts_module/post_route.dart';
import 'package:brandsome/posts_module/ui/screen/createPost.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../home_page/ui/screen/homePage.dart';

@injectable
class PostModule extends RoutModule {
  final CreatePost _createPost;
  PostModule(this._createPost) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {
      PostRoutes.ADD_POST: (context) => _createPost,
    };
  }
}
