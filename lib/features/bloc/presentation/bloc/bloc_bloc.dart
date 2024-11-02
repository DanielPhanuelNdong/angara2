import 'package:bloc/bloc.dart';
import 'package:wiso_cash/features/bloc/data/repositories/register_repository.dart';
import 'package:wiso_cash/features/bloc/presentation/bloc/bloc_event.dart';
import 'package:wiso_cash/features/bloc/presentation/bloc/bloc_state.dart';

class BlocBloc extends Bloc<BlocEvent, BlocState> {
  final DataRepository dataRepository;
  BlocBloc(
    this.dataRepository,
  ) : super(RegisterInitialState()) {
    on<registerDataEvent>((event, emit) async {
      emit(RegisterLoadingState());
      try {
        final register =
            await dataRepository.registerUser(event.data, event.url);
        emit(RegisterSuccessState(register));
      } catch (e) {
        emit(RegisterErrorState(e.toString()));
      }
    });

    on<envoieWalletEvent>((event, emit) async {
      emit(RegisterLoadingState());
      try {
        final register =
            await dataRepository.envoieWallet(event.data, event.url);
        emit(RegisterSuccessState(register));
      } catch (e) {
        emit(RegisterErrorState(e.toString()));
      }
    });
  }
}
