import 'dart:convert';
import 'dart:io';

void main() {
  sendMessage("Hello from Flutter");
}

void sendMessage(String message) {
  Socket socket;

  void connectToServer(String serverIP, int serverPort) {
    Socket.connect('192.168.1.101', 12345).then((socket) {
      print('Connected to server');
      socket.writeln(message);
      socket.flush();
      socket.transform(utf8.decoder.cast()).listen((response) {
        print('Received response from server: $response');
      });
    }).catchError((e) {
      print('Error: $e');
    });
  }

  connectToServer('192.168.1.101', 12345);
}
