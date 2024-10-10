import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemPage extends StatelessWidget {
  final String id; // Menyimpan ID yang diterima

  const ItemPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mengambil parameter dari GoRouterState
    final args = GoRouterState.of(context).extra as Map<String, dynamic>? ?? {};

    return Scaffold(
      appBar: AppBar(title: Text('Item Detail')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'product-image-$id', // Menggunakan id untuk tag Hero
              child: Image.asset(
                '${args['photo']}', // Mengambil foto dari args
                width: 100,
                height: 100,
              ),
            ),
            SizedBox(width: 20), // Spasi antara gambar dan teks
            // Menampilkan informasi produk
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    '${args['name'] ?? 'Unknown Name'}'), // Default jika name null
                Text(
                    'Price: ${args['price'] ?? 'N/A'}'), // Default jika price null
                Text(
                    'Stock: ${args['stock'] ?? 'N/A'}'), // Default jika stock null
                Text(
                    'Rating: ${args['rating'] ?? 'N/A'}'), // Default jika rating null
              ],
            ),
          ],
        ),
      ),
    );
  }
}
