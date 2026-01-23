import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/models/onboarding_data.dart';
import 'package:evently_app/models/onboarding_list.dart';
import 'package:flutter/material.dart';

class OnboardingScreen1 extends StatefulWidget {
  static const String routeName = "OnboardingScreen1";

  OnboardingScreen1({super.key});

  @override
  State<OnboardingScreen1> createState() => _OnboardingScreen1State();
}

int page = 0;

class _OnboardingScreen1State extends State<OnboardingScreen1> {
  List<OnboardingData> onboard = OnboardingList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset("assets/images/logo.png"),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text("Skip".tr(), style: Theme.of(context).textTheme.labelSmall),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: onboard.length,
              onPageChanged: (value) {
                setState(() {
                  page = value;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      onboard[index].image,
                      width: 290,
                      height: 285,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 2),
                    buildPageIndicator(onboard.length, page),
                    SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          onboard[index].tittle,
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          onboard[index].des,
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (page < onboard.length - 1) {
                    setState(() {
                      page++;
                    });
                  } else {}
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0E3A99),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  page == onboard.length - 1 ? "Get Started".tr() : "Next".tr(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildPageIndicator(int length, int currentPage) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(
      length,
      (index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        width: index == currentPage ? 24 : 8,
        height: 8,
        decoration: BoxDecoration(
          color: index == currentPage
              ? Color(0xFF0E3A99)
              : Color(0xFFD9D9D9),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),
  );
}
