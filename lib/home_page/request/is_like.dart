class LikeRequest {
  bool  isLike;

  LikeRequest({required this.isLike});

  Map<String, dynamic> toJson() {
    return {
      'Islike': isLike,
    };
  }

}