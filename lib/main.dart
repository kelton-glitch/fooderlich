import 'package:flutter/material.dart';
import 'fooderlich_theme.dart';
import 'home.dart';

void main() {
  runApp(const Fooderlich());
}

class Fooderlich extends StatelessWidget {
  //2
  const Fooderlich({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = FooderlichTheme.dark();
    // TODO: Apply Home Widget
    //3
    return MaterialApp(
      // TODO: Add theme
      theme: theme,
      title: 'Fooderlich',
      home:const Home(),
    );
  }
}