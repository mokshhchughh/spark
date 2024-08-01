part of 'events_imports.dart';

@RoutePage()
class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  final EventsViewModel _eventsViewModel = EventsViewModel();

  @override
  void initState() {
    _eventsViewModel.getEvents();
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
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.transparent,
          title: SearchTextField(
            hintText: 'Search',
            contentPadding: 8,
            controller: _eventsViewModel._searchController,
            onChanged: (value) {
              _eventsViewModel.getEvents(query: value);
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                VxBottomSheet.bottomSheetView(
                  context,
                  isSafeAreaFromBottom: true,
                  backgroundColor: AppColors.white,
                  child: FiltersSection(
                    eventsViewModel: _eventsViewModel,
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
        body: BlocBuilder<VelocityBloc<List<EventsModel>>,
            VelocityState<List<EventsModel>>>(
          bloc: _eventsViewModel.eventsBloc,
          builder: (context, state) {
            if (state is VelocityInitialState) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state is VelocityFailedState) {
              return const Center(
                child: Text('Failed'),
              );
            } else if (state is VelocityUpdateState) {
              return RefreshIndicator(
                onRefresh: () async {
                  _eventsViewModel.getEvents();
                },
                child: ListView.separated(
                  padding: AppPaddings.appPadding,
                  itemCount: state.data.length,
                  shrinkWrap: true,
                  separatorBuilder: (_, __) => AppSizes.verticalSpace,
                  itemBuilder: (context, index) {
                    var event = state.data[index];
                    return state.data.isNotEmpty
                        ? EventsCard(
                            eventsModel: event,
                          )
                        : const TitleMedium(title: 'No Events Found');
                  },
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
