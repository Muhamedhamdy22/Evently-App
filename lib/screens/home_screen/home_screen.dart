import 'package:evently_app/providers/home_provider.dart';
import 'package:evently_app/screens/add_event/add_event_screen.dart';
import 'package:evently_app/screens/home_screen/tabs/fav_page.dart';
import 'package:evently_app/screens/home_screen/tabs/home_page.dart';
import 'package:evently_app/screens/home_screen/tabs/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = " Homescreens";

   HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      builder: (context, child) {
        var homeProvider = Provider.of<HomeProvider>(context);
       return Scaffold(
         backgroundColor: Color(0xFFF4F7FF),
         appBar: AppBar(
           backgroundColor: Color(0xFFF4F7FF),
           actions: [
             ImageIcon(AssetImage("assets/images/sun.png")),
             SizedBox(width: 4),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                 width: 34,
                 height: 34,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(8),
                   color: Theme.of(context).colorScheme.primary,
                 ),
                 child: Center(
                   child: Text(
                     "EN",
                     style: GoogleFonts.poppins(
                       color: Colors.white,
                       fontSize: 14,
                       fontWeight: FontWeight.w600,
                     ),
                   ),
                 ),
               ),
             ),
           ],
           title: ListTile(
             title: Text(
               "Welcome Back ✨",
               style: Theme.of(context).textTheme.headlineMedium,
             ),
             subtitle: Text(
               "John Safwat",
               style: Theme.of(context).textTheme.labelMedium,
             ),
           ),
           centerTitle: false,
         ),
         floatingActionButton: FloatingActionButton(
           onPressed: () {
             Navigator.pushNamed(context, AddEventScreen.routeName);
           },
           child: Icon(Icons.add, color: Colors.white),

         ),
         bottomNavigationBar: BottomNavigationBar(
           onTap: (value) {
             homeProvider.changeSelectedIndex(value);
           },
           currentIndex: homeProvider.selectedIndex,
           items: [
             BottomNavigationBarItem(
               icon: ImageIcon(AssetImage("assets/images/home-2.png")),
               label: "Home",
             ),
             BottomNavigationBarItem(
               icon: ImageIcon(AssetImage("assets/images/heart.png")),
               label: "Favorite",
             ),
             BottomNavigationBarItem(
               icon: ImageIcon(AssetImage("assets/images/user.png")),
               label: "Profile",
             ),
           ],
         ),
         body: tabs[homeProvider.selectedIndex],
       );
      },
    );
  }
  List<Widget>tabs =[
    HomePage(),
    FavPage(),
    ProfilePage()
  ];
}
