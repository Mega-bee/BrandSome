class IsFollower {

  bool  isFollow;

  IsFollower({required this.isFollow});

  Map<String, dynamic> toJson() {
    return {
      'IsFollow': isFollow,
    };
  }

}