
class ChangenumberRequest {

   String PhoneNumber;
   String? counrtyCode;

  ChangenumberRequest({required this.PhoneNumber,required this.counrtyCode});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['phoneNumber'] = PhoneNumber;
    data['countryCode'] = counrtyCode;

    return data;
  }

}