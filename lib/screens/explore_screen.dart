import 'package:flutter/material.dart';
import '../api/mock_fooderlich_service.dart';
import '../components/components.dart';

class ExploreScreen extends StatelessWidget {
  // 1
  final mockService = MockFooderlichService();
  ExploreScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    // TODO 1: Add TodayRecipeListView FutureBuilder
    return FutureBuilder(
        // 2
        future: mockService.getExploreData(),
        // 3
        builder: (context, snapshot) {
          // TODO: Add Nested List Views
          // 4
          if (snapshot.connectionState == ConnectionState.done) {
            // TODO: Replace this with TodayRecipeListView
            return ListView(scrollDirection: Axis.vertical, children: [
              TodayRecipeListView(recipes: snapshot.data.todayRecipes),

              const SizedBox(height: 16),

              //TODO: Replace this with FriendPostListView
              Container(height: 400, color: Colors.green)
            ]
            );
          } else {
            // 6
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
