part of 'reaction_imports.dart';

class ReactionViewModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final VelocityBloc<List<Post>> postssBloc = VelocityBloc<List<Post>>([]);

  void getPosts() async {
    var snapshots = await _firestore.collection('posts').get();
    postssBloc.onUpdateData(
        snapshots.docs.map((doc) => Post.fromFirestore(doc)).toList());
  }
}
