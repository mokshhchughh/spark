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
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AppIcons.iconsOnboardBg),
        ),
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        extendBody: true,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: DefaultTabController(
            length: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: SearchTextField(
                          hintText: 'Search',
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          AppIcons.iconsTuning,
                          scale: 2,
                        ),
                      ),
                    ],
                  ),
                  AppSizes.gap32Space,
                  ToggleButtons(
                    borderRadius: BorderRadius.circular(8),
                    borderColor: AppColors.primary,
                    selectedBorderColor: AppColors.primary,
                    fillColor: AppColors.primary.withOpacity(0.1),
                    selectedColor: AppColors.primary,
                    color: Colors.black,
                    isSelected: isSelected,
                    onPressed: _onButtonPressed,
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text('Community'),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text('Allies'),
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
                                    color: AppColors.alphaBlack40,
                                  ),
                                  borderRadius: BorderRadius.circular(20)),
                              collapsedShape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    color: AppColors.alphaBlack40,
                                  ),
                                  borderRadius: BorderRadius.circular(20)),
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
                                        backgroundImage:
                                            AssetImage(AppIcons.iconsNormal),
                                      ),
                                      title: const TitleMedium(
                                          title: "Group Name"),
                                      subtitle: const TitleSmall(
                                        title: 'Location',
                                        color: AppColors.alphaBlack50,
                                      ),
                                      trailing: TextButton.icon(
                                        onPressed: () {
                                          VxToast.show(context,
                                              msg:
                                                  'Successfully joined the group.');
                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor: AppColors.primary
                                              .withOpacity(0.1),
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
                                    color: AppColors.alphaBlack40,
                                  ),
                                  borderRadius: BorderRadius.circular(20)),
                              collapsedShape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    color: AppColors.alphaBlack40,
                                  ),
                                  borderRadius: BorderRadius.circular(20)),
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
                                    color: AppColors.alphaBlack40,
                                  ),
                                  borderRadius: BorderRadius.circular(20)),
                              collapsedShape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    color: AppColors.alphaBlack40,
                                  ),
                                  borderRadius: BorderRadius.circular(20)),
                              title: const TitleMedium(
                                title: 'Allies',
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 4,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      leading: const CircleAvatar(
                                        backgroundImage:
                                            AssetImage(AppIcons.iconsNormal),
                                      ),
                                      title:
                                          const TitleMedium(title: "User Name"),
                                      subtitle: Row(
                                        children: [
                                          const Icon(
                                            Icons.done_all,
                                            color: AppColors.alphaBlack50,
                                          ),
                                          AppSizes.gapH10Space,
                                          const TitleSmall(
                                            title: 'Message',
                                            color: AppColors.alphaBlack50,
                                          ),
                                        ],
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
      ),
    );
  }
}
