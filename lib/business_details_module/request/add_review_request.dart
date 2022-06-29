class AddReviewRequest {
  String? Bussinessid;
  String? Description;

 AddReviewRequest({ this.Bussinessid, this.Description});

  Map<String, dynamic> toJson() {
    return {
      'businessId': this.Bussinessid,
      'description': this.Description,
    };
  }

}