import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/providers/theme_provider.dart';
import 'package:evently_app/screens/add_event/add_event_screen.dart';
import 'package:evently_app/screens/auth/login_screen.dart';
import 'package:evently_app/screens/auth/register_screen.dart';
import 'package:evently_app/screens/onboarding_screens/onboarding_screen1.dart';
import 'package:evently_app/screens/onboarding_screens/onboarding_screens.dart';
import 'package:evently_app/screens/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/my_theme.dart';
import 'firebase_options.dart';
import 'screens/home_screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
      path: 'assets/translations',
      fallbackLocale: Locale('en', 'US'),
      child: ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: myProvider.themeMode,
      initialRoute: HomeScreen.routeName,
      routes: {
        OnboardingScreens.routeName: (context) => OnboardingScreens(),
        HomeScreen.routeName: (context) => HomeScreen(),
        OnboardingScreen1.routeName: (context) => OnboardingScreen1(),
        SplashScreen.routeName: (context) => SplashScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        AddEventScreen.routeName: (context) => AddEventScreen(),
      },
    );
  }
}
