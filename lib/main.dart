import 'package:flutter/material.dart';
import 'package:movies_app/core/service/service_locator.dart';
import 'package:movies_app/movies/presntation/screens/movies_screen1.dart';

void main() {
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
      title: 'movies app',
      home: MainMoviesScreen(),
    );
  }
}
