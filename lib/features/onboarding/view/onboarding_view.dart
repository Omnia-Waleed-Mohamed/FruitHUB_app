import 'package:e_commerce_app/core/const/colors/colors.dart';
import 'package:e_commerce_app/features/auth/view/login_view.dart';
import 'package:e_commerce_app/features/onboarding/view/widget/onboarding_list.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: onboardingList.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                final item = onboardingList[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Image.asset(item.image),
                        Positioned(
                          top: 140,
                          left: 50,
                          child: Image.asset(item.image2),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        item.description,
                        style: const TextStyle(
                          fontSize: 16,
                          height: 1.6,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          const SizedBox(height: 10),

         
          SmoothPageIndicator(
            controller: _pageController,
            count: onboardingList.length,
            effect: ExpandingDotsEffect(
              activeDotColor:  AppColor.kPrimaryColor,
              dotColor: Color(0xff5DB957),
              dotHeight: 10,
              dotWidth: 10,
              spacing: 8,
            ),
          ),

          const SizedBox(height: 30),

          
          if (_currentIndex == onboardingList.length - 1)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: 
                  (BuildContext context)
                  {
                    return const LoginView();
                  }));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  "Get Started",
                  style: TextStyle(fontSize: 18, color: AppColor.kPrimaryColor,),
                ),
              ),
            ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
