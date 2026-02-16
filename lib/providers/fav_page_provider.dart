import 'dart:async';

import 'package:evently_app/core/firebase_function.dart';
import 'package:evently_app/models/task_model.dart';
import 'package:flutter/foundation.dart';



class FavPageProvider extends ChangeNotifier {
  bool isLoading = false;
  String errorMassage = "";
  List<TaskModel> tasks = [];
  StreamSubscription? streamSubscription;




  getFavoriteTasks() {
    if (streamSubscription != null) streamSubscription!.cancel();
    streamSubscription = FirebaseFunction.getFavoriteTasks().listen((event) {
      tasks = event.docs.map((e) => e.data()).toList();
      notifyListeners();
    });
  }
}
