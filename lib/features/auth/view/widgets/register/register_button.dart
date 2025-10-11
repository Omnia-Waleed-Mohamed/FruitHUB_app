import 'package:e_commerce_app/core/const/colors/colors.dart';
import 'package:e_commerce_app/features/home/view/home_view.dart';
import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.kPrimaryColor,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeView()),
                );
              },
              child: Text(
                "Create Account",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            )
    ;
  }
}