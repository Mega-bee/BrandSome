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



}

