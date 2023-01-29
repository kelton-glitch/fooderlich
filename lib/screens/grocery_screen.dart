import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'empty_grocery_screen.dart';
import 'package:fooderlich/models/models.dart';
import 'grocery_item_screen.dart';
import 'grocery_list_screen.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO:Add a scaffold widget
    return Scaffold(
      //6
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          //TODO: Present GroceryItemScreen
          final manager = Provider.of<GroceryManager>(context, listen: false);
          //2
          Navigator.push(
            context,
            //3
            MaterialPageRoute(
              builder: (context) => GroceryItemScreen(
                onCreate: (item) {
                  manager.addItem(item);
                  Navigator.pop(context);
                },
                onUpdate: (item) {},
              ),
            ),
          );
        },
      ),
      //7
      body: buildGroceryScreen(),
    );
  }

  //TODO: Add buildGroceryScreen
  Widget buildGroceryScreen() {
    return Consumer<GroceryManager>(builder: (context, manager, child) {
      //3
      if (manager.groceryItems.isNotEmpty) {
        //GroceryListScreen
        return GroceryListScreen(manager: manager);
      } else {
        //4
        return const EmptyGroceryScreen();
      }
    });
  }
}
