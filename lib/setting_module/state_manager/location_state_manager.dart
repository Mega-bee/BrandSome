import 'package:brandsome/abstracts/states/error_state.dart';
import 'package:brandsome/abstracts/states/loading_state.dart';
import 'package:brandsome/abstracts/states/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../repository/location_repository.dart';
import '../response/add_location_response.dart';
import '../ui/screen/add_location.dart';
import '../ui/state/location_success.dart';

@injectable
class LocationCubit extends Cubit<States> {
  final LocationRepository _locationRepository;

  LocationCubit(this._locationRepository) : super(LoadingState());

  getLocation(AddLocationScreenState state) {
    emit(LoadingState());
    _locationRepository.getLocation().then((value) {
      if (value == null) {
        emit(ErrorState(errorMessage: 'Connection error', retry: (){
          getLocation(state);
        }));
      } else if (value.code == 200) {
        List<AddLocationResponse> loca = [];
        for (var item in value.data.insideData) {
          loca.add(AddLocationResponse.fromJson(item));
        }
        emit(LocationSuccess(loca,state));
      }
    });
  }


}
