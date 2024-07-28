part of 'auth_imports.dart';

@RoutePage()
class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  AuthViewModel authViewModel = AuthViewModel();
  String mobileNumber = '';
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
                  title: 'Mobile Number',
                  fontWeight: FontWeight.bold,
                ),
                const TitleMedium(title: 'Please enter 10-digit mobile number'),
                AppSizes.gap24Space,
                Row(
                  children: [
                    CountryCodePicker(
                      onChanged: (CountryCode countryCode) {
                        authViewModel.countryCodeBloc
                            .onUpdateData(countryCode.dialCode!);
                        log("New Country selected: ${countryCode.dialCode}");
                      },
                      initialSelection: 'IN',
                      favorite: const ['+91', 'IN'],
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                    ),
                    PrimaryTextField(
                      fillColor: AppColors.white,
                      controller: authViewModel._phoneController,
                      keyboardType: TextInputType.number,
                      onChanged: (p0) {
                        setState(() {
                          mobileNumber = p0;
                        });
                      },
                    ).expand(),
                  ],
                ),
                const Spacer(),
                BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
                  bloc: authViewModel.isLoadingBloc,
                  builder: (context, state) {
                    return PrimaryButton(
                      title: 'Send OTP',
                      isLoading: state.data,
                      onTap: mobileNumber.isNotEmptyAndNotNull
                          ? () {
                              AutoRouter.of(context).push(OtpVerificationRoute(
                                  verificationId: '1',
                                  mobileNumber: '3454543534353'));

                              // authViewModel.verifyPhoneNumber(context);
                            }
                          : null,
                    );
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
