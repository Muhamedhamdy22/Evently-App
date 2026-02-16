import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/firebase_function.dart';
import 'package:evently_app/models/task_model.dart';
import 'package:evently_app/providers/home_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  DateFormat formatter = DateFormat("dd MMM");

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomePageProvider()..getStreamTasks(),
      builder: (context, child) {
        var provider = Provider.of<HomePageProvider>(context);
        var providerWatch = context.watch<HomePageProvider>();
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // SizedBox(height: 12,),
              SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      provider.changeCategory(index);
                    },
                    child: Chip(
                      label: Text(provider.categories[index]),
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
                  itemCount: provider.categories.length,
                ),
              ),
              SizedBox(height: 16),

              Expanded(
                child: provider.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : provider.errorMassage.isNotEmpty
                    ? Center(child: Text(provider.errorMassage))
                    : providerWatch.tasks.isEmpty
                    ? Center(child: Text("No Tasks"))
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 193,
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    18,
                                  ),
                                  child: Image.asset(
                                    "assets/images/${providerWatch.tasks[index].category}.png",
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(12),
                                  height: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            18,
                                          ),
                                          color: Color(0xFFF0F0F0),
                                        ),
                                        child: Text(
                                          formatter.format(
                                            DateTime.fromMillisecondsSinceEpoch(
                                              providerWatch.tasks[index].date,
                                            ),
                                          ),
                                          style: Theme.of(
                                            context,
                                          ).textTheme.displayMedium,
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            18,
                                          ),
                                          color: Color(0xFFF0F0F0),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              providerWatch.tasks[index].title,
                                              style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF1C1C1C),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                var task =
                                                    providerWatch.tasks[index];
                                                task.isFav = !task.isFav;
                                                FirebaseFunction.updateTask(
                                                  task,
                                                );
                                              },
                                              child: Icon(
                                                providerWatch.tasks[index].isFav
                                                    ? Icons.favorite
                                                    : Icons.favorite_border_outlined,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 12);
                        },
                        itemCount: providerWatch.tasks.length,
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
