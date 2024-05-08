import 'package:flutter/material.dart';
import 'package:vote/Details.dart';
import 'package:vote/auth.dart';
import 'package:vote/inscri.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  get candidates => null;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/auth': (context) => Auth(),
        '/inscri': (context) => Inscri(),
        '/home': (context) => Home(),
        '/details': (context) => CandidateDetail(candidate: candidates),


      },
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: Auth(),
    );
  }
}
