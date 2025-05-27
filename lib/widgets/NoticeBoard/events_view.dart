import 'package:flutter/material.dart';
import 'package:swg_flutter/models/Notice.dart';
import 'package:intl/intl.dart';

class EventsView extends StatelessWidget {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Notice.getAll(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return const Center(
            child: Text('An error occurred'),
          );
        }
        final notices = snapshot.data as List<Notice>;
        // Sort notices by event time (most recent first)
        notices.sort((a, b) => b.eventTime.compareTo(a.eventTime));

        return ListView.builder(
          itemCount: notices.length,
          itemBuilder: (context, index) {
            return EventTile(notice: notices[index]);
          },
        );
      },
    );
  }
}

class EventTile extends StatelessWidget {
  const EventTile({super.key, required this.notice});
  final Notice notice;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            notice.heading,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          Text(
            'By ${notice.host}',
            style: const TextStyle(fontSize: 12),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      DateFormat.MMMd().format(notice.eventTime),
                      style: const TextStyle(fontSize: 12),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(DateFormat.jm().format(notice.eventTime),
                        style: const TextStyle(fontSize: 12))
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.pin_drop,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(notice.location, style: const TextStyle(fontSize: 12))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
