part of 'home_imports.dart';

@RoutePage()
class HomeDetailsEvents extends StatelessWidget {
  const HomeDetailsEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DetailsAppBar(
        title: 'Events',
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: 4,
          separatorBuilder: (context, index) => AppSizes.verticalSpace,
          itemBuilder: (context, index) {
            return const EventsCard();
          },
        ),
      ),
    );
  }
}
