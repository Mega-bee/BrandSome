import 'package:brandsome/business_details_module/reponse/business_detailes_response.dart';
import 'package:brandsome/posts_module/ui/state/create_post_init.dart';
import 'package:brandsome/test_select_Image/picker_method.dart';
import 'package:brandsome/utils/service/theme_serrvice/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import '../../../abstracts/states/state.dart';
import '../../request/bussines_filter_request.dart';
import '../../state_manager/create_post_state_manager.dart';

@injectable
class CreatePostScreen extends StatefulWidget {
final CreatePostCubit createPostCubit;

const CreatePostScreen({required this.createPostCubit});
  @override
  State<CreatePostScreen> createState() => CreatePostScreenState();
}

class CreatePostScreenState extends State<CreatePostScreen> {
List<Services>? services;
List<City>? cities;
List<AssetEntity> assets = <AssetEntity>[];
CreatePostRequest request = CreatePostRequest(media: []);
bool flags = true;

void refresh(){
  if(mounted){
    setState(() {

    });
  }
}
  createBusinessRequest(CreatePostRequest request) {
    widget.createPostCubit.createPost(request, this);
  }

  @override
  void initState() {
    super.initState();
    cities = [];
    services = [];
//    openImage();
//    widget.createPostCubit.emit(PickImagesState(openImages:selectAssets( PickMethod.cameraAndStay(maxAssetsCount: 9),) ));
  }


  @override
  Widget build(BuildContext context) {
  if(flags){
    flags = false;
    var args = ModalRoute.of(context)?.settings.arguments;
    if(args != null && args is Map){
      services = args["service"] as List<Services>;
      cities = args["city"] as List<City>;
      widget.createPostCubit.emit(CreatePostInit(screenState: this,cities: cities ?? [],services: services ?? []));
  }
    }
    return Scaffold(
      body: BlocBuilder<CreatePostCubit, States>(
          bloc: widget.createPostCubit,
          builder: (context, state) {
            return state.getUI(context);
          }),
    );
  }


Future<void> selectAssets(PickMethod model) async {

  final List<AssetEntity>? result = await model.method(context, assets);
  if (result != null) {
    assets = List<AssetEntity>.from(result);
    if (mounted) {
      setState(() {});
    }
  }
}
}
