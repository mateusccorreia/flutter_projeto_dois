import 'package:flutter/material.dart';
import 'package:flutter_projeto_dois/screens/home.dart';

//freezed
//building running

void main() {
  runApp(
    const MyApp(
      a: '',
      key: Key(''),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.a,
  });

  final String a;

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: Home(),
    );
  }
}
