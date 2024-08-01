part of 'events_imports.dart';

class EventsViewModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final VelocityBloc<List<EventsModel>> eventsBloc =
      VelocityBloc<List<EventsModel>>([]);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController _searchController = TextEditingController();

  final List<String> choices = [
    'Tech',
    'Arts',
    'Sports',
    'Singing',
    'Dancing',
    'Finance',
    'Entrepreneur',
    'Poetry',
    'Graphic',
    'Marketing',
    'Speaking',
    'Soft Skills',
    'Music',
    'Movies',
    'Books',
    'Travel',
    'Food',
    'Fitness',
    'Gaming',
  ];

  final VelocityBloc<List<String>> selectedChoicesBloc =
      VelocityBloc<List<String>>([]);

  void getEvents({String? query, List<String>? categories}) async {
    List<String> interests = await getUserInterests(_auth.currentUser!.uid);

    Query<Map<String, dynamic>> eventsQuery = _firestore.collection('events');

    if (query != null && query.isNotEmpty) {
      eventsQuery = eventsQuery
          .where('eventsName', isGreaterThanOrEqualTo: query)
          .where('eventsName', isLessThanOrEqualTo: '$query\uf8ff');
    }

    // List to hold all futures
    List<Future<QuerySnapshot<Map<String, dynamic>>>> futures = [];

    // Add futures for category queries
    if (categories != null && categories.isNotEmpty) {
      for (var category in categories) {
        var categoryQuery =
            eventsQuery.where('eventsCategory', arrayContains: category);
        futures.add(categoryQuery.get());
      }
    }

    // Add futures for interest queries
    for (var interest in interests) {
      var interestQuery =
          eventsQuery.where('eventsCategory', arrayContains: interest);
      futures.add(interestQuery.get());
    }

    // Await all futures
    List<QuerySnapshot<Map<String, dynamic>>> snapshotsList =
        await Future.wait(futures);

    // Merge results from different queries
    var eventsSet = <String>{}; // Using a set to avoid duplicates
    var events = <EventsModel>[];

    for (var snapshots in snapshotsList) {
      for (var doc in snapshots.docs) {
        if (!eventsSet.contains(doc.id)) {
          eventsSet.add(doc.id);
          events.add(EventsModel.fromFirestore(doc.data(), doc.id));
        }
      }
    }

    eventsBloc.onUpdateData(events);
  }

  Future<List<String>> getUserInterests(String uid) async {
    DocumentSnapshot userDoc =
        await _firestore.collection('users').doc(uid).get();
    List<String> interests = List.from(userDoc['interests']);
    return interests;
  }

  void getTodayEvents() async {
    DateTime now = DateTime.now();
    DateTime startOfDay = DateTime(now.year, now.month, now.day);
    DateTime endOfDay = startOfDay.add(const Duration(days: 1));

    var snapshots = await _firestore
        .collection('events')
        .where('eventsDate',
            isGreaterThanOrEqualTo: Timestamp.fromDate(startOfDay))
        .where('eventsDate', isLessThan: Timestamp.fromDate(endOfDay))
        .get();

    eventsBloc.onUpdateData(snapshots.docs
        .map((doc) => EventsModel.fromFirestore(doc.data(), doc.id))
        .toList());
  }
}
