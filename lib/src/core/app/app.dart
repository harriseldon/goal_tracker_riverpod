import 'package:flutter/material.dart';
import 'package:goal_tracker_riverpod/src/features/goal/navigation/goal_router.dart';

class App extends StatelessWidget {
  //final RouteInformationParser<Object> routeInformationParser;
  App({
    super.key,
  });

  final _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      routerConfig: goalRouter,
      scaffoldMessengerKey: _scaffoldKey,
    );
  }
}
