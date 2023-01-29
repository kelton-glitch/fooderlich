import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/models.dart';
import '../screens/screens.dart';

class AppRouter {
  //1
  final AppStateManager appStateManager;
  //2
  final ProfileManager profileManager;
  //3
  final GroceryManager groceryManager;

  AppRouter(
    this.appStateManager,
    this.profileManager,
    this.groceryManager,
  );
  //4
  late final router = GoRouter(
    //5
    debugLogDiagnostics: true,
    //6
    refreshListenable: appStateManager,
    //7
    initialLocation: '/login',
    //8
    routes: [
      //TODO: Add login Route
      //TODO: Add Onboarding Route
      //TODO: Add Home Route
    ],
    //Error Handler
    errorPageBuilder: (context, state){
      return MaterialPage(
        key: state.pageKey,
        child:Scaffold(
          body: Center (
            child: Text(state.error.toString(),
            )
          )
        )
          );
    }
    //TODO: Add Redirect Handler
  );
}
