import 'package:dio/dio.dart';

class UpdateProfileRequest {

  final String? genderId;
  final String? Username;
  final String? Birthday;
  final MultipartFile? ImageFile;
  final String? PhoneNumber;
  final String? countryCode;

  UpdateProfileRequest({ this.Birthday, this.genderId,this.ImageFile,this.PhoneNumber,this.Username,this.countryCode});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UserName'] = Username;
    data['PhoneNumber'] = PhoneNumber;
    data['ImageFile'] = ImageFile;
    data['GenderId'] = genderId;
    data['Birthday '] = Birthday;
    data['countryCode '] = countryCode;
    return data;
  }

}