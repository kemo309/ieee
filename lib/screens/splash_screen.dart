import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:ieee/screens/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1600), () {
      Navigator.of(context).pushReplacementNamed(Onboarding.routeName);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF54408C),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInLeft(
              duration: Duration(milliseconds: 900),
              child: Image.asset('assets/icons/splah_1.png', scale: 1),
            ),
            SizedBox(width: 5),
            BounceInDown(
              delay: Duration(milliseconds: 900),
              duration: Duration(milliseconds: 600),
              from: 50,
              child: Image.asset('assets/icons/splash_2.png', scale: 1),
            ),
          ],
        ),
      ),
    );
  }
}
