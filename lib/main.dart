import 'package:flutter/material.dart';

void main() => runApp(const HomePage());

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('TOOD\'EM'),
        ),
        body: const Center(
          child: Text('Hello TooD\'em'),
        ),
      ),
    );
  }
}
