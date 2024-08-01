part of 'home_imports.dart';

class HomeViewModel {
  PageController pageController = PageController();
  Timer? _timer;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final VelocityBloc<List<Post>> postssBloc = VelocityBloc<List<Post>>([]);

  // final VelocityBloc<int> likesCountBloc = VelocityBloc<int>(0);
  final VelocityBloc<List<int>> likesCountBloc = VelocityBloc<List<int>>([]);

  void startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (pageController.page!.round() == 2) {
        pageController.jumpToPage(0);
      } else {
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
    });
  }

  void getPosts() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('posts').get();
    List<Post> posts =
        querySnapshot.docs.map((doc) => Post.fromFirestore(doc)).toList();
    var snapshots = await _firestore.collection('posts').get();
    postssBloc.onUpdateData(
        snapshots.docs.map((doc) => Post.fromFirestore(doc)).toList());
    // int totalLikes =
    //     posts.fold(0, (previousValue, post) => previousValue + post.postLikes);

    List<int> likesCounts = posts.map((post) => post.postLikes).toList();
    likesCountBloc.onUpdateData(likesCounts);
  }

  Future<void> toggleLikePost(String postId) async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) return;

    DocumentReference postRef =
        FirebaseFirestore.instance.collection('posts').doc(postId);
    DocumentSnapshot postSnapshot = await postRef.get();

    if (!postSnapshot.exists) return;

    List<dynamic> likedBy = postSnapshot['likedBy'] ?? [];
    bool isLiked = likedBy.contains(currentUser.uid);

    if (isLiked) {
      await postRef.update({
        'likes': FieldValue.increment(-1),
        'likedBy': FieldValue.arrayRemove([currentUser.uid]),
      });
    } else {
      await postRef.update({
        'likes': FieldValue.increment(1),
        'likedBy': FieldValue.arrayUnion([currentUser.uid]),
      });
    }
  }
}
