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
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: AppPaddings.appPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DisplaySmall(
                title: 'Mobile Number',
                fontWeight: FontWeight.bold,
              ),
              const TitleMedium(title: 'Please enter 10-digit mobile number'),
              AppSizes.gap12Space,
              Row(
                children: [
                  CountryCodePicker(
                    onChanged: (CountryCode countryCode) {
                      log("New Country selected: $countryCode");
                    },
                    initialSelection: 'IN',
                    favorite: const ['+91', 'IN'],
                    showCountryOnly: false,
                    showOnlyCountryWhenClosed: false,
                    alignLeft: false,
                  ),
                  PrimaryTextField(
                          controller: _phoneController,
                          keyboardType: TextInputType.number)
                      .expand(),
                ],
              ),
              const Spacer(),
              PrimaryButton(
                title: 'Send OTP',
                onTap: () {
                  // _verifyPhoneNumber();
                  AutoRouter.of(context).push(
                    OtpVerificationRoute(verificationId: otpVerificationId),
                  );
                },
              ),
            ],
          ),
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
