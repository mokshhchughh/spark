import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class EventsModel {
  final String id;
  final String name;
  final String description;
  final String host;
  final String eventsImage;
  final List<String> eventsCategory;
  final DateTime date;
  final String locationName;
  final double latitude;
  final double longitude;

  EventsModel({
    required this.id,
    required this.name,
    required this.description,
    required this.host,
    required this.date,
    required this.eventsImage,
    required this.eventsCategory,
    required this.locationName,
    required this.latitude,
    required this.longitude,
  });

  factory EventsModel.fromFirestore(
      Map<String, dynamic> data, String documentId) {
    return EventsModel(
      id: documentId,
      name: data['eventsName'],
      description: data['eventsDescription'],
      host: data['eventsHost'],
      eventsImage: data['eventsImage'],
      eventsCategory: List<String>.from(data['eventsCategory']),
      date: (data['eventsDate'] as Timestamp).toDate(),
      locationName: data['location']['name'],
      latitude: double.parse(data['location']['latitude']),
      longitude: double.parse(data['location']['longitude']),
    );
  }

  String get formattedDate {
    return DateFormat('dd').format(date);
  }

  String get formattedTime {
    return DateFormat('hh:mm a').format(date);
  }

  String get formattedMonth {
    return DateFormat('MMMM').format(date);
  }
}
