import 'package:dio/dio.dart';

class UpdateProfileRequest {

  final String? genderId;
  final String? Username;
  final String? Birthday;
  final MultipartFile? ImageFile;
  final String? PhoneNumber;

  UpdateProfileRequest({ this.Birthday, this.genderId,this.ImageFile,this.PhoneNumber,this.Username});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserName'] = this.Username;
    data['PhoneNumber'] = this.PhoneNumber;
    data['ImageFile'] = this.ImageFile;
    data['GenderId'] = this.genderId;
    data['Birthday '] = this.Birthday;
    return data;
  }

}