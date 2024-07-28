part of 'widget_imports.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget(
      {super.key, required this.state, required this.profileViewModel});

  final VelocityState<Map<String, dynamic>?> state;
  final ProfileViewModel profileViewModel;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      stretch: true,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.white,
      actions: [
        IconButton(
          onPressed: () => profileViewModel.logOut(context),
          icon: Image.asset(
            AppIcons.iconsLogout2,
            scale: 2,
          ),
        ),
      ],
      expandedHeight: 360,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            background: Stack(
              children: [
                Padding(
                  padding: AppPaddings.appPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(AppIcons.iconsNormal),
                          ),
                          AppSizes.gapH10Space,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitleMedium(
                                title: state.data!['name'],
                                fontWeight: FontWeight.bold,
                              ),
                              AppRichText(
                                mainText: '${state.data!['gender']}, ',
                                firstText: state.data!['age'],
                                mainTextStyle: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(color: AppColors.alphaBlack70),
                                firstTextStyle: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(color: AppColors.alphaBlack70),
                              ),
                              TitleSmall(
                                  title: "Class: ${state.data!['class']}",
                                  color: AppColors.alphaBlack70),
                            ],
                          )
                        ],
                      ),
                      AppSizes.gap32Space,
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.grey300,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  AppIcons.iconsHandshake,
                                  height: 40,
                                  width: 40,
                                ),
                                AppSizes.gap8Space,
                                const TitleSmall(title: 'Connections'),
                                TitleLarge(
                                  title: state.data!['connections'].toString(),
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 100,
                              width: 1,
                              child: Divider(
                                height: 100,
                                thickness: 60,
                                color: AppColors.grey300,
                              ),
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  AppIcons.iconsTrophy,
                                  height: 40,
                                  width: 40,
                                ),
                                AppSizes.gap8Space,
                                const TitleSmall(
                                  title: 'Trophies',
                                ),
                                TitleLarge(
                                  title: state.data!['trophies'].toString(),
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 100,
                              width: 1,
                              child: Divider(
                                height: 100,
                                thickness: 60,
                                color: AppColors.grey300,
                              ),
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  AppIcons.iconsPlanner,
                                  height: 40,
                                  width: 40,
                                ),
                                AppSizes.gap8Space,
                                const TitleSmall(title: 'Events'),
                                TitleLarge(
                                  title: state.data!['events'].toString(),
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
