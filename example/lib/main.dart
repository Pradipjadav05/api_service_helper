import 'package:api_service_helper/api_service_helper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example"),
      ),
      body: ElevatedButton(
        onPressed: () {
          ApiServices()
              .request(
                  ApiService.GET, "https://jsonplaceholder.typicode.com/users")
              .then((response) {
            debugPrint("Response Data: ${response.data}");
          }).catchError((error) {
            debugPrint("Error: $error");
          });
        },
        child: const Text("GET"),
      ),
    );
  }
}
