# api_services

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

To use this package, add api_services as a dependency in your pubspec.yaml file.

## Usage

Super simple to use:

```dart
   ApiServices()
    .request(
        ApiService.GET,
        "https://jsonplaceholder.typicode.com/users",
    )
    .then((response) {
        debugPrint("Response Data: ${response.data}");
        debugPrint("NewToken Data: ${ApiUtils.authToken}");
    })
    .catchError((error) {
        debugPrint("Error: $error");
    });
```
## Examples

Performing a `GET` request:

```dart
import 'package:api_services/api_services.dart';

ApiServices()
    .request(
        ApiService.GET,
        "https://jsonplaceholder.typicode.com/users",
    )
    .then((response) {
        debugPrint("Response Data: ${response.data}");
    })
    .catchError((error) {
        debugPrint("Error: $error");
    });
```

Performing a `POST` request:

```dart
ApiServices()
    .request(ApiService.POST, Utils.loginAPI,
        data: Utils.loginBodyData)
    .then((response) {
        debugPrint("Response Data: ${response.data}");
        debugPrint("NewToken Data: ${ApiUtils.authToken}");
    }).catchError((error) {
        debugPrint("Error: $error");
    });
```

