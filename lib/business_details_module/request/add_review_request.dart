class AddReviewRequest {


 final String? Bussinessid;
 final String? Description;

 AddReviewRequest({ this.Bussinessid, this.Description});

  Map<String, dynamic> toJson() {
    return {
      'BusinessId': this.Bussinessid,
      'Description': this.Description,
    };
  }

}