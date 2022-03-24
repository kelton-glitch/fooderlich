import 'package:flutter/material.dart';
import '../api/mock_fooderlich_service.dart';
import '../components/components.dart';

class ExploreScreen extends StatelessWidget {
  final mockService = MockFooderlichService();

  ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: mockService.getExploreData(),
        builder: (context, snapshot) {
          // TODO: Add Nested List View
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView(
              scrollDirection: Axis.vertical,
              children: [
                TodayRecipeListView(recipes: snapshot.data.todayRecipes),

                const SizedBox(height: 16),

                //TODO: Replace this with FriendPostListView
                FriendPostListView(friendPosts: snapshot.data.friendPosts),
                Container(height: 400, color: Colors.green)
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
