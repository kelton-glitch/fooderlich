import 'package:flutter/material.dart';
import 'fooderlich_theme.dart';
import 'home.dart';

void main() {
  runApp(Fooderlich());
}

class Fooderlich extends StatelessWidget {
   Fooderlich ({Key? key}) : super (key: key);

  final theme= FooderlichTheme.dark();
  @override
  Widget build(BuildContext context) {

    // ignore: dead_code
    return MaterialApp(

      theme: theme,
      title: 'Fooderlich',
      home: const Home(),
      );
  }
}
