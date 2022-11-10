import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ContectListPage(),
    );
  }
}

class ContectListPage extends StatefulWidget {
  const ContectListPage({Key? key}) : super(key: key);

  @override
  State<ContectListPage> createState() => _ContectListPageState();
}

class _ContectListPageState extends State<ContectListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ContactList'),
      ),
    );
  }
}