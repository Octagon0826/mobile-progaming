import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Callback Example',
      home: CallbackExample(),
    );
  }
}

class CallbackExample extends StatelessWidget {
  const CallbackExample({super.key});


//Membuat fungsi callback yang menerima string sebagai argumen
void _showMessage(String message) {
    debugPrint('Callback received: $message');
    //Di sini,Anda dapat menambahkan logika lain sesuai kebutuhan aplikasi Anda
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Callback Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Memanggil fungsi callback saat tombol ditekan
                _showMessage('Button Pressed!');
              },
              child: const Text('Press Me'),
        ),
          ],
      ),
      ),
    );
  }
}