class CategoryModel{
  int? id;
  String? name;
  bool selectedCard = false;

  CategoryModel({this.id,this.name,required this.selectedCard});
}