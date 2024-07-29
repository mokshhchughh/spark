part of 'events_imports.dart';

class EventsViewModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final VelocityBloc<List<EventsModel>> eventsBloc =
      VelocityBloc<List<EventsModel>>([]);

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
    Query<Map<String, dynamic>> eventsQuery = _firestore.collection('events');

    if (query != null && query.isNotEmpty) {
      eventsQuery = eventsQuery
          .where('eventsName', isGreaterThanOrEqualTo: query)
          .where('eventsName', isLessThanOrEqualTo: '$query\uf8ff');
    }

    if (categories != null && categories.isNotEmpty) {
      eventsQuery =
          eventsQuery.where('eventsCategory', arrayContainsAny: categories);
    }

    var snapshots = await eventsQuery.get();
    var events = snapshots.docs
        .map((doc) => EventsModel.fromFirestore(doc.data(), doc.id))
        .toList();
    eventsBloc.onUpdateData(events);
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
