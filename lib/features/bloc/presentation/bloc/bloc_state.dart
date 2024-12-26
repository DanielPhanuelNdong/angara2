import 'package:equatable/equatable.dart';
import 'package:wiso_cash/features/bloc/data/models/model1/index.dart';
import 'package:wiso_cash/features/bloc/data/models/model2/model_socket.dart';

abstract class BlocState extends Equatable {
  const BlocState();

  @override
  List<Object> get props => [];
}

class RegisterInitialState extends BlocState {}

class RegisterLoadingState extends BlocState {}

// ignore: must_be_immutable
class RegisterSuccessState extends BlocState {
  RegisterModelTrue? register;
  RegisterSuccessState(this.register);
}

// ignore: must_be_immutable
class RegisterErrorState extends BlocState {
  String error;
  RegisterErrorState(this.error);
  @override
  List<Object> get props => [
        error,
      ];
}

// bloc_state.dart
abstract class WebSocketState extends Equatable {
  const WebSocketState();

  @override
  List<Object> get props => [];
}

class WebSocketInitial extends BlocState {}

class WebSocketMessageSentState extends BlocState {}

// ignore: must_be_immutable
class WebSocketMessageReceivedState extends BlocState {
  // ignore: prefer_typing_uninitialized_variables
  ModelSocket? message;
  WebSocketMessageReceivedState(
    this.message,
  );
}

// ignore: must_be_immutable
class WebSocketErrorState extends BlocState {
  String error;
  WebSocketErrorState(this.error);

  @override
  List<Object> get props => [error];
}

// ignore: must_be_immutable
class WebSocketDisposeState extends BlocState {}
