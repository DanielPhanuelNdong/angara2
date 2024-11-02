import 'package:equatable/equatable.dart';
import 'package:wiso_cash/features/bloc/data/models/index.dart';

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

// class EnvoieWalletLoadingState extends BlocState {}

// // ignore: must_be_immutable
// class EnvoieWalletSuccessState extends BlocState {
//   RegisterModelTrue? register;
//   EnvoieWalletSuccessState(this.register);
// }

// // ignore: must_be_immutable
// class EnvoieWalletErrorState extends BlocState {
//   String error;
//   EnvoieWalletErrorState(this.error);
//   @override
//   List<Object> get props => [
//         error,
//       ];
// }
