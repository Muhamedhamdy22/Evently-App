import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/extentions.dart';
import 'package:evently_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'onboarding_screen1.dart';

class OnboardingScreens extends StatelessWidget {
  static const String routeName = "onboarding screens";

  OnboardingScreens({super.key});

  // bool isEnglish = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    bool isEnglish = context.locale == Locale('en', 'US');
    return Scaffold(
      appBar: AppBar(title: Image.asset("assets/images/logo.png")),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            spacing: 23,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/being.png", width: double.infinity),
              Text(
                "onboardingTittle".tr(),
                style: context.getLargeTittle(),
              ),
              Text(
                "onboardingSubTittle".tr(),
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
                        padding: EdgeInsets.only(right: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusGeometry.circular(24),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                context.setLocale(Locale('en', 'US'));
                              },
                              child: languageIconWidget(
                                "ue",
                                !isEnglish,
                                context,
                              ),
                            ),
                            SizedBox(width: 16),
                            InkWell(
                              onTap: () {
                                context.setLocale(Locale('ar', 'EG'));
                              },
                              child: languageIconWidget("eg", isEnglish, context),
                            ),
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
                          right: provider.themeMode == ThemeMode.dark ? 0 : 4,
                          left: provider.themeMode == ThemeMode.light ? 0 : 4,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusGeometry.circular(24),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                provider.ChangeTheme(ThemeMode.light);
                              },
                              child: themeIconWidget(
                                "sun",
                                provider.themeMode != ThemeMode.light,
                                context,
                              ),
                            ),
                            SizedBox(width: 16),
                            InkWell(
                              onTap: () {
                                provider.ChangeTheme(ThemeMode.dark);
                              },
                              child: themeIconWidget(
                                "moon",
                                provider.themeMode == ThemeMode.light,
                                context,
                              ),
                            ),
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
                    style:  GoogleFonts.inter(
                      color: Color(0xFFF0F0F0),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget languageIconWidget(
    String iconName,
    bool isSelected,
    BuildContext context,
  ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: !isSelected ? null : BorderRadiusGeometry.circular(24),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 3,
        ),
      ),
      child: Image.asset("assets/images/$iconName.png", fit: BoxFit.cover),
    );
  }

  Widget themeIconWidget(
    String themaName,
    bool isSelected,
    BuildContext context,
  ) {
    return Container(
      decoration: isSelected
          ? null
          : BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadiusGeometry.circular(24),
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 3,
              ),
            ),
      child: ImageIcon(
        AssetImage("assets/images/$themaName.png"),
        color: !isSelected
            ? Theme.of(context).colorScheme.surface
            : Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
