part of 'home_imports.dart';

@RoutePage()
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int page = 0;
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
        body: SafeArea(
          child: ListView(
            children: [
              const SearchTextField(
                hintText: 'Bangalore, India',
              ).pSymmetric(h: 16),
              AppSizes.verticalSpace,
              VxSwiper(
                height: 150,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                onPageChanged: (index) {
                  setState(() {
                    page = index;
                  });
                },
                items: [
                  GestureDetector(
                    onTap: () {
                      AutoRouter.of(context).push(const HomeDetailsRoute());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: AppColors.goldGradient,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            offset: const Offset(0, 4),
                            blurRadius: 20.0,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      AutoRouter.of(context).push(const HomeDetailsRoute());
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        gradient: AppColors.silverGradient,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            offset: const Offset(0, 4),
                            blurRadius: 20.0,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      AutoRouter.of(context).push(const HomeDetailsRoute());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: AppColors.yellowGradient,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            offset: const Offset(0, 4),
                            blurRadius: 20.0,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              AppSizes.gap12Space,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(3, (index) {
                    return Container(
                      height: 8,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      width: 8,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: page == index
                              ? AppColors.primary
                              : AppColors.grey200),
                    );
                  })
                ],
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
