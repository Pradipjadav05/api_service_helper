import 'package:api_services/api_services.dart';
import 'package:flutter/material.dart';

import 'utils/api_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Package"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            /*
            * Login
            * */

            ElevatedButton(
              onPressed: () {
                debugPrint("\n\n------------Login--------------\n");
                ApiServices()
                    .request(ApiService.POST, ApiUtils.loginAPI,
                        data: ApiUtils.loginBodyData)
                    .then((response) {
                  ApiUtils.authToken = response.data["DataModel"]["NewToken"];
                  debugPrint("Response Data: ${response.data}");
                  debugPrint("NewToken Data: ${ApiUtils.authToken}");
                }).catchError((error) {
                  debugPrint("Error: $error");
                });
              },
              child: const Text("Login Button"),
            ),

            /*
            * Access Company
            * */
            ElevatedButton(
              onPressed: () {
                debugPrint("\n\n------------Access Company--------------\n");
                ApiServices()
                    .request(ApiService.POST, ApiUtils.accessCompanyAPI,
                        queryParameters: {"C05101": 35},
                        authToken: ApiUtils.authToken)
                    .then((response) {
                  debugPrint("Response Data: ${response.data}");
                  debugPrint("NewToken Data: ${ApiUtils.authToken}");
                }).catchError((error) {
                  debugPrint("Error: $error");
                });
              },
              child: const Text("ACCESS COMPANY"),
            ),

            /*
            * Account Master
            * */
            ElevatedButton(
              onPressed: () {
                debugPrint("\n\n------------Account Master--------------\n");
                ApiServices()
                    .request(ApiService.POST, ApiUtils.accountMasterAPI,
                        data: ApiUtils.accountMasterPayLoad,
                        authToken: ApiUtils.authToken)
                    .then((response) {
                  debugPrint("Response Data: ${response.data}");
                  debugPrint("NewToken Data: ${ApiUtils.authToken}");
                }).catchError((error) {
                  debugPrint("Error: $error");
                });
              },
              child: const Text("ACCOUNT MASTER"),
            ),

            /*
            * Add Account
            * */
            ElevatedButton(
              onPressed: () {
                debugPrint("\n\n------------Add Account--------------\n");
                ApiServices()
                    .request(
                  ApiService.POST,
                  ApiUtils.addAccountAPI,
                  data: ApiUtils.addAccountData,
                  authToken: ApiUtils.authToken,
                )
                    .then((response) {
                  debugPrint("Response Data: ${response.data}");
                  debugPrint("NewToken Data: ${ApiUtils.authToken}");
                }).catchError((error) {
                  debugPrint("Error: $error");
                });
              },
              child: const Text("ADD ACCOUNT"),
            ),

            /*
            * Delete Account
            * */
            ElevatedButton(
              onPressed: () {
                debugPrint("\n\n------------Delete Account--------------\n");

                ApiServices()
                    .request(
                  ApiService.DELETE,
                  ApiUtils.deleteAccountAPI,
                  queryParameters: {"id": 77},
                  authToken: ApiUtils.authToken,
                )
                    .then((response) {
                  debugPrint("Response Data: ${response.data}");
                  debugPrint("NewToken Data: ${ApiUtils.authToken}");
                }).catchError((error) {
                  debugPrint("Error: $error");
                });
              },
              child: const Text("DELETE ACCOUNT"),
            ),
            /*
            * GET
            * */
            ElevatedButton(
              onPressed: () {
                debugPrint("\n\n------------GET--------------\n");

                ApiServices()
                    .request(
                  ApiService.GET,
                  "https://jsonplaceholder.typicode.com/users",
                )
                    .then((response) {
                  debugPrint("Response Data: ${response.data}");
                  debugPrint("NewToken Data: ${ApiUtils.authToken}");
                }).catchError((error) {
                  debugPrint("Error: $error");
                });
              },
              child: const Text("GET"),
            ),
          ],
        ),
      ),
    );
  }
}
