import 'package:equatable/equatable.dart';
import 'dev_model.dart';

abstract class DevState extends Equatable {}

class InitialState extends DevState {
  @override
  List<Object> get props => [];
}

class LoadingState extends DevState {
  @override
  List<Object> get props => [];
}

class LoadedState extends DevState {
  LoadedState(this.dev);

  final DevModel dev;

  @override
  List<Object> get props => [dev];
}

class ErrorState extends DevState {
  @override
  List<Object> get props => [];
}
