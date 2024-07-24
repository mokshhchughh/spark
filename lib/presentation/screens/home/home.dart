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
          image: AssetImage(AppIcons.iconsSparkBg),
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
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 7,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return const ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(AppIcons.iconsNormal),
                      ),
                      title: TitleMedium(title: 'User Full Name'),
                      subtitle: TitleSmall(
                        title: 'Designation',
                        color: AppColors.alphaBlack50,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
