import 'package:e_commerce_app/core/const/colors/colors.dart';
import 'package:flutter/material.dart';

class RecommendationHeader extends StatelessWidget {
  const RecommendationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Recommendation",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        Text(
          "See All",
          style: TextStyle(color: AppColor.kPrimaryColor),
        ),
      ],
    );
  }
}