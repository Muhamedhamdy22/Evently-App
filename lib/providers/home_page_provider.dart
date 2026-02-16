import 'dart:async';

import 'package:evently_app/core/firebase_function.dart';
import 'package:evently_app/models/task_model.dart';
import 'package:flutter/material.dart';

class HomePageProvider extends ChangeNotifier {
  List<String> categories = [
    "All",
    "Sport",
    "Exhibition",
    "Birthday",
    "Booking",
    "Meeting",
  ];

  List<TaskModel> tasks = [];
  bool isLoading = false;
  String errorMassage = "";
  int selectedCategoryIndex = 0;
  StreamSubscription? streamSubscription;

  changeCategory(int index) {
    selectedCategoryIndex = index;
    getStreamTasks();
    notifyListeners();
  }

  @override
  dispose() {
    streamSubscription!.cancel();
    super.dispose();
  }

  getStreamTasks() {
    if (streamSubscription != null) streamSubscription!.cancel();
    streamSubscription =
        FirebaseFunction.getStreamTasks(
          category: selectedCategoryIndex == 0
              ? null
              : categories[selectedCategoryIndex],
        ).listen((event) {
          tasks = event.docs.map((e) => e.data()).toList();
          notifyListeners();
        });
  }

  getTasks() async {
    isLoading = true;
    errorMassage = "";

    try {
      var list = await FirebaseFunction.getTasks();
      tasks = list.docs.map((e) => e.data()).toList();
    } catch (e) {
      errorMassage = e.toString();
      print("Error : ${e.toString()}");
    }
    isLoading = false;
    notifyListeners();
  }
}
