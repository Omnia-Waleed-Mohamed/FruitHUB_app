
import 'package:e_commerce_app/core/services/getit.dart';
import 'package:e_commerce_app/features/auth/view/login_view.dart';
import 'package:e_commerce_app/features/auth/view/register_view.dart';
import 'package:e_commerce_app/features/home/view/home_view.dart';
import 'package:e_commerce_app/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';

//https://www.figma.com/design/63McUtqoGPr1snEjObLQYi/Untitled?node-id=0-1&p=f&t=VHb2YT809KyrsixJ-0
void main() async{


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
    getItSetup();
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            locale: const Locale('en'),
            debugShowCheckedModeBanner: false,
      home: RegisterView(),
      
    );
  }
}
