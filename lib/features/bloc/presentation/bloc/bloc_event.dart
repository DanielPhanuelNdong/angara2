import 'package:equatable/equatable.dart';

abstract class BlocEvent extends Equatable {
  const BlocEvent();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable, camel_case_types
class registerDataEvent extends BlocEvent {
  var data;
  String url;
  registerDataEvent({
    required this.data,
    required this.url,
  });

  @override
  List<Object> get props => [data, url];
}

// bloc_event.dart
abstract class WebSocketEvent extends Equatable {
  const WebSocketEvent();
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class SendMessageEvent extends BlocEvent {
  // ignore: prefer_typing_uninitialized_variables
  var message;
  SendMessageEvent({required this.message});

  @override
  List<Object> get props => [message];
}

// ignore: must_be_immutable
class ReceiveMessageEvent extends BlocEvent {
  // ignore: prefer_typing_uninitialized_variables
  var message;
  ReceiveMessageEvent({required this.message});

  @override
  List<Object> get props => [message];
}

// ignore: must_be_immutable
class DisposeEvent extends BlocEvent {}
