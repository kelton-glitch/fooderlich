import 'package:flutter/material.dart';
import '../api/mock_fooderlich_service.dart';
import '../components/components.dart';

class ExploreScreen extends StatelessWidget {
  // 1
  final mockService = MockFooderlichService();
  ExploreScreen({Key ? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // 2
    // TODO 1: Add TodayRecipeListView FutureBuilder
    return FutureBuilder(
        // 2
        future: mockService.getExploreData(),
        // 3
        builder: (context, snapshot) {
          // TODO: Add Nested List Views
          // 4
          if (snapshot.connectionState == ConnectionState.done) {
            // 5
            final recipes = snapshot.data!.todayRecipes;
            // TODO: Replace this with TodayRecipeListView
            return Center(
                child:
                    Container(child: const Text('Show TodayRecipeListView')));
          } else {
            // 6
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
