part of 'otp_verification_imports.dart';

@RoutePage()
class ChooseInterests extends StatefulWidget {
  const ChooseInterests({super.key});

  @override
  State<ChooseInterests> createState() => _ChooseInterestsState();
}

class _ChooseInterestsState extends State<ChooseInterests> {
  final List<String> _choices = [
    'Tech',
    'Arts',
    'Sports',
    'Singing',
    'Dancing',
    'Finance',
    'Entrepreneur',
    'Poetry',
    'Graphic',
    'Marketing',
    'Speaking',
    'Soft Skills',
    'Music',
    'Movies',
    'Books',
    'Travel',
    'Food',
    'Fitness',
    'Gaming',
  ];

  final List<String> _selectedChoices = [];

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
                  title: 'Interests',
                  fontWeight: FontWeight.bold,
                ),
                const TitleMedium(
                    title: 'Choose your interests. You can change them later'),
                AppSizes.gap24Space,
                Wrap(
                  spacing: 8.0,
                  children: _choices.map((choice) {
                    return ChoiceChip(
                      label: TitleSmall(
                          title: choice,
                          color: _selectedChoices.contains(choice)
                              ? AppColors.white
                              : AppColors.black),
                      selected: _selectedChoices.contains(choice),
                      selectedColor: AppColors.primary,
                      backgroundColor: AppColors.white,
                      checkmarkColor: AppColors.white,
                      side: BorderSide.none,
                      onSelected: (bool selected) {
                        setState(() {
                          if (selected) {
                            _selectedChoices.add(choice);
                          } else {
                            _selectedChoices.remove(choice);
                          }
                        });
                      },
                      elevation: 4.0,
                    );
                  }).toList(),
                ),
                const Spacer(),
                PrimaryButton(
                    title: "Let's Go",
                    onTap: () {
                      // otpVerificationViewModel.updateUserDetails(
                      //     context, _selectedChoices);
                      AutoRouter.of(context)
                          .replaceAll([const DashboardRoute()]);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
