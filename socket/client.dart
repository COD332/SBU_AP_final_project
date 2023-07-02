import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TextEditingController _messageController = TextEditingController();

  void _sendMessage(String message) {
    Socket.connect('192.168.1.101', 12345).then((socket) {
      print('Connected to server');

      socket.writeln(message); // Write the message to the socket with a newline
      socket.flush();

      // Read the response from the server
      socket.transform(utf8.decoder.cast()).listen((response) {
        print('Received response from server: $response');
      });

      socket.close();
    }).catchError((e) {
      print('Error: $e');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Socket Chat',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Socket Chat'),
        ),
        body: Column(
          children: [
            TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Type a message',
                contentPadding: EdgeInsets.all(16.0),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String message = _messageController.text;
                _messageController.clear();

                _sendMessage(message);
              },
              child: Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}
