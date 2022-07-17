class AddReviewRequest {
  String? Bussinessid;
  String? Description;

 AddReviewRequest({ this.Bussinessid, this.Description});

  Map<String, dynamic> toJson() {
    return {
      'businessId': Bussinessid,
      'description': Description,
    };
  }

}