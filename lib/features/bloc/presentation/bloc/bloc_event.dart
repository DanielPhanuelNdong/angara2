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
  List<Object> get props => [data];
}

// ignore: must_be_immutable, camel_case_types
class envoieWalletEvent extends BlocEvent {
  var data;
  String url;
  envoieWalletEvent({
    required this.data,
    required this.url,
  });

  @override
  List<Object> get props => [data];
}
// ignore: must_be_immutable, camel_case_types
// class loginDataEvent extends BlocEvent {
//   var data;
//   String url;
//   loginDataEvent({
//     required this.data,
//     required this.url,
//   });

//   @override
//   List<Object> get props => [data];
// }
