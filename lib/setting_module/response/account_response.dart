class Account {
  String? userName;
  String? phoneNumber;
  String? imageUrl;
  String? gender;
  int? genderId;
  String? birthDate;

  Account(
      {this.userName,
        this.phoneNumber,
        this.imageUrl,
        this.gender,
        this.genderId,
        this.birthDate});

  Account.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    phoneNumber = json['phoneNumber'];
    imageUrl = json['imageUrl'];
    gender = json['gender'];
    genderId = json['genderId'];
    birthDate = json['birthDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['phoneNumber'] = this.phoneNumber;
    data['imageUrl'] = this.imageUrl;
    data['gender'] = this.gender;
    data['genderId'] = this.genderId;
    data['birthDate'] = this.birthDate;
    return data;
  }
}

