import 'package:flutter/material.dart';
import 'package:swg_flutter/models/Event.dart';

class EventsView extends StatelessWidget {
  EventsView({super.key});

  final List<BriefEvent> events = [
    BriefEvent(
        heading: 'Induction Program',
        dateTime: DateTime(2024, 7, 28, 12, 0, 0),
        location: 'Netaji Auditorium')
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: BriefEvent.getAll(),
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
        final events = snapshot.data as List<BriefEvent>;
        return ListView.builder(
          itemCount: events.length,
          itemBuilder: (context, index) {
            return EventTile(
              event: events[index],
            );
          },
        );
      },
    );
  }
}

class EventTile extends StatelessWidget {
  const EventTile({super.key, required this.event});
  final BriefEvent event;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            event.heading,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
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
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      '${event.dateTime.day}/${event.dateTime.month}/${event.dateTime.year}',
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
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                        '${event.dateTime.hour}:${event.dateTime.minute.toString().padRight(2, '0')}',
                        style: const TextStyle(fontSize: 12))
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.pin_drop,
                      size: 16,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(event.location, style: const TextStyle(fontSize: 12))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
    ;
  }
}
