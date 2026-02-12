import 'package:evently_app/core/firebase_function.dart';
import 'package:evently_app/models/task_model.dart';
import 'package:flutter/widgets.dart';

class AddEventProvider extends ChangeNotifier {

  int selectedCategoryIndex=0;
  DateTime selectedDate = DateTime.now();

  changeDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  changeCategory (int index){

    selectedCategoryIndex=index;
    notifyListeners();
  }


  addEvent(TaskModel taskModel) async{
    await FirebaseFunction.createTask(taskModel);
    notifyListeners();
  }
}