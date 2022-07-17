
class ChangenumberRequest {

   String PhoneNumber;

  ChangenumberRequest({required this.PhoneNumber,});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['phoneNumber'] = PhoneNumber;

    return data;
  }

}