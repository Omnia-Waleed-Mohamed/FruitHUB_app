
import 'package:e_commerce_app/features/home/view/widgets/home_app_bar.dart';
import 'package:e_commerce_app/features/home/view/widgets/home_body_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: const HomeAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: HomeBodyWidget(),
      )
    );
  }
}
