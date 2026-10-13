import 'package:flutter/material.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[800],
          leading: const Icon(Icons.home),
          title: const Text('Flutter Layout'),
        ),

        // YANG DIMODIFIKASI
        body: Container(
          margin: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  children: const <Widget>[
                    Icon(Icons.archive),
                    Text(
                      'Artikel Terbaru',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Card(
                  child: Column(
                    children: <Widget>[
                      Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/c/cb/Ringin_Contong_Jombang.jpg?utm_source=id.wikipedia.org&utm_campaign=imageinfo&utm_content=thumbnail_unscaled',
                        height: 200,
                        fit: BoxFit.contain,
                      ),
                      const Text('Candi Prambanan'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
