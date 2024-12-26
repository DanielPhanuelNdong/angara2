import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:wiso_cash/features/bloc/data/datasources/websocket_service.dart';
import 'package:wiso_cash/features/bloc/data/models/model1/login_model_true.dart';
import 'package:wiso_cash/features/bloc/data/models/model2/model_socket.dart';
import 'package:wiso_cash/features/bloc/data/repositories/register_repository.dart';
import 'package:wiso_cash/features/bloc/presentation/bloc/bloc_event.dart';
import 'package:wiso_cash/features/bloc/presentation/bloc/bloc_state.dart';

class BlocBloc extends Bloc<BlocEvent, BlocState> {
  final DataRepository dataRepository;
  final WebSocketService webSocketService;
  StreamSubscription? webSocketSubscription;
  RegisterModelTrue? resp;
  ModelSocket? resp2;

  BlocBloc(this.dataRepository, this.webSocketService)
      : super(RegisterInitialState()) {
    // Gestion des événements
    on<registerDataEvent>(_handleRegister);
    on<ReceiveMessageEvent>(_handleReceiveMessage);
    on<SendMessageEvent>(_handleSendMessage);
    on<DisposeEvent>(_handleDispose);

    // Écoute des messages WebSocket
    webSocketSubscription = webSocketService.stream.listen((message) {
      //Map decodedMessage = jsonDecode(message);
      add(ReceiveMessageEvent(message: message));
    });
  }

  Future<void> _handleRegister(
      registerDataEvent event, Emitter<BlocState> emit) async {
    emit(RegisterLoadingState());
    try {
      final register = await dataRepository.registerUser(event.data, event.url);
      emit(RegisterSuccessState(register));
    } catch (e) {
      emit(RegisterErrorState(e.toString()));
    }
  }

  Future<void> _handleReceiveMessage(
      ReceiveMessageEvent event, Emitter<BlocState> emit) async {
    emit(RegisterLoadingState());
    try {
      print('response ...................................................');
      print(event.message);
      print('Type de event.message: ${event.message.runtimeType}');

      print('response ...................................................');
      //final re = registerModelTrueFromJson(event.message.toString());
      final re2 = modelSocketFromJson(event.message.toString());
      print('Type converti: ${re2.runtimeType}');
      print(re2);
      print(
          'reponse2222222222222222222222222222222222222222222222222222222222222222222222222');

      emit(WebSocketMessageReceivedState(re2));
    } catch (e) {
      print('erreur--------------------------------------------------');
      print(e);
      emit(WebSocketErrorState(e.toString()));
    }
  }

  void _handleSendMessage(SendMessageEvent event, Emitter<BlocState> emit) {
    try {
      webSocketService.sendMessage(jsonEncode(event.message));
      emit(WebSocketMessageSentState());
    } catch (e) {
      emit(WebSocketErrorState(e.toString()));
    }
  }

  void _handleDispose(DisposeEvent event, Emitter<BlocState> emit) {
    try {
      webSocketService.dispose();
      print('deconnect ...................................................');
      emit(WebSocketDisposeState());
    } catch (e) {
      emit(WebSocketErrorState(e.toString()));
    }
  }

  @override
  Future<void> close() {
    if (webSocketSubscription != null) {
      webSocketSubscription?.cancel();
    }
    webSocketService.dispose();
    return super.close();
  }
}
