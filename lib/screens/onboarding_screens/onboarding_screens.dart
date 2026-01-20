import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreens extends StatelessWidget {
  static const String routeName = "onboarding screens";

  OnboardingScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset("assets/images/logo.png"),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          spacing: 28,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/being.png", width: double.infinity),
            Text(
              "Personalize Your Experience",
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1C1C1C),
              ),
            ),
            Text(
              "Choose your preferred theme and language to get "
              "started with a comfortable, tailored experience "
              "that suits your style. ",
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF686868),
              ),
            ),

            Column(
              spacing: 16,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Language", style: GoogleFonts.inter(color: Color(0xFF0E3A99),
                        fontSize: 18,fontWeight: FontWeight.w500
                    ),),
                    Container(
                      child: Row(
                        children: [
                          Image.asset("assets/images/ue.jpg"),
                          Image.asset("assets/images/eg.png"),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Theme", style: GoogleFonts.inter(color: Color(0xFF0E3A99),
                        fontSize: 18,fontWeight: FontWeight.w500
                    ),),
                    Container(
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/sun.png",
                            color: Colors.black,
                          ),
                          Image.asset("assets/images/moon.png"),
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
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(16),
                  ),
                  backgroundColor: Color(0xFF0E3A99),
                ),
                child: Text("Let’s start", style: GoogleFonts.inter(color: Colors.white,
                fontSize: 20,fontWeight: FontWeight.w500
                ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
