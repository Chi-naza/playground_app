import 'package:flutter/material.dart';
import 'package:playground_app/services/counter_class.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CounterClass _counterClass = CounterClass();

  void incrementCounter() {
    _counterClass.incrementCounter();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chinaza App")),
      body: Center(
        child: Text(
          "Hello World of Home Screen (${_counterClass.counter})",
          style: TextStyle(color: Colors.red, fontFamily: "Inter"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: incrementCounter,
        backgroundColor: Colors.white54,
        child: const Icon(Icons.person_add_alt),
      ),
    );
  }
}
