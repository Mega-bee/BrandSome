
class HomePageResponse {


  List<Post>? postt;


  HomePageResponse({this.postt,});

  HomePageResponse.fromJson(Map<String, dynamic> json) {
    if (json['posts'] != null) {
      postt = <Post>[];
      json['posts'].forEach((v) {
        postt!.add(new Post.fromJson(v));
      });
    }
  }
}
class Post {
  int? id;
  String? profileImage;
  String? name;
  List<PostMedia>? postMedia;
  String? description;
  int? likeCount;
  bool? isLiked;
  String? city;
  String? type;

  Post(
      {this.id,
        this.profileImage,
        this.name,
        this.postMedia,
        this.description,
        this.likeCount,
        this.isLiked,
        this.city,
        this.type});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    profileImage = json['profileImage'];
    name = json['name'];
    if (json['postMedia'] != null) {
      postMedia = <PostMedia>[];
      json['postMedia'].forEach((v) {
        postMedia!.add(new PostMedia.fromJson(v));
      });
    }
    description = json['description'];
    likeCount = json['likeCount'];
    isLiked = json['isLiked'];
    city = json['city'];
    type = json['type'];
  }

}

class PostMedia {
  int? id;
  String? url;
  int? mediaTypeId;
  String? mediaTypeName;

  PostMedia({this.id, this.url, this.mediaTypeId, this.mediaTypeName});

  PostMedia.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    mediaTypeId = json['mediaTypeId'];
    mediaTypeName = json['mediaTypeName'];
  }

}



