part of 'add_trophies_imports.dart';

@RoutePage()
class AddTrophies extends StatefulWidget {
  const AddTrophies({super.key});

  @override
  State<AddTrophies> createState() => _AddTrophiesState();
}

class _AddTrophiesState extends State<AddTrophies> {
  final AddTrophiesViewModel addTrophiesViewModel = AddTrophiesViewModel();

  final TextEditingController _searchController = TextEditingController();
  List<DocumentSnapshot> _searchResults = [];

  Future<void> _searchUsers(String query) async {
    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
      });
      return;
    }

    final results = await FirebaseFirestore.instance
        .collection('users')
        .where('name', isGreaterThanOrEqualTo: query)
        .where('name', isLessThanOrEqualTo: '$query\uf8ff')
        .get();

    setState(() {
      _searchResults = results.docs;
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
        appBar: AppBar(
          backgroundColor: AppColors.transparent,
          title: SearchTextField(
            hintText: 'Search Users',
            contentPadding: 8,
            autoFocus: true,
            controller: _searchController,
            onFieldSubmitted: (value) {
              _searchUsers(_searchController.text);
            },
          ),
        ),
        body: ListView.builder(
          itemCount: _searchResults.length,
          itemBuilder: (context, index) {
            final user = _searchResults[index];
            return ListTile(
              leading: const CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage(AppIcons.iconsUser1),
              ),
              title: TitleMedium(title: user['name']),
              trailing: TextButton.icon(
                onPressed: () {
                  VxToast.show(context, msg: 'Trophy Added');
                  addTrophiesViewModel.incrementTrophies(user['uid']);
                },
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.primary.withOpacity(0.1),
                ),
                label: const TitleSmall(title: 'Add Trophy'),
                icon: const Icon(Icons.add),
              ),
            );
          },
        ),
      ),
    );
  }
}
