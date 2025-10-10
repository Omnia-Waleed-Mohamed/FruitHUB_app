import 'package:e_commerce_app/core/const/colors/colors.dart';
import 'package:e_commerce_app/core/widgets/text_form_field.dart';
import 'package:e_commerce_app/features/auth/view/register_view.dart';
import 'package:e_commerce_app/features/home/view/home_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  //intel pacg
  //حاجات ف التبندنسي
  //نظبط المين
  //flutter intel add local
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 15, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome Back",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: AppColor.kPrimaryColor,
              ),
            ),
            const Text(
              "we're excited to have you back, can't wait to see what you've been up to since you last logged in.",
              style: TextStyle(
                fontSize: 13,
                height: 1.6,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),

            CustomTextField(label: "Email", icon: Icons.email),
            SizedBox(height: 20),
            CustomTextField(
              label: "Password",
              icon: Icons.visibility,
              isPassword: true,
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Forget Password?",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 12,
                  color: AppColor.kPrimaryColor,
                ),
              ),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.kPrimaryColor,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeView()));
              },
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),

             SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: Divider(color: Colors.grey, thickness: 1)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Or sign Up with ",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
                Expanded(child: Divider(color: Colors.grey, thickness: 1)),
              ],
            ),

            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Image.asset("assets/images/google.png", height: 30, width: 30,),
              SizedBox(width: 20,),
              Image.asset("assets/images/Facebook_icon.svg.png", height: 30, width: 30,),
              SizedBox(width: 20,),
              Image.asset("assets/images/apple.png", height: 40, width: 40,),

            ],),

            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(color: Colors.grey),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterView()),
                    );
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: AppColor.kPrimaryColor),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
