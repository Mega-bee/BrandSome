class BusinessFilterRequest {

  // final List<int>? services;
 final String? sortBy;

  BusinessFilterRequest({this.sortBy});

  Map<String, dynamic> toJson() {
    return {
      'sortBy': this.sortBy,
      // 'services': this.services,
    };
  }

}