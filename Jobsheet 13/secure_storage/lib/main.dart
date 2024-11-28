import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Arya',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final storage = const FlutterSecureStorage();
final myKey = 'myPass';

class _MyHomePageState extends State<MyHomePage> {
  final pwdController = TextEditingController();
  String myPass = "";

  Future writeToSecureStorage() async {
    await storage.write(key: myKey, value: pwdController.text);
  }

  Future<String> readFromSecureStorage() async {
    String secret = await storage.read(key: myKey) ?? '';
    return secret;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Path Provider Arya'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: pwdController,
              ),
              ElevatedButton(
                  onPressed: () {
                    writeToSecureStorage();
                  },
                  child: const Text('Save Value')),
              ElevatedButton(
                  onPressed: () {
                    readFromSecureStorage().then((value) {
                      setState(() {
                        myPass = value;
                      });
                    });
                  },
                  child: const Text('Read Value')),
              Text(myPass)
            ],
          ),
        ),
      ),
    );
  }
}
