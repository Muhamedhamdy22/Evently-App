import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'onboarding_screen1.dart';

class OnboardingScreens extends StatelessWidget {
  static const String routeName = "onboarding screens";

  OnboardingScreens({super.key});

  bool isDark = false;
  // bool isEnglish = false;

  @override
  Widget build(BuildContext context) {
    bool isEnglish = context.locale == Locale('en', 'US');
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/logo.png"),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          spacing: 23,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/being.png", width: double.infinity),
            Text(
              "onboardingTittle".tr(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(  "onboardingSubTittle".tr(),
              style: Theme.of(context).textTheme.titleMedium,
            ),

            Column(
              spacing: 16,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "language".tr(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        right: 4,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusGeometry.circular(24),
                        border: Border.all(color: Theme.of(context).colorScheme.primary, width: 2),
                      ),
                      child: Row(
                        children: [
                          InkWell(
                              onTap:(){
                                context.setLocale(Locale('en', 'US'));
                              },
                              child: languageIconWidget("ue" , !isEnglish, context)),
                          SizedBox(width: 16),
                          InkWell(
                              onTap:(){
                                context.setLocale(Locale('ar', 'EG'));
                              },
                              child: languageIconWidget("eg" , isEnglish, context)),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "theme".tr(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        right: isDark ? 0 : 4,
                        left: !isDark ? 0 : 4,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusGeometry.circular(24),
                        border: Border.all(color: Theme.of(context).colorScheme.primary, width: 2),
                      ),
                      child: Row(
                        children: [
                          themeIconWidget("sun" , isDark, context),
                          SizedBox(width: 16),
                          themeIconWidget("moon" , !isDark, context),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, OnboardingScreen1.routeName);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(16),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                child: Text(
                  "start".tr(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget languageIconWidget(String iconName , bool isSelected,BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        borderRadius: !isSelected
            ? null
            : BorderRadiusGeometry.circular(24),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 3,
        ),
      ),
      child: Image.asset(
        "assets/images/$iconName.png",
        fit: BoxFit.cover,
      ),
    );
  }

  Widget themeIconWidget(String themaName , bool isSelected , BuildContext context){
    return   Container(
      decoration: isSelected
          ? null
          : BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadiusGeometry.circular(
          24,
        ),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 3,
        ),
      ),
      child: ImageIcon(
        AssetImage("assets/images/$themaName.png"),
        color: !isSelected
            ?  Theme.of(context).colorScheme.surface
          : Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
