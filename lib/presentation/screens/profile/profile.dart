part of 'profile_imports.dart';

@RoutePage()
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ProfileViewModel profileViewModel = ProfileViewModel();

  @override
  void initState() {
    profileViewModel.getUserDeails();
    super.initState();
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
        appBar: AppBar(
          backgroundColor: AppColors.transparent,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () => profileViewModel.logOut(context),
              icon: Image.asset(
                AppIcons.iconsLogout2,
                scale: 2,
              ),
            ),
          ],
        ),
        body: BlocBuilder<VelocityBloc<Map<String, dynamic>?>,
            VelocityState<Map<String, dynamic>?>>(
          bloc: profileViewModel.userDeatils,
          builder: (context, state) {
            if (state is VelocityInitialState) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else {
              return RefreshIndicator(
                onRefresh: () => profileViewModel.getUserDeails(),
                child: Column(
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
                                  radius: 30,
                                  backgroundImage:
                                      AssetImage(AppIcons.iconsNormal),
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
                                          .copyWith(
                                              color: AppColors.alphaBlack70),
                                      firstTextStyle: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              color: AppColors.alphaBlack70),
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
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.grey300,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      const TitleSmall(title: 'Connections'),
                                      TitleLarge(
                                        title: state.data!['connections']
                                            .toString(),
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
                                      const TitleSmall(
                                        title: 'Trophies',
                                      ),
                                      TitleLarge(
                                        title:
                                            state.data!['trophies'].toString(),
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
                        separatorBuilder: (context, index) =>
                            AppSizes.verticalSpace,
                        itemBuilder: (context, index) {
                          return ListTile(
                            tileColor: index == 0
                                ? AppColors.primary.withOpacity(0.1)
                                : AppColors.transparent,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: AppColors.primary.withOpacity(0.3)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            leading: TitleSmall(
                                title: index == 0
                                    ? "#${state.data!['rank'].toString()}"
                                    : "#${index.toString()}"),
                            title: TitleMedium(
                                title: index == 0
                                    ? state.data!['name'].toString()
                                    : 'User FullName'),
                            trailing: index == 1
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
          },
        ),
      ),
    );
  }
}
