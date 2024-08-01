part of 'add_post_imports.dart';

class AddPostViewModel {
  final TextEditingController postController = TextEditingController();
  final TextEditingController postAuthorController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  final VelocityBloc<bool> isLoadingBloc = VelocityBloc<bool>(false);
  final _uuid = const Uuid().v4();

  void clearFields() {
    postController.clear();
    descController.clear();
  }

  void addNewPost(context) async {
    isLoadingBloc.onUpdateData(true);
    await _db.collection('posts').doc(_uuid).set({
      'id': _uuid,
      'postTitle': postController.text,
      'postAuthor': postAuthorController.text,
      'postDescription': postController.text,
      'postLikes': 0,
      'postComments': 0,
      'likedBy': [],
      'createdAt': FieldValue.serverTimestamp(),
    });
    VxToast.show(context, msg: 'Post Added Successfully');
    clearFields();
    isLoadingBloc.onUpdateData(false);
  }
}
