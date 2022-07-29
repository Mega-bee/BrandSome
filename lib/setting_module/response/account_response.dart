class AccountResponse {
  String? userName;
  String? phoneNumber;
  String? imageUrl;
  String? gender;
  int? genderId;
  String? birthDate;
  String? countryCode;

  AccountResponse(
      {this.userName,
        this.phoneNumber,
        this.imageUrl,
        this.gender,
        this.genderId,
        this.birthDate,
        this.countryCode});

  AccountResponse.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    phoneNumber = json['phoneNumber'];
    imageUrl = json['imageUrl'];
    gender = json['gender'];
    genderId = json['genderId'];
    birthDate = json['birthDate'];
    countryCode = json['countryCode'];
  }



}

