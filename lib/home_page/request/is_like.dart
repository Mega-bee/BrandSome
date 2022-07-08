class LikeRequest {
  bool? isLike;

  LikeRequest({this.isLike});

  Map<String, dynamic> toJson() {
    return {
      'Islike': this.isLike,
    };
  }

}