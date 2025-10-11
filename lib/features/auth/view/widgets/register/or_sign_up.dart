import 'package:e_commerce_app/core/const/colors/colors.dart';
import 'package:e_commerce_app/features/auth/view/login_view.dart';
import 'package:flutter/material.dart';

class OrSignUp extends StatelessWidget {
  const OrSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

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
            SizedBox(height: 20),
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
                TextButton(onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginView()));
                }, child: Text("Login", style: TextStyle(color: AppColor.kPrimaryColor),))
              ],
            )
      ],
    )
    ;
  }
}