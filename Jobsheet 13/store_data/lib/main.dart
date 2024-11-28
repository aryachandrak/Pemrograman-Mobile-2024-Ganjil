import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'pizza.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JSON Demo ',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Pizza> myPizzas = [];
  String pizzaString = '';
  String documentsPath = '';
  String tempPath = '';
  late File myFile;
  String fileText = '';

  Future<bool> writeFile() async {
    try {
      await myFile.writeAsString('Margherita, Capricciosa, Napoli');
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> readFile() async {
    try {
      String fileContent = await myFile.readAsString();
      setState(() {
        fileText = fileContent;
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future getPath() async {
    final docDir = await getApplicationDocumentsDirectory();
    final tempDir = await getTemporaryDirectory();
    setState(() {
      documentsPath = docDir.path;
      tempPath = tempDir.path;
    });
  }

  String convertToJson(List<Pizza> pizzas) {
    return jsonEncode(pizzas.map((pizza) => jsonEncode(pizza)).toList());
  }

  Future<List<Pizza>> readJsonFile() async {
    String myString = await DefaultAssetBundle.of(context)
        .loadString('assets/pizzalist.json');
    List pizzaMapList = jsonDecode(myString);
    List<Pizza> myPizzas = [];
    for (var pizza in pizzaMapList) {
      Pizza myPizza = Pizza.fromJson(pizza);
      myPizzas.add(myPizza);
    }
    String json = convertToJson(myPizzas);
    print(json);
    return myPizzas;
  }

  @override
  void initState() {
    super.initState();
    getPath().then((_) {
      myFile = File('$documentsPath/pizzas.txt');
      writeFile().then((success) {
        if (success) {
          print('File written successfully.');
        } else {
          print('Failed to write file.');
        }
      });
    });
    // readJsonFile().then((value) {
    //   setState(() {
    //     myPizzas = value;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('JSON'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Doc path: $documentsPath'),
            Text('Temp path: $tempPath'),
            ElevatedButton(
                onPressed: () => readFile(), child: const Text('Read File')),
            Text(fileText)
          ],
        )
        // ListView.builder(
        //     itemCount: myPizzas.length,
        //     itemBuilder: (context, index) {
        //       return ListTile(
        //         title: Text(myPizzas[index].pizzaName),
        //         subtitle: Text(myPizzas[index].description),
        //       );
        //     }),
        );
  }
}
