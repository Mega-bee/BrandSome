class BusinessFilterRequest {

  List<int>  services =[];
   String? sortBy;

  BusinessFilterRequest({required this.services,  this.sortBy});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   Map<String, dynamic>();
    data['sortBy'] = this.sortBy;
    if(services.isNotEmpty){
      data['services']= services ;
    }
    return data;
  }

}