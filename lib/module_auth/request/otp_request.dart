class OtpRequest{
  String? number;
  String? userName;

  OtpRequest({required this.userName ,required this.number } );


  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': this.number,
      'username': this.userName,
    };
  }


}