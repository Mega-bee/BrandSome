class BusinessFilterRequest {

  List<int>  services =[];
   String? sortBy;

  BusinessFilterRequest({required this.services,  this.sortBy});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   <String, dynamic>{};
    data['sortBy'] = sortBy;
    if(services.isNotEmpty){
      data['services']= services ;
    }
    return data;
  }

}