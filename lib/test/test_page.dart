import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<String> fetchGreeting() async {
  final response = await http.get(Uri.parse('http://localhost:3006'));
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load greeting');
  }
}

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlutterNode.js Example'),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: fetchGreeting(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Text('Response: ${snapshot.data}');
            }
          },
        ),
      ),
    );
  }
}
