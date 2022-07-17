import 'package:brandsome/posts_module/request/bussines_filter_request.dart';
import 'package:brandsome/utils/images/images.dart';
import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';
import '../../../abstracts/states/state.dart';
import '../screen/createPost.dart';

class CreatePostInit extends States {
  CreatePostScreenState screenState;

  CreatePostInit({required this.screenState}) : super(false);

  final _formKeyCreateBusiness = GlobalKey<FormState>();
  final description = TextEditingController();

//  final ImagePicker _picker = ImagePicker();
//  List<XFile> imageFileList = [];

  late CreatePostRequest request;

//  Future<List<XFile>?> selectedImages() async {
//    final List<XFile>? selectedImages = await _picker.pickMultiImage();
//    return selectedImages;
//  }

  @override
  Widget getUI(BuildContext context) {
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
        title: const Text("Add Post"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.check,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: ListTile(
              title: Text('Tannn'),
              subtitle: Row(
                children: [
                  FilterChip(
                    avatar: Icon(Icons.category),
                    label: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text("ping pong"),
                    ),
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    onSelected: (bool value) {
                      print("selected");
                    },
                  ),
                  SizedBox(width: 8,),
//                  DropdownButton<String>(
//                    items: <String>['A', 'B', 'C', 'D'].map((String value) {
//                      return DropdownMenuItem<String>(
//                        value: value,
//                        child: Text(value),
//                      );
//                    }).toList(),
//                    onChanged: (_) {},
//                    underline: Container(),
//                    icon: Icon(Icons.location_on),
//                  ),
                  FilterChip(
                    avatar: Icon(Icons.location_on),
                    label: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text("zahla"),
                    ),
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    onSelected: (bool value) {
                      print("selected");
                    },
                  ),
                ],
              ),
              leading: CircleAvatar(backgroundImage: AssetImage(ImageAsset.TEST_IMAGE)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget getAlert(BuildContext context) {
    // TODO: implement getAlert
    throw UnimplementedError();
  }
}
