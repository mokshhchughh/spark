import 'package:cloud_firestore/cloud_firestore.dart';

class HomeModel {}

class Post {
  final String id;
  final String postTitle;
  final String postDescription;
  final String postAuthor;
  final int postLikes;
  final int postComments;
  final Timestamp createdAt;
  final List<String> likedBy;

  Post(
      {required this.id,
      required this.postTitle,
      required this.postAuthor,
      required this.postLikes,
      required this.postComments,
      required this.postDescription,
      required this.createdAt,
      required this.likedBy});

  factory Post.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Post(
      id: doc.id,
      postTitle: data['postTitle'] ?? '',
      postAuthor: data['postAuthor'] ?? '',
      postLikes: data['postLikes'] ?? 0,
      postComments: data['postComments'] ?? 0,
      postDescription: data['postDescription'] ?? '',
      createdAt: data['createdAt'] ?? Timestamp.now(),
      likedBy: List<String>.from(data['likedBy'] ?? []),
    );
  }
}
