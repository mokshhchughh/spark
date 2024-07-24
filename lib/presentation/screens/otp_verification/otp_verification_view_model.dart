part of 'otp_verification_imports.dart';

class OtpVerificationViewModel {
  final TextEditingController _otpController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void signInWithPhoneNumber(verificationId, BuildContext context) async {
    final PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: _otpController.text,
    );

    try {
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;
      User? currentUser = _auth.currentUser;
      if (currentUser != null) {
        DocumentSnapshot userDoc =
            await _firestore.collection('users').doc(user!.uid).get();
        if (userDoc.exists && context.mounted) {
          AutoRouter.of(context).replaceAll([const DashboardRoute()]);
        } else {
          DocumentReference userDoc =
              _firestore.collection('users').doc(user.uid);
          await userDoc.set({
            'uid': user.uid,
            'phoneNumber': user.phoneNumber,
            'userType': 'students',
            'createdAt': FieldValue.serverTimestamp(),
          }).then(
            (value) {
              context.read<AuthBloc>().add(AuthLoggedInEvent(user));
              AutoRouter.of(context).push(const UserDetailsRoute());
            },
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        VxToast.show(context, msg: 'Failed to sign in: $e');
      }
    }
  }

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  addUserDetails(context, String gender, String myClass) async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentReference userDoc = _firestore.collection('users').doc(user.uid);
      await userDoc.set({
        'uid': user.uid,
        'name': fullNameController.text.trim(),
        'dateOfBirth': dateController.text,
        'gender': gender,
        'class': myClass,
        'connections': 0,
        'trophies': 0,
        'events': 0,
        'rank': 0,
      }, SetOptions(merge: true));
      log('User details updated: ${user.uid}');
      AutoRouter.of(context).push(const ChooseInterestsRoute());
    }
  }

  updateUserDetails(context, List<String> selectedChoices) async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentReference userDoc = _firestore.collection('users').doc(user.uid);
      await userDoc.set({
        'uid': user.uid,
        'interests': selectedChoices,
      }, SetOptions(merge: true));
      log('User details updated: ${user.uid}');
      AutoRouter.of(context).replaceAll([const DashboardRoute()]);
    }
  }

  int calculateAge(DateTime birthDate) {
    DateTime today = DateTime.now();
    int age = today.year - birthDate.year;
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    return age;
  }
}
