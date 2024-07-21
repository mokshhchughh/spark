part of 'profile_imports.dart';

@RoutePage()
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              AppIcons.iconsLogout2,
              scale: 2,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ColoredBox(
            color: AppColors.white,
            child: Padding(
              padding: AppPaddings.appPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(AppIcons.iconsNormal),
                      ),
                      AppSizes.gapH10Space,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TitleMedium(
                            title: 'Full Name',
                            fontWeight: FontWeight.bold,
                          ),
                          AppRichText(
                            mainText: 'Male, ',
                            firstText: '18',
                            mainTextStyle: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: AppColors.alphaBlack70),
                            firstTextStyle: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: AppColors.alphaBlack70),
                          ),
                          const TitleSmall(
                              title: '10th Class',
                              color: AppColors.alphaBlack70),
                        ],
                      )
                    ],
                  ),
                  AppSizes.gap32Space,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          TitleSmall(title: 'Connections'),
                          TitleLarge(
                            title: '23',
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          TitleSmall(
                            title: 'Trophies',
                          ),
                          TitleLarge(
                            title: '23',
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          TitleSmall(title: 'Events'),
                          TitleLarge(
                            title: '23',
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ],
                  ),
                  AppSizes.gap24Space,
                  const TitleLarge(
                    title: 'Leaderboard',
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 10,
              shrinkWrap: true,
              separatorBuilder: (context, index) => AppSizes.verticalSpace,
              itemBuilder: (context, index) {
                return ListTile(
                  tileColor: index == 0
                      ? AppColors.primary.withOpacity(0.1)
                      : AppColors.transparent,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: AppColors.primary.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  leading: TitleSmall(title: index.toString()),
                  title: const TitleMedium(title: 'User FullName'),
                  trailing: index == 0
                      ? Image.asset(
                          AppIcons.iconsTrophySvgrepoCom,
                          height: 20,
                        )
                      : const SizedBox.shrink(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
