import 'package:flutter/widgets.dart';

class AddEventProvider extends ChangeNotifier {

  int selectedCategoryIndex=0;

  changeCategory (int index){

    selectedCategoryIndex=index;
    notifyListeners();
  }


}