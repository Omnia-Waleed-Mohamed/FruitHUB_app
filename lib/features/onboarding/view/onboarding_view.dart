import 'package:flutter/material.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image.asset("assets/images/Vector.png"),
              Positioned(
                top: 140,
                left: 50,
                child: Image.asset("assets/images/fruit basket-amico 1.png"),
              ),
            ],
          ),
          const SizedBox(height: 30),
          
          
          const Text(
            "Welcome to FruitHUB",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 16),
          
          
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Discover a unique shopping experience with FruitHUB. "
              "Explore our wide selection of premium fresh fruits and enjoy "
              "the best deals with top quality.",
              style: TextStyle(
                fontSize: 16,
                height: 1.6, 
                color: Colors.black54,
              ),
              textAlign: TextAlign.center, 
            ),
          ),
        ],
      ),
    );
  }
}
