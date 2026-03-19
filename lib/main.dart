import 'package:flutter/material.dart';
import 'package:ieee/screens/cart.dart';
import 'package:ieee/screens/category.dart';
import 'package:ieee/screens/details.dart';
import 'package:ieee/screens/home.dart';
import 'package:ieee/screens/login_screen.dart';
import 'package:ieee/screens/notification.dart';
import 'package:ieee/screens/onboarding.dart';
import 'package:ieee/screens/profile.dart';
import 'package:ieee/screens/register_screen.dart';
import 'package:ieee/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        Onboarding.routeName: (context) => Onboarding(),
        Login.routeName: (context) => Login(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        BookDetailScreen.routeName: (context) => BookDetailScreen(),
        NotificationScreen.routeName: (context) => NotificationScreen(),
        CategoryScreen.routeName: (context) => CategoryScreen(),
        CartScreen.routeName: (context) => CartScreen(),
        ProfileScreen.routeName: (context) => ProfileScreen(),
      },
    );
  }
}
