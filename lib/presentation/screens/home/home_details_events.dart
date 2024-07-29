part of 'home_imports.dart';

@RoutePage()
class HomeDetailsEvents extends StatefulWidget {
  const HomeDetailsEvents({super.key});

  @override
  State<HomeDetailsEvents> createState() => _HomeDetailsEventsState();
}

class _HomeDetailsEventsState extends State<HomeDetailsEvents> {
  final EventsViewModel _eventsViewModel = EventsViewModel();

  @override
  void initState() {
    _eventsViewModel.getTodayEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DetailsAppBar(
        title: 'Events',
      ),
      body: SafeArea(
        child: BlocBuilder<VelocityBloc<List<EventsModel>>,
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
              return state.data.isNotEmpty
                  ? ListView.separated(
                      padding: AppPaddings.appPadding,
                      itemCount: state.data.length,
                      shrinkWrap: true,
                      separatorBuilder: (_, __) => AppSizes.verticalSpace,
                      itemBuilder: (context, index) {
                        var event = state.data[index];
                        return EventsCard(
                          eventsModel: event,
                        );
                      },
                    )
                  : const Center(
                      child: TitleMedium(title: 'No Events'),
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
