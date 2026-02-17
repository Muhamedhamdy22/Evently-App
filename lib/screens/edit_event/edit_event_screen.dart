import 'package:evently_app/models/task_model.dart';
import 'package:evently_app/providers/edit_event_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditEventScreen extends StatelessWidget {
  static const String routeName = "editEvent";

  EditEventScreen({super.key});

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final List<String> categories = [
    "Sport",
    "Exhibition",
    "Birthday",
    "Booking",
    "Meeting",
  ];

  @override
  Widget build(BuildContext context) {
    final TaskModel event =
    ModalRoute.of(context)!.settings.arguments as TaskModel;

    return ChangeNotifierProvider(
      create: (context) => EditEventProvider(event),
      builder: (context, child) {
        var provider = Provider.of<EditEventProvider>(context);

        titleController.text = event.title;
        descriptionController.text = event.description;

        return Scaffold(
          backgroundColor: Color(0xFFF4F7FF),
          appBar: AppBar(
            backgroundColor: Color(0xFFF4F7FF),
            centerTitle: true,
            title: Text(
              "Edit Event",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18),
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
                          backgroundColor:
                          index == provider.selectedCategoryIndex
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
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                      ),
                      separatorBuilder: (c, i) => SizedBox(width: 12),
                      itemCount: categories.length,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Title",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  TextField(
                    style: TextStyle(fontSize: 14),
                    controller: titleController,
                    decoration: InputDecoration(
                      hintText: "Event Title",
                      hintStyle: Theme.of(context).textTheme.headlineMedium,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Description",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  TextField(
                    style: TextStyle(fontSize: 14),
                    controller: descriptionController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: "Event Description",
                      hintStyle: Theme.of(context).textTheme.headlineMedium,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                  SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Event Date",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          DateTime? chosenDate = await showDatePicker(
                            context: context,
                            initialDate: provider.selectedDate,
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(Duration(days: 365)),
                          );
                          provider.changeDate(chosenDate ?? DateTime.now());
                        },
                        child: Text(
                          provider.selectedDate.toString().substring(0, 10),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        provider.updateEvent(
                          event.id!,
                          TaskModel(
                            id: event.id,
                            title: titleController.text,
                            date: provider.selectedDate.millisecondsSinceEpoch,
                            category:
                            categories[provider.selectedCategoryIndex],
                            description: descriptionController.text,
                            isFav: event.isFav,
                          ),
                        );
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      child: Text(
                        "Update event",
                        style: GoogleFonts.inter(
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