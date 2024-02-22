// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testing/Components/modals.dart';
import 'dart:convert';

import 'error_modal.dart';

class DemoApi {
  static List dataList = [];

  static Future<void> fetchData(BuildContext context) async {
    var client = http.Client();

    // MySecondModal().showMySpinal(context, 'Loading...');

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
      // MySecondModal().dismissMySpinal();

      client.close();
    }
  }
}
