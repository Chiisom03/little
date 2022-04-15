import 'package:bloc/bloc.dart';
import 'package:little/cubit/little_cubit_states.dart';
import 'package:little/services/data_services.dart';

import '../model/little_data_model.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }

  final DataServices data;
  late final places;
  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {}
  }

  detailPage(DataModel data) {
    emit(DetailState(data));
  }

  goHome(){
    emit(LoadedState(places));
  }
}
