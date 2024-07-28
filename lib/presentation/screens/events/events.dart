part of 'events_imports.dart';

@RoutePage()
class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
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
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.transparent,
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
                  child: const FiltersSection(),
                );
              },
              icon: Image.asset(
                AppIcons.iconsTuning,
                scale: 2,
              ),
            ),
          ],
        ),
        body: ListView.separated(
          padding: AppPaddings.appPadding,
          itemCount: 3,
          shrinkWrap: true,
          separatorBuilder: (_, __) => AppSizes.verticalSpace,
          itemBuilder: (context, index) {
            return const EventsCard();
          },
        ),
      ),
    );
  }
}
