part of 'auth_imports.dart';

class AuthViewModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _phoneController = TextEditingController();

  final VelocityBloc<bool> isLoadingBloc = VelocityBloc<bool>(false);
  final VelocityBloc<String> countryCodeBloc = VelocityBloc<String>('+91');

  void verifyPhoneNumber(context) async {
    isLoadingBloc.onUpdateData(true);
    await _auth.verifyPhoneNumber(
      phoneNumber: countryCodeBloc.state.data + _phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // await _auth.signInWithCredential(credential);
        VxToast.show(context,
            msg:
                'Phone number automatically verified and user signed in: ${_auth.currentUser?.uid}');
      },
      verificationFailed: (FirebaseAuthException e) {
        VxToast.show(context,
            msg:
                'Phone number verification failed. Code: ${e.code}. Message: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
        VxToast.show(context,
            msg: 'Please check your phone for the verification code.');
        AutoRouter.of(context).push(
          OtpVerificationRoute(
              verificationId: verificationId,
              mobileNumber: countryCodeBloc.state.data + _phoneController.text),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    isLoadingBloc.onUpdateData(false);
  }
}
