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
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
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
              AppSizes.verticalSpace,
              Expanded(
                child: ListView.separated(
                  itemCount: 3,
                  shrinkWrap: true,
                  separatorBuilder: (_, __) => AppSizes.verticalSpace,
                  itemBuilder: (context, index) {
                    return const EventsCard();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
