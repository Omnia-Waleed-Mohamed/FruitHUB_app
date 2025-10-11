import 'package:e_commerce_app/features/home/view/widgets/banner_widget.dart';
import 'package:e_commerce_app/features/home/view/widgets/product_grid_widget.dart';
import 'package:e_commerce_app/features/home/view/widgets/recommendation_header.dart';
import 'package:flutter/material.dart';

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            BannerSection(),
            
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
               child: RecommendationHeader(),
               
            ),
            const SizedBox(height: 10),

            ProductGrid(),
            
          ],
        ),
      )
    
    ;
  }
}