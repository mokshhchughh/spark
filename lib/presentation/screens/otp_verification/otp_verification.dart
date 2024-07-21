part of 'otp_verification_imports.dart';

@RoutePage()
class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key, required this.verificationId});

  final String verificationId;

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  final TextEditingController _otpController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: AppPaddings.appPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DisplaySmall(
                title: 'Verify OTP',
                fontWeight: FontWeight.bold,
              ),
              const TitleMedium(
                  title: 'Please enter 6-digit OTP sent to mobile number'),
              AppSizes.verticalSpace,
              PinFields(
                obscureText: true,
                autofocus: true,
                borderRadius: 5.r,
                onTap: () {},
                onChanged: (value) {},
                onCompleted: (value) {
                  // FocusManager.instance.primaryFocus?.unfocus();
                  // Future.delayed(const Duration(milliseconds: 800))
                  //     .then((value) {});
                  AutoRouter.of(context).push(const UserDetailsRoute());
                },
              ),
              // TextField(
              //   controller: _otpController,
              //   decoration: const InputDecoration(labelText: 'OTP'),
              //   keyboardType: TextInputType.number,
              // ),
              const SizedBox(height: 16),
              // ElevatedButton(
              //   onPressed: _signInWithPhoneNumber,
              //   child: const Text('Sign In'),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void _signInWithPhoneNumber() async {
    final PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: widget.verificationId,
      smsCode: _otpController.text,
    );

    try {
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        _showSnackBar('Successfully signed in UID: ${user.uid}');
      } else {
        _showSnackBar('Sign in failed');
      }
    } catch (e) {
      _showSnackBar('Failed to sign in: $e');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
