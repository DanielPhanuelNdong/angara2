// websocket_service.dart
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  final WebSocketChannel channel;

  WebSocketService()
      : channel =
            WebSocketChannel.connect(Uri.parse('ws://31.207.36.234:40111'));

  Stream<dynamic> get stream => channel.stream;

  void sendMessage(var message) {
    channel.sink.add(message);
  }

  void dispose() {
    channel.sink.close();
  }
}
