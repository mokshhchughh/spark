part of 'onboard_imports.dart';

@RoutePage()
class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  OnboardViewModel onboardViewModel = OnboardViewModel();

  @override
  void dispose() {
    onboardViewModel.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppSizes.gap12Space,
              SmoothPageIndicator(
                controller: onboardViewModel.pageController, // PageController
                count: 3,
                effect: const WormEffect(
                  activeDotColor: AppColors.primary,
                  dotHeight: 4.0,
                  dotWidth: 100.0,
                ), // your preferred effect
                onDotClicked: (index) {},
              ),
              AppSizes.verticalSpace,
              const DisplaySmall(
                title: 'Live Interacting with Community',
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w600,
              ),
              PageView(
                controller: onboardViewModel.pageController,
                children: [
                  Image.asset(AppIcons.iconsChat),
                  Image.asset(AppIcons.iconsChat),
                  Image.asset(AppIcons.iconsChat),
                ],
              ).expand(),
              PrimaryButton(
                title: "Sign in to continue",
                onTap: () => AutoRouter.of(context).push(
                  const AuthRoute(),
                ),
              ),
              AppSizes.verticalSpace,
              AppRichText(
                mainText: 'Don’t have an account? ',
                firstText: "Sign up",
                firstTextStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                onTap: () {},
              ),
              AppSizes.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
