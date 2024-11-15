import 'package:flutter/material.dart';
import 'stream.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Arya',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: const StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  Color bgColor = Colors.blueGrey;
  late ColorStream colorStream;
  int lastNumber = 0;
  late StreamController numberStreamController;
  late NumberStream numberStream;

  /*Soal 5
  listen: Asinkron secara paralel; melanjutkan eksekusi program tanpa menunggu
  stream selesai.
  await for: Asinkron secara berurutan; menunggu setiap elemen
  selesai diproses sebelum melanjutkan ke elemen berikutnya atau kode
  berikutnya.*/
  void changeColor() async {
    colorStream.getColors().listen((eventColor) {
      setState(() {
        bgColor = eventColor;
      });
    });

    // await for (var eventColor in colorStream.getColors()) {
    //   setState(() {
    //     bgColor = eventColor;
    //   });
    // }
  }

  /* Soal 6 langkah 8
  Kode berikut menginisialisasi stream (numberStream) dan menambahkan
  pendengar untuk memproses data yang masuk. Setiap kali event diterima, state
  diperbarui melalui setState() untuk menyimpan nilai terakhir (lastNumber).
  super.initState() memastikan inisialisasi awal State berjalan sesuai siklus
  hidup widget Flutter.*/
  @override
  void initState() {
    numberStream = NumberStream();
    numberStreamController = numberStream.controller;
    Stream stream = numberStreamController.stream;
    stream.listen((event) {
      setState(() {
        lastNumber = event;
      });
    });
    super.initState();

    //void initState() {
    //  super.initState();
    //  colorStream = ColorStream();
    //  changeColor();
    //}
  }

  @override
  void dispose() {
    numberStreamController.close();
    super.dispose();
  }

  /* soal 6 langkah 10
  Kode berikut menghasilkan angka acak antara 0 hingga 9 menggunakan
  Random().nextInt(10), kemudian menambahkannya ke stream dengan memanggil
  numberStream.addNumberToSink(myNum), yang mengalirkan angka tersebut ke sink
  dari stream untuk diproses lebih lanjut. */
  void addRandomNumber() {
    Random random = Random();
    int myNum = random.nextInt(10);
    numberStream.addNumberToSink(myNum);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Stream Arya'),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(lastNumber.toString()),
              ElevatedButton(
                  onPressed: () => addRandomNumber(),
                  child: Text('New Random Number'))
            ],
          ),
        ));
  }
}
