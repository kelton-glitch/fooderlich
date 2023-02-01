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
      //login Route
      GoRoute(
          name: 'login',
          path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      //Onboarding Route
      GoRoute(
        name: 'onboarding',
          path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      //Home Route
      GoRoute(
        name: 'home',
        path: '/:tab',
        builder: (context, state) {
          final tab = int.tryParse(state.params['tab'] ?? '') ?? 0;
          return Home(
            key: state.pageKey, currentTab:tab,
          );
        },
        routes: [
          // TODO: Add Item Subroute
          // TODO: Add Profile Subroute
        ],
      )
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
    },
    //Redirect Handler
    redirect: (state) {
      final loggedIn = appStateManager.isLoggedIn;
      final loggingIn = state.subloc == '/login';
      if(loggingIn) return null;
      if (!loggedIn) return loggingIn ? null : '/login';

      final isOnboardingComplete =
          appStateManager.isOnboardingComplete;
      final onboarding = state.subloc == '/onboarding';
      if (!isOnboardingComplete) {
        return onboarding ? null : '/onboarding';
  }
      if (loggedIn || onboarding) return '/${FooderlichTab.explore}';
      return null;
}
  );
}
