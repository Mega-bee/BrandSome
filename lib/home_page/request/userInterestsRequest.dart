class setUserInterestsRequest {
  List<int> id;

  setUserInterestsRequest({required this.id});

  Map<String, dynamic> toJson() {
    return {
      'services': id,
    };
  }

}