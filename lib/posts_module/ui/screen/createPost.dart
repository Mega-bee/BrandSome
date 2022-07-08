import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../../../abstracts/states/state.dart';
import '../../../business_module/business_routes.dart';
import '../../../business_module/ui/state/add_business_state/add_business_init.dart';
import '../../../categories_module/categories_routes.dart';
import '../../../categories_module/reponse/category_response.dart';
import '../../../setting_module/response/add_location_response.dart';
import '../../../home_page/home_route.dart';
import '../../../home_page/state_manager/home_page_state_manager.dart';
import '../state/create_post_success.dart';
import '../../request/bussines_filter_request.dart';
import '../../state_manager/create_post_state_manager.dart';

@injectable
class CreatePost extends StatefulWidget {
final CreatePostCubit createPostCubit;

CreatePost({required this.createPostCubit});
  @override
  State<CreatePost> createState() => CreatePostState();
}

class CreatePostState extends State<CreatePost> {

void refrech(){
  if(mounted){
    setState(() {

    });
  }
}
  createBusinessRequest() {
    widget.createPostCubit.createPost(request, this);
  }
  late CreatePostRequest request;
  @override
  void initState() {
    super.initState();
    request = CreatePostRequest(media: []);
    widget.createPostCubit.emit(CreatePostSuccess(state: this));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).primaryColor,
          ),
        ),
        title: Text("Add Post"),
        actions: [
          IconButton(
            onPressed: () {
              createBusinessRequest();
            },
            icon: Icon(
              Icons.check,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
      body: BlocBuilder<CreatePostCubit, States>(
          bloc: widget.createPostCubit,
          builder: (context, state) {
            return state.getUI(context);
          }),
    );
  }
}
