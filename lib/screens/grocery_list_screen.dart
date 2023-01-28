import 'package:flutter/material.dart';
import '../components/grocery_tile.dart';
import '../models/models.dart';
import 'grocery_item_screen.dart';

class GroceryListScreen extends StatelessWidget {
  final GroceryManager manager;

  const GroceryListScreen({
      super.key,
      required this.manager
  });

  @override
  Widget build(BuildContext context) {
    //TODO: Replace with ListView
    return Container();
  }
}
