import 'package:brandsome/business_details_module/reponse/business_detailes_response.dart';
import 'package:brandsome/posts_module/ui/state/create_post_init.dart';
import 'package:brandsome/test_select_Image/picker_method.dart';
import 'package:brandsome/utils/service/theme_serrvice/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import '../../../abstracts/states/state.dart';
import '../../request/creat_post_request.dart';
import '../../state_manager/create_post_state_manager.dart';

@injectable
class CreatePostScreen extends StatefulWidget {
final CreatePostCubit createPostCubit;

const CreatePostScreen({required this.createPostCubit});
  @override
  State<CreatePostScreen> createState() => CreatePostScreenState();
}

class CreatePostScreenState extends State<CreatePostScreen> {

List<AssetEntity> assets = <AssetEntity>[];
bool flags = true;

void refresh(){
  if(mounted){
    setState(() {

    });
  }
}
  createPostRequest(CreatePostRequest request) {
    widget.createPostCubit.createPost(request, this);
  }

  @override
  void initState() {
    super.initState();
    widget.createPostCubit.getUserBusiness(this);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CreatePostCubit, States>(
          bloc: widget.createPostCubit,
          builder: (context, state) {
            return state.getUI(context);
          }),
    );
  }

}
