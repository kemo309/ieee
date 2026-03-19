import 'package:flutter/material.dart';
import 'package:ieee/screens/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});
  static const String routeName = '/onboarding';

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  List<OnboardingData> onboardingData = dataOnboarding();
  int index = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //!-- Add your onboarding UI components here --!
            // image onboarding
            SizedBox(
              height: 260,
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    index = value;
                  });
                },
                itemBuilder: (context, index) {
                  return Image.asset(onboardingData[index].imagePath);
                },
                itemCount: onboardingData.length,
              ),
            ),
            SizedBox(height: 23),
            // indicator onboarding
            SmoothPageIndicator(
              controller: pageController,
              count: onboardingData.length,
              effect: ExpandingDotsEffect(
                spacing: 10,
                dotHeight: 6,
                radius: 56,
                dotWidth: 15,
                dotColor: Color(0xffAFAFAF),
                activeDotColor: Color(0xff5F33E1),
              ),
            ),
            SizedBox(height: 50),
            // title onboarding
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    onboardingData[index].title,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Color(0Xff404147),
                    ),
                  ),
                  SizedBox(height: 42),
                  // description onboarding
                  Text(
                    onboardingData[index].description,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0Xff817D8D),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 150),
            // buttons onboarding
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: MaterialButton(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  onPressed: () {
                    if (index < onboardingData.length - 1) {
                      pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    } else {
                      Navigator.of(
                        context,
                      ).pushReplacementNamed(Login.routeName);
                    }
                  },
                  color: Color(0xff5F33E1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      index < onboardingData.length - 1
                          ? "Next"
                          : "GET STARTED",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // buttons onboarding
          ],
        ),
      ),
    );
  }
}

// data class onboarding
class OnboardingData {
  final String imagePath;
  final String title;
  final String description;

  OnboardingData({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

// list of onboarding data

List<OnboardingData> dataOnboarding() {
  return [
    OnboardingData(
      imagePath: 'assets/images/onboarding-1-screen.png',
      title: 'Manage your tasks',
      description:
          'You can easily manage all of your daily tasks in DoMe for free',
    ),
    OnboardingData(
      imagePath: 'assets/images/onboarding-2-screen.png',
      title: 'Create daily routine',
      description:
          'In Tasky  you can create your personalized routine to stay productive',
    ),
    OnboardingData(
      imagePath: 'assets/images/onboarding-3-screen.png',
      title: 'Organize your tasks',
      description:
          'You can organize your daily tasks by adding your tasks into separate categories',
    ),
  ];
}
