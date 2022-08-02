class NotificationModel {
  String? initiatorId;
  String? initiatorName;
  String? initiatorImage;
  int? eventId;
  int? businessId;
  String? businessName;
  int? reviewId;
  int? postId;
  String? postImage;
  DateTime? createdDate;

  NotificationModel(
      {this.initiatorId,
        this.initiatorName,
        this.initiatorImage,
        this.eventId,
        this.businessId,
        this.businessName,
        this.reviewId,
        this.postId,
        this.postImage,
        this.createdDate});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    initiatorId = json['initiatorId'];
    initiatorName = json['initiatorName'];
    initiatorImage = json['initiatorImage'];
    eventId = json['eventId'];
    businessId = json['businessId'];
    businessName = json['businessName'];
    reviewId = json['reviewId'];
    postId = json['postId'];
    postImage = json['postImage'];
    createdDate = DateTime.parse(json['createdDate']);

  }


}