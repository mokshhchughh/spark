part of 'home_imports.dart';

@RoutePage()
class HomeDetails extends StatefulWidget {
  const HomeDetails({super.key});

  @override
  State<HomeDetails> createState() => _HomeDetailsState();
}

class _HomeDetailsState extends State<HomeDetails> {
  int page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const TitleMedium(
          title: 'Events',
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
