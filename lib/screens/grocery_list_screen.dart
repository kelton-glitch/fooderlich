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
    final groceryItems = manager.groceryItems;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
          itemBuilder: (context, index) {
            final item = groceryItems[index];
            //TODO: Wrap in a Dismissable
            //TODO: Wrap in an Inkwell
            return GroceryTile(
              key: Key(item.id),
                item: item,
              onComplete: (change) {
                if (change != null) {
                  manager.completeItem(index, change);
                }
              },
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 16.0);
          },
          itemCount: groceryItems.length,
      ),
    );
  }
}
