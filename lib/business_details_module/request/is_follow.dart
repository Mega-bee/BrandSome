class IsFollower {

  bool? isFollow;

  IsFollower({this.isFollow});

  Map<String, dynamic> toJson() {
    return {

      'IsFollow': this.isFollow,
    };
  }

}