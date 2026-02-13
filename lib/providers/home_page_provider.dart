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


  List<TaskModel> tasks =[];
  bool isLoading = false;
String errorMassage = "";
  int selectedCategoryIndex = 0;

  changeCategory(int index) {
    selectedCategoryIndex = index;
    notifyListeners();
  }

  getStreamTasks(){
    FirebaseFunction.getStreamTasks().listen((event) {
     tasks = event.docs.map((e)=> e.data()).toList();
    },);
  }
  getTasks() async{
    isLoading = true;
    errorMassage = "";

    try{
      var list = await FirebaseFunction.getTasks();
      tasks =list.docs.map((e) => e.data()).toList();
    }catch(e){
      errorMassage = e.toString();
     print("Error : ${e.toString()}");
    }
    isLoading=false;
    notifyListeners();
  }
}
