import 'package:flutter/material.dart';


class ProductDetailPage extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID: ${product['id']}'),
            Text('Title: ${product['title']}'),
            Text('Price: ${product['price']}'),
            Text('Description: ${product['description']}'),
            // You can add more details here...
          ],
        ),
      ),
    );
  }
}
