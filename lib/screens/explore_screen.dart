import 'package:flutter/material.dart';
import '../api/mock_fooderlich_service.dart';
import '../components/components.dart';

class ExploreScreen extends StatelessWidget {
  final mockService = MockFooderlichService();

   ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 1
    return FutureBuilder(
        // 2
        future: mockService.getExploreData(),
        // 3
        builder: (context, snapshot) {
          // TODO: Add Nested List Views
          // 4
          if (snapshot.connectionState == ConnectionState.done) {
            // 5
            final recipes = snapshot.data.todayRecipes;
            // TODO: Replace this with TodayRecipeListView
            return TodayRecipeListView(recipes: recipes);
          } else {
            // 6
            return const Center(
              child: CircularProgressIndicator());
          }
        });
  }
}
