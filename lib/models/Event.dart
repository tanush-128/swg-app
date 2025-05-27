import 'package:cloud_firestore/cloud_firestore.dart';

class BriefEvent {
  final String heading;
  final DateTime dateTime;
  final String location;
  

  BriefEvent(
      {required this.heading, required this.dateTime, required this.location});

  static Future<List<BriefEvent>> getAll() async {
    try {
      // get only where published is true
      final querySnapshot =
          // await FirebaseFirestore.instance.collection('notices').get();
          await FirebaseFirestore.instance.collection('events').get();

      return querySnapshot.docs.map((doc) {
        Timestamp timestamp = doc['date_time'];
        return BriefEvent(
          heading: doc['event_name'],
          location: doc['location'],
          dateTime: timestamp.toDate(),
        );
      }).toList();
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
