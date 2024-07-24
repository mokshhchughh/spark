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
  void initState() {
    onboardViewModel.pageController = PageController(initialPage: 0);
    onboardViewModel.startAutoScroll();
    super.initState();
  }

  @override
  void dispose() {
    onboardViewModel._timer?.cancel();
    onboardViewModel.pageController.dispose();
    super.dispose();
  }

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
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 0.4.sh,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        height: 100,
                        width: 100,
                        bottom: 0,
                        child: Image.asset(AppIcons.iconsUser1),
                      ),
                      Positioned(
                        left: 0,
                        height: 80,
                        width: 80,
                        top: 10,
                        child: Image.asset(AppIcons.iconsUser4),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(AppIcons.iconsUser3),
                      ),
                      Positioned(
                        right: 0,
                        top: 30,
                        height: 120,
                        width: 120,
                        child: Image.asset(AppIcons.iconsUser2),
                      ),
                      Positioned(
                        right: 30,
                        bottom: 0,
                        height: 120,
                        width: 120,
                        child: Image.asset(AppIcons.iconsUser5),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: 120,
                  child: PageView(
                    controller: onboardViewModel.pageController,
                    children: const [
                      DisplaySmall(
                        title: 'Live Interacting with Community',
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w600,
                      ),
                      DisplaySmall(
                        title: 'Live Interacting with Community',
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w600,
                      ),
                      DisplaySmall(
                        title: 'Live Interacting with Community',
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                SmoothPageIndicator(
                  controller: onboardViewModel.pageController, // PageController
                  count: 3,
                  effect: const WormEffect(
                    activeDotColor: AppColors.primary,
                    dotHeight: 10.0,
                    dotWidth: 10.0,
                  ), // your preferred effect
                  onDotClicked: (index) {},
                ),
                AppSizes.gap28Space,
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
                  firstTextStyle:
                      Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
