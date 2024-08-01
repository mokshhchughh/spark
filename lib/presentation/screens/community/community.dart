part of 'community_imports.dart';

@RoutePage()
class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  List<bool> isSelected = [true, false];
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onButtonPressed(int index) {
    setState(() {
      for (int i = 0; i < isSelected.length; i++) {
        isSelected[i] = i == index;
      }
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const SearchTextField(
          hintText: 'Search',
          contentPadding: 8,
        ),
        actions: [
          IconButton(
            onPressed: () {
              VxBottomSheet.bottomSheetView(
                context,
                isSafeAreaFromBottom: true,
                backgroundColor: AppColors.white,
                child: FiltersSection(
                  eventsViewModel: EventsViewModel(),
                ),
              );
            },
            icon: Image.asset(
              AppIcons.iconsTuning,
              scale: 2,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                AppSizes.gap32Space,
                ToggleButtons(
                  borderRadius: BorderRadius.circular(18),
                  borderColor: AppColors.primary,
                  selectedBorderColor: AppColors.primary,
                  fillColor: AppColors.primary,
                  selectedColor: AppColors.white,
                  color: AppColors.black,
                  isSelected: isSelected,
                  onPressed: _onButtonPressed,
                  children: const [
                    SizedBox(
                      width: 120,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          'Community',
                          style: TextStyle(fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 120,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          'Peers',
                          style: TextStyle(fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                AppSizes.gap32Space,
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        for (int i = 0; i < isSelected.length; i++) {
                          isSelected[i] = i == index;
                        }
                      });
                    },
                    children: [
                      ListView(
                        children: [
                          ExpansionTile(
                            initiallyExpanded: true,
                            backgroundColor: AppColors.white,
                            collapsedBackgroundColor: AppColors.white,
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  color: AppColors.grey300,
                                ),
                                borderRadius: BorderRadius.circular(18)),
                            collapsedShape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  color: AppColors.alphaBlack40,
                                ),
                                borderRadius: BorderRadius.circular(18)),
                            title: const TitleMedium(
                              title: 'Recommended Groups',
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    leading: const CircleAvatar(
                                      radius: 24,
                                      backgroundImage:
                                          AssetImage(AppIcons.iconsNormal),
                                    ),
                                    title:
                                        const TitleMedium(title: "Group Name"),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const TitleSmall(
                                          title: 'Location',
                                          color: AppColors.alphaBlack50,
                                        ),
                                        AppSizes.gap2Space,
                                        Row(
                                          children: [
                                            Image.asset(
                                              scale: 3,
                                              AppIcons
                                                  .iconsUsersGroupRoundedFilled,
                                              color: AppColors.alphaBlack50,
                                            ),
                                            AppSizes.gapH4Space,
                                            const TitleSmall(
                                              title: '16+ peers',
                                              color: AppColors.alphaBlack50,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    trailing: TextButton.icon(
                                      onPressed: () {
                                        VxToast.show(context,
                                            msg:
                                                'Successfully joined the group.');
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor:
                                            AppColors.primary.withOpacity(0.1),
                                      ),
                                      label: const TitleSmall(title: 'Join'),
                                      icon: const Icon(Icons.add),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          AppSizes.verticalSpace,
                          ExpansionTile(
                            initiallyExpanded: true,
                            backgroundColor: AppColors.white,
                            collapsedBackgroundColor: AppColors.white,
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  color: AppColors.grey300,
                                ),
                                borderRadius: BorderRadius.circular(18)),
                            collapsedShape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  color: AppColors.alphaBlack40,
                                ),
                                borderRadius: BorderRadius.circular(18)),
                            title: const TitleMedium(
                              title: 'My Groups',
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return const ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage:
                                          AssetImage(AppIcons.iconsNormal),
                                    ),
                                    title: TitleMedium(title: "Group Name"),
                                    subtitle: TitleSmall(
                                      title: 'Location',
                                      color: AppColors.alphaBlack50,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      ListView(
                        children: [
                          ExpansionTile(
                            initiallyExpanded: true,
                            backgroundColor: AppColors.white,
                            collapsedBackgroundColor: AppColors.white,
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  color: AppColors.grey300,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            collapsedShape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  color: AppColors.alphaBlack40,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            title: const TitleMedium(
                              title: 'Peers',
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    leading: CircleAvatar(
                                      radius: 20,
                                      backgroundColor:
                                          AppColors.primary.withOpacity(0.1),
                                      child: Image.asset(
                                        scale: 2,
                                        AppIcons.iconsUsersGroupRoundedFilled,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                    title: const SizedBox(
                                      width: 200,
                                      child: TitleMedium(
                                        title: "Spark: The Career Growth App",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    subtitle: const TitleSmall(
                                      title: 'Moksh: icons for profile page',
                                      color: AppColors.darkTextColor,
                                    ),
                                    trailing: const TitleSmall(
                                      title: '22:51',
                                      color: AppColors.darkTextColor,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
