part of 'dashboard_imports.dart';

@RoutePage()
class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: IndexedStack(
        index: currentIndex,
        children: const [
          Home(),
          Community(),
          Profile(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: currentIndex == 0 ? AppColors.black : AppColors.white,
        currentIndex: currentIndex,
        selectedItemColor:
            currentIndex == 0 ? AppColors.white : AppColors.black,
        unselectedItemColor: AppColors.primary50,
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        unselectedLabelStyle: TextStyle(
          fontSize: Theme.of(context).textTheme.labelSmall!.fontSize,
          color: Theme.of(context).textTheme.labelSmall!.color,
          fontWeight: Theme.of(context).textTheme.labelSmall!.fontWeight,
          overflow: Theme.of(context).textTheme.labelSmall!.overflow,
          decoration: Theme.of(context).textTheme.labelSmall!.decoration,
        ),
        selectedLabelStyle: TextStyle(
          fontSize: Theme.of(context).textTheme.labelSmall!.fontSize,
          color: Theme.of(context).textTheme.labelSmall!.color,
          fontWeight: Theme.of(context).textTheme.labelSmall!.fontWeight,
          overflow: Theme.of(context).textTheme.labelSmall!.overflow,
          decoration: Theme.of(context).textTheme.labelSmall!.decoration,
        ),
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Image.asset(
              currentIndex == 0
                  ? AppIcons.iconsHome
                  : AppIcons.iconsHomeOutline,
              height: 24.h,
              width: 24.w,
              color: currentIndex == 0 ? AppColors.white : AppColors.primary50,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Community',
            icon: Image.asset(
              currentIndex == 3
                  ? AppIcons.iconsHome
                  : AppIcons.iconsHomeOutline,
              height: 24.h,
              width: 24.w,
              color: currentIndex == 3 ? AppColors.black : AppColors.primary50,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Image.asset(
              currentIndex == 4
                  ? AppIcons.iconsUser
                  : AppIcons.iconsUserRoundedOutline,
              height: 24.h,
              width: 24.w,
              color: currentIndex == 4 ? AppColors.black : AppColors.primary50,
            ),
          ),
        ],
        onTap: (index) {
          setState(() {});
          currentIndex = index;
        },
      ),
    );
  }
}
