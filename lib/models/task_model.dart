class TaskModel {
  String title;
  String description;
  String category;
  bool isFav;
  int date;
  String id;

  TaskModel({
    required this.title,
    required this.date,
    required this.category,
    required this.description,
    this.isFav = false,
    this.id = "",
  });

  TaskModel.fromJson(Map<String, dynamic> json)
      : this (
    title: json["title"],
    date: json["date"],
    category: json["category"],
    description: json["description"],
    isFav: json["isFav"],
    id: json["id"],
  );

  Map<String , dynamic> toJson(){
    return {
      "title" : title,
      "date" : date,
      "category" : category,
      "description" : description,
      "isFav" : isFav,
      "id" : id,
    };
  }

}
