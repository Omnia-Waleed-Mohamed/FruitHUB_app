import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            "Welcome Back!",
            style: TextStyle(fontSize: 13, height: 1.6, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}