// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'error_modal.dart';

// class DemoApi {
//   static List<dynamic> dataList = []; // Class variable to store the data

//   static Future<void> fetchData() async {
//     var url = Uri.https('fakestoreapi.com', 'products');
//     // var url = Uri.https('jsonplaceholder.typicode.com', 'posts');
//     var response = await http.get(url);

//     if (response.statusCode == 200) {
//       // If the request is successful, parse the JSON response and store it in the list

//       dataList = jsonDecode(response.body);
//     } else {
//       // Handle the case when the request is not successful
//       print('Failed to load data');
//     }
//   }
// }

class DemoApi {
  static List dataList = [];

  static Future<void> fetchData(BuildContext context) async {
    var client = http.Client();
    try {
      var response =
          await client.get(Uri.https('fakestoreapi.com', 'products'));

      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes));

      DemoApi.dataList = List.from(decodedResponse);
    } catch (e) {
      print('API Error: $e');
      // Check if the error message contains the specific error string
      if (e.toString().contains('No address associated with hostname')) {
        ErrorModal().showMyModal(
            context, 'Network Error: No address associated with hostname');
      } else {
        // Handle other errors as needed
        print('Handling other errors...');
      }
    } finally {
      client.close();
    }
  }
}
