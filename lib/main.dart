import 'package:flutter/material.dart';
import 'fooderlich_theme.dart';
import 'home.dart';
import 'package:provider/provider.dart';
import 'models/models.dart';

void main() {
  runApp(const Fooderlich());
}

class Fooderlich extends StatelessWidget {
  const Fooderlich({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = FooderlichTheme.dark();
    return MaterialApp(
        theme: theme,
        title: 'Fooderlich',

        //1
        home: MultiProvider(
          providers: [
            //2
            ChangeNotifierProvider(create: (context) => TabManager()),
            //TODO: Add GroceryManager Provider
            ChangeNotifierProvider(create: (context) => GroceryManager()),
          ],
          child: const Home(),
        ));
  }
}
