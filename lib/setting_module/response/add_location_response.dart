class AddLocationResponse {
  int? id;
  String? name;
  bool value = false;

  AddLocationResponse({this.id, this.name,required this.value});

  AddLocationResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }


}

