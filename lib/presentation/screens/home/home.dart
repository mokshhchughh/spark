part of 'home_imports.dart';

@RoutePage()
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    homeViewModel.pageController = PageController(initialPage: 0);
    homeViewModel.startAutoScroll();
    super.initState();
  }

  @override
  void dispose() {
    homeViewModel._timer?.cancel();
    homeViewModel.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
          leadingWidth: 300,
          leading: Row(
            children: [
              AppSizes.horizontalSpace,
              Image.asset(
                AppIcons.iconsSparkLogo,
                width: 23,
                height: 27,
              ),
              AppSizes.gapH10Space,
              const TitleLarge(
                title: 'Spark',
                fontWeight: FontWeight.w900,
                color: AppColors.primary,
              )
            ],
          ),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              AppSizes.verticalSpace,
              const SearchTextField(
                hintText: 'Bangalore, India',
                fillColor: AppColors.white,
              ).pSymmetric(h: 16),
              AppSizes.verticalSpace,
              SizedBox(
                height: 120,
                child: PageView(
                  controller: homeViewModel.pageController,
                  children: List.generate(
                    3,
                    (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        padding: const EdgeInsets.all(16),
                        height: 120,
                        decoration: BoxDecoration(
                          color: const Color(0xffDFB6FF),
                          borderRadius: BorderRadius.circular(38),
                        ),
                        child: TitleLarge(
                          title: index == 0
                              ? 'Giveaways'
                              : index == 1
                                  ? 'Scholarship'
                                  : 'Today\'s Events',
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff8F00FF),
                        ),
                      );
                    },
                  ),
                ),
              ),
              AppSizes.gap12Space,
              Center(
                child: SmoothPageIndicator(
                  controller: homeViewModel.pageController, // PageController
                  count: 3,
                  effect: const WormEffect(
                    activeDotColor: AppColors.primary,
                    dotHeight: 10.0,
                    dotWidth: 10.0,
                  ), // your preferred effect
                  onDotClicked: (index) {},
                ),
              ),
              AppSizes.verticalSpace,
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(38),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      shrinkWrap: true,
                      separatorBuilder: (_, __) => const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Divider(
                          color: AppColors.alphaBlack20,
                        ),
                      ),
                      itemBuilder: (context, index) {
                        return const PostsCard();
                      },
                    ),
                    AppSizes.gap24Space,
                    const Divider(
                      color: AppColors.alphaBlack20,
                    ),
                    AppSizes.gap12Space,
                    const TitleLarge(
                      title: 'Yayy! keep growing',
                      fontWeight: FontWeight.bold,
                    ),
                    AppSizes.gap12Space,
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xfff4f4f4),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  AppIcons.iconsHistory,
                                  color: AppColors.primary,
                                  scale: 2,
                                ),
                                const TitleMedium(
                                  title: '7 Days',
                                  fontWeight: FontWeight.bold,
                                )
                              ],
                            ),
                          ),
                          AppSizes.gapH10Space,
                          Column(
                            children: [
                              const TitleMedium(
                                title: '21 Profile views last 7 days',
                                fontWeight: FontWeight.bold,
                              ),
                              AppSizes.gap12Space,
                              Stack(
                                children: [
                                  ...List.generate(4, (index) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: index == 0
                                              ? 12
                                              : index == 1
                                                  ? 36
                                                  : 60),
                                      child: CircleAvatar(
                                        foregroundImage: NetworkImage(
                                          'https://i.pravatar.cc/50?u=$index',
                                        ),
                                      ),
                                    );
                                  })
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    AppSizes.gap12Space,
                    PrimaryButton(
                      title: 'View more',
                      onTap: () {},
                    ),
                    AppSizes.gap24Space,
                    const Divider(
                      color: AppColors.alphaBlack20,
                    ),
                    AppSizes.gap12Space,
                    const SecondPostsCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
