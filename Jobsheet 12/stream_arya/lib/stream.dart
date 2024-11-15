import 'package:flutter/material.dart';

class ColorStream {
  final List<Color> colors = [
    Colors.blueGrey,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.teal,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.cyan
  ];

  Stream<Color> getColors() async* {
    //Soal 3
    //Keyword yield* digunakan untuk mengalirkan semua elemen dari stream atau
    //iterable lain ke dalam generator. Pada contoh kode tersebut, yield*
    //mengalirkan elemen-elemen yang dihasilkan oleh Stream.periodic ke dalam
    //stream utama, sehingga setiap satu detik, elemen dari daftar colors akan
    //dihasilkan secara berulang.
    yield* Stream.periodic(const Duration(seconds: 1), (int t) {
      int index = t % colors.length;
      return colors[index];
    });
  }
}
