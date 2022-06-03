import 'package:flutter/material.dart';
import 'package:my_animes/pages/main_page.dart';
import 'package:my_animes/pages/onboarding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyAnimeWorld',
      theme: ThemeData(
        // bottomNavigationBarTheme: Theme.of(context).bottomNavigationBarTheme.copyWith(backgroundColor: Colors.amber,),

        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}
