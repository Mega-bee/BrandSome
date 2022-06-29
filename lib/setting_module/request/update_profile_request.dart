import 'package:dio/dio.dart';

class UpdateProfileRequest {

  final int? genderId;
  final String? Username;
  final DateTime? Birthday;
  final MultipartFile? ImageFile;
  final String? PhoneNumber;

  UpdateProfileRequest({ this.Birthday, this.genderId,this.ImageFile,this.PhoneNumber,this.Username});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserName'] = this.Username;
    data['PhoneNumber'] = this.PhoneNumber;
    data['ImageFile'] = this.ImageFile;
    data['GenderId'] = this.genderId;
    data['BirthDate'] = this.Birthday;
    return data;
  }

}