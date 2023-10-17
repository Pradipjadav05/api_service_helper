# api_service_helper

ApiServices for making HTTP requests using the Dio package in a Flutter application. It supports various HTTP methods (GET, POST, PUT, DELETE) and provides flexibility for passing data, query parameters, authentication tokens, and progress callbacks. The class encapsulates the request logic and handles errors, including debugging through debugPrint. This code promotes code reusability and maintainability when interacting with APIs in a Flutter app.


## Features

- HTTP Request Handling: The class facilitates making HTTP requests (GET, POST, PUT, DELETE) to remote APIs using the Dio package.
- Flexibility: It allows sending data, query parameters, and an optional authentication token with each request.
- Progress Tracking: Supports tracking the progress of data upload and download with onSendProgress and onReceiveProgress callbacks.
- Error Handling: Catches and handles errors during the request process and provides debugging information using debugPrint.
- Reusable Code: Encapsulates HTTP request logic into a single class, promoting code reusability and maintainability in a Flutter application.
- Header Management: Automatically sets the 'Content-Type' header to 'application/json' and adds an 'Authorization' header if an authentication token is provided.
- Cancelation Support: Allows canceling ongoing requests using the provided cancelToken.
- Versatility: Supports various HTTP methods, making it suitable for different API interactions.


## Getting started

To use this package, add api_service_helper as a dependency in your pubspec.yaml file.

## Usage

Super simple to use:
- Import the API service helper package.

```dart
    import 'package:api_service_helper/api_service_helper.dart';
```

- Initialize an instance of ApiServices with a base URL.

```dart
    ApiServices myServices = ApiServices(baseUrl: "https://jsonplaceholder.typicode.com");
```
## Examples

Performing a `GET` request:

```dart
    // Make a GET request to "/users" and handle the response.
    myServices.request(
        HttpMethod.get, "/users").then((response) {
        debugPrint("Response Data: ${response.data}");
        }).catchError((error) {
        debugPrint("Error: $error");
    });
```

Performing a `POST` request:

```dart
    myServices.request(
        HttpMethod.post, "/users/post", data: data).then((response) {
        debugPrint("Response Data: ${response.data}");
        }).catchError((error) {
        debugPrint("Error: $error");
    });
```

