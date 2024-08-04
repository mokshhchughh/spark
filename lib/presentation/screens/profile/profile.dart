part of 'profile_imports.dart';

@RoutePage()
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ProfileViewModel profileViewModel = ProfileViewModel();
  final ScrollController _scrollController = ScrollController();
  bool _showTitle = false;

  @override
  void initState() {
    profileViewModel.getUserDetails();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    if (_scrollController.hasClients) {
      if (_scrollController.offset > 80 && !_showTitle) {
        setState(() {
          _showTitle = true;
        });
      } else if (_scrollController.offset <= 80 && _showTitle) {
        setState(() {
          _showTitle = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              onRefresh: () => profileViewModel.getUserDetails(),
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverAppBar(
                    backgroundColor: AppColors.white,
                    forceMaterialTransparency: false,
                    automaticallyImplyLeading: false,
                    pinned: true,
                    expandedHeight: 120.0,
                    flexibleSpace: FlexibleSpaceBar(
                      title: _showTitle
                          ? TitleMedium(
                              title: state.data!['name'],
                              fontWeight: FontWeight.bold,
                            ).pOnly(left: 16)
                          : null,
                      background: Padding(
                        padding: const EdgeInsets.only(top: 50.0, left: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(AppIcons.iconsNormal),
                            ),
                            AppSizes.gapH10Space,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                  color: AppColors.alphaBlack70,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
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
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Padding(
                          padding: AppPaddings.appPadding,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                    top: 29, bottom: 19, left: 31, right: 34),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.grey300,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Image.asset(
                                          AppIcons.iconsHandshake,
                                          height: 59,
                                          width: 61,
                                        ),
                                        AppSizes.gap8Space,
                                        const TitleSmall(
                                          title: 'Connections',
                                          color: Color(0xff8B8B8B),
                                        ),
                                        TitleLarge(
                                          title: state.data!['connections']
                                              .toString(),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 64,
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
                                          height: 61,
                                          width: 60,
                                        ),
                                        AppSizes.gap8Space,
                                        const TitleSmall(
                                          title: 'Trophies',
                                          color: Color(0xff8B8B8B),
                                        ),
                                        TitleLarge(
                                          title: state.data!['trophies']
                                              .toString(),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 64,
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
                                          height: 50,
                                          width: 51,
                                        ),
                                        const SizedBox(height: 18),
                                        const TitleSmall(
                                          title: 'Events',
                                          color: Color(0xff8B8B8B),
                                        ),
                                        TitleLarge(
                                          title:
                                              state.data!['events'].toString(),
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
                              ListView.separated(
                                itemCount: 10,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                separatorBuilder: (context, index) =>
                                    AppSizes.verticalSpace,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.primary
                                              .withOpacity(0.3)),
                                      borderRadius: BorderRadius.circular(10),
                                      color: index == 0
                                          ? AppColors.primary.withOpacity(0.1)
                                          : AppColors.transparent,
                                    ),
                                    child: Row(
                                      children: [
                                        TitleSmall(
                                            title: index == 0
                                                ? "#${state.data!['rank'].toString()}"
                                                : "#${index.toString()}"),
                                        AppSizes.gapH12Space,
                                        TitleMedium(
                                            title: index == 0
                                                ? state.data!['name'].toString()
                                                : 'User FullName'),
                                        const Spacer(),
                                        index == 1
                                            ? Image.asset(
                                                AppIcons.iconsTrophy,
                                                height: 20,
                                              )
                                            : const SizedBox.shrink(),
                                      ],
                                    ),
                                  );
                                },
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
          }
        },
      ),
    );
  }
}
