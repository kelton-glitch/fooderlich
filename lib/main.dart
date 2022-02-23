import 'package:flutter/material.dart';
import 'fooderlich_theme.dart';
import 'home.dart';

void main() {
  runApp(const Fooderlich());
}

class Fooderlich extends StatelessWidget {
  const Fooderlich ({Key key}) : super (key: key);

  final theme= FooderlichTheme.dark();
  @override
  Widget build(Buildcontext context) {

    return MaterialApp(

      theme: theme,
      title: 'Fooderlich';

      home: Scaffold(
        appBar: AppBar(title: Text ('Fooderlich',
        style: theme.textTheme.headline6),),
        body: const Center(child: Text('Let\'s get cooking 👨‍🍳',
        style: theme.textTheme.headline1),),
      ),
    );
  }
}
