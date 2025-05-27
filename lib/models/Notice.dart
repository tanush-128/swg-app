import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final List<String> targetAudiences = [
  'All KGP Junta',
  'Freshers',
  'Sophomores',
  'Pre-Final Years',
  'Final Years'
];

class Notice {
  final String heading;
  final String description;
  final DateTime eventTime;
  final String location;
  final String host;
  final String? imageUrl;
  String targetAudience;
  bool published = false;
  String contactName;
  String contactNumber;

  Notice({
    required this.heading,
    required this.description,
    required this.eventTime,
    required this.location,
    required this.host,
    this.imageUrl,
    this.targetAudience = "All KGP Junta",
    this.published = false,
    required this.contactName,
    required this.contactNumber,
  });
  static Future<List<Notice>> getAll() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('notices')
          .where('published', isEqualTo: true)
          .get();
      return querySnapshot.docs.map((doc) {
        return Notice(
          heading: doc['heading'] ?? '',
          description: doc['description'] ?? '',
          eventTime: DateTime.parse(
              doc['eventTime'] ?? DateTime.now().toIso8601String()),
          location: doc['location'] ?? '',
          host: doc['host'] ?? '',
          imageUrl: doc['imageUrl'],
          targetAudience: doc['targetAudience'] ?? 'All KGP Junta',
          published: doc['published'] ?? false,
          contactName: 'N/A',
          contactNumber: 'N/A',
          // contactName: doc['contactName'] ?? 'N/A',
          // contactNumber: doc['contactNumber'] ?? 'N/A',
        );
      }).toList();
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  static Future<void> createNotice(Notice notice) async {
    try {
      final docRef = FirebaseFirestore.instance.collection('notices').doc();

      String? imageUrl;
      if (notice.imageUrl != null) {
        final imageRef =
            FirebaseStorage.instance.ref().child('notice_images/${docRef.id}');
        await imageRef.putFile(File(notice.imageUrl!));
        imageUrl = await imageRef.getDownloadURL();
      }

      await docRef.set({
        'heading': notice.heading,
        'description': notice.description,
        'eventTime': notice.eventTime.toIso8601String(),
        'location': notice.location,
        'host': notice.host,
        'imageUrl': imageUrl,
        'targetAudience': notice.targetAudience,
        'published': notice.published,
        'contactName': notice.contactName,
        'contactNumber': notice.contactNumber,
      });
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> updateNotice(String docId, Notice notice) async {
    try {
      final docRef =
          FirebaseFirestore.instance.collection('notices').doc(docId);

      Map<String, dynamic> updates = {
        'heading': notice.heading,
        'description': notice.description,
        'eventTime': notice.eventTime.toIso8601String(),
        'location': notice.location,
        'host': notice.host,
        'targetAudience': notice.targetAudience,
        'published': notice.published,
        'contactName': notice.contactName,
        'contactNumber': notice.contactNumber,
      };

      if (notice.imageUrl != null && !notice.imageUrl!.startsWith('http')) {
        final imageRef =
            FirebaseStorage.instance.ref().child('notice_images/$docId');
        await imageRef.putFile(File(notice.imageUrl!));
        updates['imageUrl'] = await imageRef.getDownloadURL();
      }

      await docRef.update(updates);
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> deleteNotice(String docId) async {
    try {
      final docRef =
          FirebaseFirestore.instance.collection('notices').doc(docId);
      final docSnapshot = await docRef.get();

      if (docSnapshot.data() != null &&
          docSnapshot.data()!['imageUrl'] != null) {
        final imageUrl = docSnapshot.data()!['imageUrl'];
        final imageRef = FirebaseStorage.instance.refFromURL(imageUrl);
        await imageRef.delete();
      }

      await docRef.delete();
    } catch (e) {
      print(e.toString());
    }
  }
}
