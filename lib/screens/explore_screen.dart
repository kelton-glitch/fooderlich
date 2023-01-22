import 'package:flutter/material.dart';
import '../components/components.dart';
import '../models/models.dart';
import '../api/mock_fooderlich_service.dart';
import 'dart:developer';

class ExploreScreen extends StatefulWidget {

  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();




}

class _ExploreScreenState extends State<ExploreScreen> {
  //1
  final mockService = MockFooderlichService();
  late ScrollController _controller;

  void _scrollListener(){
    //1
    if(_controller.offset == _controller.position.maxScrollExtent && !_controller.position.outOfRange){
      log('i am at the bottom!');
    }
    //2
    if(_controller.offset == _controller.position.minScrollExtent && !_controller.position.outOfRange){
      log('i am at the top!');
    }
  }

  @override
  void initState(){
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    //1
    return FutureBuilder(
      //2
      future: mockService.getExploreData(),
      //3
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        //4
        if (snapshot.connectionState == ConnectionState.done) {
         //5
          return ListView(
            controller: _controller,
            //6
            scrollDirection: Axis.vertical,
            children: [
              //7
              TodayRecipeListView(recipes:
              snapshot.data?.todayRecipes ?? []),
              //8
              const SizedBox(height: 16),
              //9
              //TODO: Replace this with FriendPostListView
             FriendPostListView(friendPosts: snapshot.data?.friendPosts ?? []),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}