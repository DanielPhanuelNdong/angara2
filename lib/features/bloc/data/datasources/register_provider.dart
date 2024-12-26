import 'dart:async';

import 'package:dio/dio.dart';
import 'package:wiso_cash/features/bloc/data/models/model1/index.dart';

class DataProvider {
  RegisterModelTrue? register;
  // final Uri wsUrl = Uri.parse('ws://31.207.36.234:40111');
  // WebSocketChannel? _channel;

  RegisterModelTrue? get registerModel {
    return register;
  }

  Future<RegisterModelTrue?> registerUser(var data, String url) async {
    var dio =
        Dio(BaseOptions(baseUrl: "https://metierangarapay.sowitelsrv.com/"));
    try {
      var formData = FormData.fromMap(data);
      Response response = await dio.post(url, data: formData);
      if (response.statusCode == 200) {
        register = registerModelTrueFromJson(response.toString());

        return registerModelTrueFromJson(response.toString());
      }
    } on DioException catch (e) {
      print(e);
      // if (e.error is SocketException || e.type == DioExceptionType.other) {
      //   rethrow;
      // }
      // if (e.type == DioExceptionType.response) {
      //   return null;
      // }
    }
    return null;
  }

  Future<RegisterModelTrue?> socket(var rep) async {
    try {
      register = registerModelTrueFromJson(rep.toString());

      return register;
    } on DioException catch (e) {
      print(e);
      // if (e.error is SocketException || e.type == DioExceptionType.other) {
      //   rethrow;
      // }
      // if (e.type == DioExceptionType.response) {
      //   return null;
      // }
    }
    return null;
  }

//   Future<RegisterModelTrue?> socket(var data) async {
//     try {
//       //Envoie des données au serveur
//       //var formData = FormData.fromMap(data);
//       var jsonData = jsonEncode(data);
//       _channel.sink.add(jsonData);

//       // Écoute les réponses du serveur
//       _channel.stream.listen(
//         (data) async {
//           print('Received: $data');
//           // Traitement des données reçues
//           register = registerModelTrueFromJson(data.toString());
//           //await prefs.setString('donnees', data);
//         },
//         onError: (error) {
//           print('WebSocket error: $error');
//           _handleConnectionError();
//         },
//         onDone: () {
//           print('WebSocket closed');
//           _handleConnectionError();
//         },
//       );

//       _isConnected = true;
//       return register;
//     } catch (e) {
//       print('Connection error: $e');
//       _handleConnectionError();
//       return null;
//     }
//   }

//   void _handleConnectionError() {
//     _isConnected = false;
//     _channel.sink.close();
//     _attemptReconnect();
//   }

//   void _attemptReconnect() async {
//     final prefs = await SharedPreferences.getInstance();
//     if (_reconnectTimer == null || !_reconnectTimer!.isActive) {
//       _reconnectTimer = Timer(Duration(seconds: _reconnectInterval), () {
//         print('Attempting to reconnect...');
//         final data1 = prefs.getString('data1');
//         socket(
//             data1); // Appelez connectSocket avec les données requises pour la reconnexion
//       });
//     }
//   }

//   void closeConnection() {
//     _reconnectTimer?.cancel();
//     _channel.sink.close();
//   }
}
