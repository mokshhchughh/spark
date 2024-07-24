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
          Events(),
          Profile(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.white,
        currentIndex: currentIndex,
        selectedItemColor: AppColors.primary,
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
          color: AppColors.primary,
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
              color:
                  currentIndex == 0 ? AppColors.primary : AppColors.primary50,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Community',
            icon: Image.asset(
              currentIndex == 1
                  ? AppIcons.iconsUsersGroupTwoRounded
                  : AppIcons.iconsUsersGroupTwoRoundedOutline,
              height: 24.h,
              width: 24.w,
              color:
                  currentIndex == 1 ? AppColors.primary : AppColors.primary50,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Events',
            icon: Image.asset(
              currentIndex == 2
                  ? AppIcons.iconsConfettiMinimalistic
                  : AppIcons.iconsConfettiMinimalisticOutline,
              height: 24.h,
              width: 24.w,
              color:
                  currentIndex == 2 ? AppColors.primary : AppColors.primary50,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Image.asset(
              currentIndex == 3
                  ? AppIcons.iconsUser
                  : AppIcons.iconsUserRoundedOutline,
              height: 24.h,
              width: 24.w,
              color:
                  currentIndex == 3 ? AppColors.primary : AppColors.primary50,
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
