import 'package:e_commerce_app/core/const/colors/colors.dart';
import 'package:e_commerce_app/core/widgets/text_form_field.dart';
import 'package:e_commerce_app/features/home/view/home_view.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 15, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Create Account",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: AppColor.kPrimaryColor,
              ),
            ),
            const Text(
              "Sign up now and start exploring all that our app has to offer. we're excited to welcome you to our community!",
              style: TextStyle(
                fontSize: 13,
                height: 1.6,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
            CustomTextField(label: "Username", icon: Icons.person),
            SizedBox(height: 20),
            CustomTextField(label: "Email", icon: Icons.email),
            SizedBox(height: 20),
            CustomTextField(label: "Password", icon: Icons.visibility),
            SizedBox(height: 20),
            CustomTextField(label: "Phone Nunber", icon: Icons.phone),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeView()),
                );
              },
              child: Text(
                "Create Account",
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
                Text("Already have an account?", style: TextStyle(color: Colors.grey),),
                TextButton(onPressed: (){}, child: Text("Login", style: TextStyle(color: AppColor.kPrimaryColor),))
              ],
            )
          ],
        ),
      ),
    );
  }
}
