import 'package:flutter/material.dart';

class OnboardingScreens extends StatelessWidget {
  static const String routeName = "onboarding screens";
   OnboardingScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/logo.png"),
      ),
    );
  }
}
