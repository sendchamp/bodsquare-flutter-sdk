import 'package:bodsquare_sdk/bodsquare_sdk.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bodsquare_sdk Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Bodsquare_sdk Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final BodsquareSdk _bodsquareSdk = BodsquareSdk();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: ElevatedButton(
                onPressed: () => _bodsquareSdk.getChannels(
                    context: context,
                    email: 'youremail@email.com',
                    userName: 'yourusername'),
                child: const Text('Bodsquare channels'))));
  }
}
