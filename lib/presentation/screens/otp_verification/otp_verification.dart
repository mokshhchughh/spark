part of 'otp_verification_imports.dart';

@RoutePage()
class OtpVerification extends StatefulWidget {
  const OtpVerification(
      {super.key, required this.verificationId, required this.mobileNumber});

  final String verificationId;
  final String mobileNumber;

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  OtpVerificationViewModel otpVerificationViewModel =
      OtpVerificationViewModel();

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
              TitleMedium(
                  title:
                      'Please enter 6-digit OTP sent to ${widget.mobileNumber}'),
              AppSizes.verticalSpace,
              PinFields(
                obscureText: true,
                autofocus: true,
                borderRadius: 5.r,
                controller: otpVerificationViewModel._otpController,
                onTap: () {},
                onChanged: (value) {},
                onCompleted: (value) {
                  otpVerificationViewModel.signInWithPhoneNumber(
                      widget.verificationId, context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
