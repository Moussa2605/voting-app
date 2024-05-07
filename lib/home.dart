import 'package:flutter/material.dart';

import 'auth.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tanal sa Njit"),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          children: [
          ],
        ),
      )



    );
  }
}
