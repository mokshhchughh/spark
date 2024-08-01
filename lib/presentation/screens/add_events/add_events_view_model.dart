part of 'add_events_imports.dart';

class AddEventsViewModel {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController hostController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final VelocityBloc<List<String>> selectedChoicesBloc =
      VelocityBloc<List<String>>([]);

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  final VelocityBloc<bool> isLoadingBloc = VelocityBloc<bool>(false);
  final _uuid = const Uuid().v4();

  void clearFields() {
    titleController.clear();
    hostController.clear();
    dateController.clear();
    locationController.clear();
    descriptionController.clear();
    selectedChoicesBloc.onUpdateData([]);
  }

  void addNewEvent(context) async {
    isLoadingBloc.onUpdateData(true);
    await _db.collection('events').doc(_uuid).set({
      'id': _uuid,
      'eventsName': titleController.text,
      'eventsHost': hostController.text,
      'eventsDate': dateController.text,
      'location': {'name': locationController.text},
      'eventsDescription': descriptionController.text,
      'eventsCategory': selectedChoicesBloc.state.data,
    });
    VxToast.show(context, msg: 'Events Added Successfully');
    clearFields();
    isLoadingBloc.onUpdateData(false);
  }
}
