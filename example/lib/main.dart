import 'package:api_service_helper/api_service_helper.dart'; // Import the API service helper package.
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
      home:
          const HomeScreen(), // Display the HomeScreen as the root of the app.
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize an instance of ApiServices with a base URL.
    ApiServices myServices =
        ApiServices(baseUrl: "https://jsonplaceholder.typicode.com");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Example"),
      ),
      body: ElevatedButton(
        onPressed: () {
          // Make a GET request to "/users" and handle the response.
          myServices.request(HttpMethod.get, "/users").then((response) {
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
