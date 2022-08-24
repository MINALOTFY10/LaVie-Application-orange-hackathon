class ForumModel {
  late String forumId;
  late String title;
  late String description;
  late String imageUrl;
  late String userId;
  late List<Likes> ForumLikes=[];
  late List<Comments> ForumComments=[];
  late User user;


  ForumModel({
    required this.forumId,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.userId,
    required this.ForumLikes,
    required this.ForumComments,
    required this.user,
  });

  // named constructor
  ForumModel.fromJson(Map<String, dynamic> json) {
    forumId = json['forumId']??"";
    title = json['title']??"";
    description = json['description']??"";
    imageUrl = json['imageUrl']??"";
    userId = json['userId']??"";

    // for(int i=0;i<json['ForumLikes'].length;i++){
    //   ForumLikes.add(Likes.fromJson(json['ForumLikes'][i]));
    // }
    // for(int i=0;i<json['ForumComments'].length;i++){
    //   ForumComments.add(Comments.fromJson(json['ForumComments'][i]));
    // }
    //   user=User.fromJson(json['user']);
  }
}

class User {
  late final String firstName;
  late final String lastName;
  late final String imageUrl;

  User({
    required this.firstName,
    required this.lastName,
    required this.imageUrl,
  });

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName']??"";
    lastName = json['lastName']??"";
    imageUrl = json['imageUrl']??"";
  }
}

class Likes {
  late final String forumId;
  late final String userId;

  Likes({
    required this.forumId,
    required this.userId,
  });

  Likes.fromJson(Map<String, dynamic> json) {
    forumId = json['forumId']??"";
    userId = json['userId']??"";
  }
}

class Comments {
  late final String forumCommentId;
  late final String forumId;
  late final String userId;
  late final String comment;
  late final String createdAt;

  Comments({
    required this.forumCommentId,
    required this.forumId,
    required this.userId,
    required this.comment,
    required this.createdAt,
  });

  Comments.fromJson(Map<String, dynamic> json) {
    forumCommentId = json['forumCommentId']??"";
    forumId = json['forumId']??"";
    userId = json['userId']??"";
    comment = json['comment']??"";
    createdAt = json['createdAt']??"";
  }
}