class IsFollowCard {

  bool? isFollow;

  IsFollowCard({this.isFollow});

  Map<String, dynamic> toJson() {
    return {

      'isFollow': this.isFollow,
    };
  }

}