import 'package:brandsome/setting_module/repository/location_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../abstracts/states/state.dart';
import '../../response/add_location_response.dart';
import '../../state_manager/location_state_manager.dart';
@injectable
class AddLocationScreen extends StatefulWidget {
final LocationCubit locationCubit;
AddLocationScreen(this.locationCubit);
  @override
  State<AddLocationScreen> createState() => AddLocationScreenState();
}

class AddLocationScreenState extends State<AddLocationScreen> {



void refrech(){
  if(mounted){
    setState(() {

    });
  }
}

List<AddLocationResponse> selectedLocation=[];
returnedLocation() {
  print("selectedLocation${selectedLocation}");
  Navigator.pop(context, selectedLocation);
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: Text('Select Location'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: IconButton(
              onPressed: () {
                returnedLocation();
              },
              icon: Icon(
                Icons.check,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<LocationCubit, States>(
          bloc: widget.locationCubit,
          builder: (context, state) {
            return state.getUI(context);
          }),
    );
  }

@override
  void initState() {
      widget.locationCubit.getLocation(this);
  }
}
