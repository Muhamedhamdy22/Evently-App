import 'package:evently_app/providers/add_event_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddEventScreen extends StatelessWidget {
  static const String routeName = " addEvent";

  AddEventScreen({super.key});

  List<String> categories = [
    "Sport",
    "Exhibition",
    "Birthday",
    "Booking",
    "Meeting",
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddEventProvider(),
      builder: (context, child) {
        var provider = Provider.of<AddEventProvider>(context);
        return Scaffold(
          backgroundColor: Color(0xFFF4F7FF),
          appBar: AppBar(
            backgroundColor: Color(0xFFF4F7FF),
            centerTitle: true,
            title: Text(
              "Add event",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(18),
                    child: Image.asset(
                      "assets/images/${categories[provider.selectedCategoryIndex]}.png",
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    height: 40,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          provider.changeCategory(index);
                        },
                        child: Chip(
                          label: Text(categories[index]),
                          backgroundColor: index == provider.selectedCategoryIndex
                              ? Theme.of(context).colorScheme.primary
                              : Colors.transparent,
                          labelStyle: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: index == provider.selectedCategoryIndex
                                ? Colors.white
                                : Colors.black,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(18),
                          ),
                        ),
                      ),
                      separatorBuilder: (c, i) {
                        return SizedBox(width: 12);
                      },
                      itemCount: categories.length,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Title" , style: Theme.of(context).textTheme.titleSmall,),
                    ],
                  ),
                  SizedBox(height: 4),
                  TextField(
                    decoration: InputDecoration(
                      hint: Text("Event Title" , style: Theme.of(context).textTheme.headlineMedium,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18)
                      )
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Description" , style: Theme.of(context).textTheme.titleSmall,),
                    ],
                  ),
                  SizedBox(height: 8),
                  TextField(
                    maxLines: 3,
                    decoration: InputDecoration(
                        hint: Text("Event Description...." , style: Theme.of(context).textTheme.headlineMedium,),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18)
                        )
                    ),
                  ),
                  SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Event Date" , style: Theme.of(context).textTheme.labelMedium,),
                      ),
                      Text("21/8/2004"),
                    ],
                  ),
                  // SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text("Event Time" , style: Theme.of(context).textTheme.labelMedium,),
                      ),
                      Text("11 : 55"),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.pushNamed(context, routeName);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(16),
                        ),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      child: Text(
                        "Add event",
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
      },
    );
  }
}
