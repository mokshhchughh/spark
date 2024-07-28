part of 'profile_imports.dart';

class ProfileViewModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final VelocityBloc<Map<String, dynamic>?> userDeatils =
      VelocityBloc<Map<String, dynamic>?>(null);

  getUserDetails() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(user.uid).get();
      if (userDoc.exists) {
        userDeatils.onUpdateData(userDoc.data() as Map<String, dynamic>?);
      }
    }
  }

  logOut(context) async {
    await _auth.signOut().then(
      (value) {
        AutoRouter.of(context).replaceAll([const OnboardRoute()]);
      },
    );
  }
}
