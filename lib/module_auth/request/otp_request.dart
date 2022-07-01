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
class VerifyOtpRequest{
  String? number;
  String? otp;

  VerifyOtpRequest({required this.otp ,required this.number } );


  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': this.number,
      'otp': this.otp,
    };
  }


}