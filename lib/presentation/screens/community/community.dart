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
                      child: Text('Mentors'),
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
                      ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return const ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage(AppIcons.iconsNormal),
                            ),
                            title: TitleMedium(title: "User Full Name"),
                            subtitle: TitleSmall(
                              title: 'Designation',
                              color: AppColors.alphaBlack50,
                            ),
                          );
                        },
                      ),
                      ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return const ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage(AppIcons.iconsNormal),
                            ),
                            title: TitleMedium(title: "User Full Name"),
                            subtitle: TitleSmall(
                              title: 'Designation',
                              color: AppColors.alphaBlack50,
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
        ),
      ),
    );
  }
}
