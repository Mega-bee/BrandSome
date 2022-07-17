import 'package:dio/dio.dart';

class UpdateProfileRequest {

  final String? genderId;
  final String? Username;
  final String? Birthday;
  final MultipartFile? ImageFile;
  final String? PhoneNumber;

  UpdateProfileRequest({ this.Birthday, this.genderId,this.ImageFile,this.PhoneNumber,this.Username});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UserName'] = Username;
    data['PhoneNumber'] = PhoneNumber;
    data['ImageFile'] = ImageFile;
    data['GenderId'] = genderId;
    data['Birthday '] = Birthday;
    return data;
  }

}