import 'package:flutter/material.dart';
import '../models/item.dart';
import '../widgets/list_view_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required});
  @override
  Widget build(BuildContext context) {
    final List<Item> items = [
      Item(
          name: 'Sugar',
          price: 5000,
          photo: 'assets/sugar.jpg',
          stock: 10,
          rating: 5),
      Item(
          name: 'Salt',
          price: 2000,
          photo: 'assets/salt.jpg',
          stock: 5,
          rating: 4),
      Item(
          name: 'Rice',
          price: 15000,
          photo: 'assets/rice.jpg',
          stock: 20,
          rating: 5),
    ];
    return Scaffold(
      appBar: AppBar(title: Text('Shopping List')),
      body: Column(
        children: [
          Expanded(child: ListViewWidget(items: items)),
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.blueAccent,
            child: Text(
              'Arya Chandra Kusuma 2241720228',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
