// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors
import 'package:flutter/material.dart';
import 'dart:convert';

import 'API/api.dart';

class DetailPage extends StatefulWidget {
  final List data;

  const DetailPage({Key? key, required this.data}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('API LINK'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns in the grid
              ),
              itemCount: DemoApi.dataList.length,
              itemBuilder: (context, index) {
                // Extract the data for the current item
                final item = DemoApi.dataList[index];

                return Card(
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
                          style:
                              const TextStyle(color: Colors.red, fontSize: 12),
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
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
