import 'dart:io';

import 'package:brandsome/home_page/request/bussines_filter_request.dart';
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
import '../../home_route.dart';
import '../../state_manager/home_page_state_manager.dart';
import '../state/create_post_success.dart';

@injectable
class CreatePost extends StatefulWidget {
final HomePageCubit homePageCubit;

CreatePost({required this.homePageCubit});
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
    widget.homePageCubit.createPost(request, this);
  }
  late CreateBusinessRequest request;
  @override
  void initState() {
    super.initState();
    request = CreateBusinessRequest();
    widget.homePageCubit.emit(CreatePostSuccess(state: this));
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
      body: BlocBuilder<HomePageCubit, States>(
          bloc: widget.homePageCubit,
          builder: (context, state) {
            return state.getUI(context);
          }),
    );
  }
}
