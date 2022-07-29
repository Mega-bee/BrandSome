
import 'package:brandsome/categories_module/reponse/category_response.dart';
import '../../categories_module/reponse/add_location_response.dart';

class HomePageResponse {
  List<Post>? postt;
  List<MainCategoryModel>? categories;
  List<AddLocationResponse>? cities;

  HomePageResponse({this.postt,this.cities,this.categories});

  HomePageResponse.fromJson(Map<String, dynamic> json) {
    if (json['posts'] != null) {
      postt = <Post>[];
      json['posts'].forEach((v) {
        postt!.add( Post.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <MainCategoryModel>[];
      json['categories'].forEach((v) {
        categories!.add( MainCategoryModel.fromJson(v));
      });
    }
    if (json['cities'] != null) {
      cities = <AddLocationResponse>[];
      json['cities'].forEach((v) {
        cities!.add(AddLocationResponse.fromJson(v));
      });
    }
  }
}
class Post {
  int? id;
  String? profileImage;
  String? name;
  List<PostMedia>  postMedia =[];
  String? description;
  int  likeCount = 0;
  bool isLiked =false;
  String? city;
  String? type;

  Post(
      {this.id,
        this.profileImage,
        this.name,
     required   this.postMedia,
        this.description,
      required  this.likeCount,
        required this.isLiked ,
        this.city,
        this.type});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    profileImage = json['profileImage'];
    name = json['name'];
    if (json['postMedia'] != null) {
      postMedia = <PostMedia>[];
      json['postMedia'].forEach((v) {
        postMedia.add(PostMedia.fromJson(v));
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



