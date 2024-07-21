part of 'auth_imports.dart';

@RoutePage()
class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  String otpVerificationId = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Phone number'),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _verifyPhoneNumber,
              child: const Text('Verify Phone Number'),
            ),
          ],
        ),
      ),
    );
  }

  void _verifyPhoneNumber() async {
    await _auth.verifyPhoneNumber(
      phoneNumber: _phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        _showSnackBar(
            'Phone number automatically verified and user signed in: ${_auth.currentUser?.uid}');
      },
      verificationFailed: (FirebaseAuthException e) {
        _showSnackBar(
            'Phone number verification failed. Code: ${e.code}. Message: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
        _showSnackBar('Please check your phone for the verification code.');
        AutoRouter.of(context)
            .popAndPush(OtpVerificationRoute(verificationId: verificationId));
        setState(() {
          otpVerificationId = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          otpVerificationId = verificationId;
        });
      },
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
