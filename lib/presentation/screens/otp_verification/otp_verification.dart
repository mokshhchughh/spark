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
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AppIcons.iconsOnboardBg),
        ),
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: AppBar(
          backgroundColor: AppColors.transparent,
        ),
        body: SafeArea(
          child: Padding(
            padding: AppPaddings.appPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeadlineMedium(
                  title: 'Verify OTP',
                  fontWeight: FontWeight.bold,
                ),
                TitleMedium(
                    title:
                        'Please enter 6-digit OTP sent to ${widget.mobileNumber}'),
                AppSizes.gap24Space,
                PinFields(
                  obscureText: false,
                  autofocus: true,
                  borderRadius: 16.r,
                  controller: otpVerificationViewModel._otpController,
                  onTap: () {},
                  onChanged: (value) {},
                  onCompleted: (value) {
                    AutoRouter.of(context).push(const UserDetailsRoute());
                    // otpVerificationViewModel.signInWithPhoneNumber(
                    //     widget.verificationId, context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
