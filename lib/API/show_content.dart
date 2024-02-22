// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:testing/API/product_detail.dart';
import 'package:testing/Components/modals.dart';
// import 'dart:convert';

import 'api.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    // Use Future.delayed to schedule code to run after initState completes
    Future.delayed(Duration.zero, () {
      // Show the loading modal
      fetchData(context);
    });
  }

  Future<void> fetchData(BuildContext context) async {
    try {
      // Fetch the data from the API
      await DemoApi.fetchData(context);

      // Update the state to stop showing the loading indicator
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      // print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('API LINK'),
      ),
      body: isLoading
          ? Center(
              child: LinearProgressIndicator(
                color: Colors.red[400],
                minHeight: 10,
                backgroundColor: Colors.white,
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns in the grid
                    ),
                    itemCount: DemoApi.dataList.length,
                    itemBuilder: (context, index) {
                      // Extract the data for the current item
                      final item = DemoApi.dataList[index];

                      return InkWell(
                        onTap: () {
                          final product = DemoApi
                              .dataList[index]; // Get the selected product
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailPage(product: product),
                            ),
                          );
                        },
                        child: Card(
                          margin: const EdgeInsets.all(6.0),
                          child: ListTile(
                            title: Text(
                              'ID : ${item['id']}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'TITLE : ${item['title']}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  'PRICE : ${item['price']}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  'DESCRIPTION : ${item['description']}',
                                  maxLines: 3,
                                  style: const TextStyle(
                                      color: Colors.red, fontSize: 12),
                                ),
                                SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Image.network(
                                    item['image'],
                                    fit: BoxFit.cover,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
    );
  }
}
