import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/screens/onboarding_screens/onboarding_screen1.dart';
import 'package:evently_app/screens/onboarding_screens/onboarding_screens.dart';
import 'package:evently_app/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

import 'core/my_theme.dart';
import 'screens/home_screen/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp( EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
      path: 'assets/translations',
      fallbackLocale: Locale('en', 'US'),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: SplashScreen.routeName,
      routes: {
        OnboardingScreens.routeName : (context) => OnboardingScreens(),
        HomeScreen.routeName : (context) => HomeScreen(),
        OnboardingScreen1.routeName : (context) => OnboardingScreen1(),
        SplashScreen.routeName : (context) => SplashScreen(),

      },
    );
  }
}
