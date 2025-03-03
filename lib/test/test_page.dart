import 'package:flutter/material.dart';
import 'package:food_shop/models/user_model.dart';
import 'package:food_shop/styles/app_text.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<UserModel> fetchGreeting() async {
  final response = await http.get(
      Uri.parse('http://192.168.8.105:3006')); // Replace with your IP address
  if (response.statusCode == 200) {
    return UserModel.fromJson(jsonDecode(response.body));
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
        title: Text('Flutter Node.js Example'),
      ),
      body: Center(
        child: FutureBuilder<UserModel>(
          future: fetchGreeting(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Text('Error: ${snapshot.error}');
            } else {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  spacing: 16,
                  children: [
                    Text(
                      'Response: ${snapshot.data?.message ?? "No data"}',
                      style: AppText.heading1,
                    ),
                    Text(
                      'Response: ${snapshot.data?.status ?? "No data"}',
                      style: AppText.heading1,
                    ),
                    Text(
                      'Response: ${snapshot.data?.userData.name ?? "No data"}',
                      style: AppText.heading1,
                    ),
                    Text(
                      'Response: ${snapshot.data?.userData.age ?? "No data"}',
                      style: AppText.heading1,
                    ),
                    Text(
                      'Response: ${snapshot.data?.userData.email ?? "No data"}',
                      style: AppText.heading1,
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
