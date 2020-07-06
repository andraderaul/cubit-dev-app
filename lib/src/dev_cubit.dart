import 'package:cubit/cubit.dart';

import 'dev_repository.dart';
import 'dev_state.dart';

class DevCubit extends Cubit<DevState> {
  final DevRepository repository;

  DevCubit({this.repository}) : super(InitialState()) {
    _getDev();
  }

  void _getDev() async {
    try {
      emit(LoadingState());
      final dev = await repository.getDev();
      emit(LoadedState(dev));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
