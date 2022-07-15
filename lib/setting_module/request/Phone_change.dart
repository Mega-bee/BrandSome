import 'package:dio/dio.dart';

class ChangenumberRequest {

   String PhoneNumber;

  ChangenumberRequest({required this.PhoneNumber,});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['phoneNumber'] = this.PhoneNumber;

    return data;
  }

}