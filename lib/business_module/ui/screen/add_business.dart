import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/business_module/state_manager/add_business_bloc.dart';
import 'package:brandsome/business_module/ui/state/add_business_state/add_business_init.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io' as i;

import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import '../../../setting_module/model/add_location_model.dart';

@injectable
class AddBusiness extends StatefulWidget {
  final AddBusinessCubit _addBusinessCubit;

  const AddBusiness(this._addBusinessCubit);

  @override
  State<AddBusiness> createState() => AddBusinessState();
}

class AddBusinessState extends State<AddBusiness> {
  i.File? image;


  Future  pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = i.File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image $e");
    }
  }

  List<AddLocationModel> selectedLocation = [];

  void refresh(){
    if(mounted){
      setState(() {

      });
    }
  }


  @override
  void initState() {
    super.initState();
    // widget._addBusinessCubit.emit(AddBusinessInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 5,
        title: Text(
          "Add business",
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 28.0),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.check,
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  ))),
        ],
      ),
      body: BlocBuilder<AddBusinessCubit, States>(
          bloc: widget._addBusinessCubit,
          builder: (context, state) {
            return state.getUI(context);
          }),
    );
  }
}
