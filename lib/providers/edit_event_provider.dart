import 'package:evently_app/models/task_model.dart';
import 'package:evently_app/core/firebase_function.dart';
import 'package:flutter/material.dart';

class EditEventProvider extends ChangeNotifier {
  int selectedCategoryIndex = 0;
  DateTime selectedDate = DateTime.now();

  EditEventProvider(TaskModel event) {
    List<String> categories = [
      "Sport",
      "Exhibition",
      "Birthday",
      "Booking",
      "Meeting",
    ];
    selectedCategoryIndex = categories.indexOf(event.category);
    selectedDate = DateTime.fromMillisecondsSinceEpoch(event.date);
  }

  void changeCategory(int index) {
    selectedCategoryIndex = index;
    notifyListeners();
  }

  void changeDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  void updateEvent(String eventId, TaskModel updatedEvent) {
    FirebaseFunction.updateTask(updatedEvent);
    notifyListeners();
  }
}