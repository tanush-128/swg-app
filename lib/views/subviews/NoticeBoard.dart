import 'package:flutter/material.dart';
import 'package:swg_flutter/constants.dart';
import 'package:swg_flutter/views/subviews/Notice/add_notice_page.dart';
import 'package:swg_flutter/widgets/NoticeBoard/events_view.dart';
import 'package:swg_flutter/widgets/NoticeBoard/notices.dart';

class NoticeBoard extends StatefulWidget {
  const NoticeBoard({super.key});

  @override
  State<NoticeBoard> createState() => _NoticeBoardState();
}

class _NoticeBoardState extends State<NoticeBoard> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AddNoticePage();
              }));
            },
            backgroundColor: GlobalStyles.kPrimaryBlueColor,
            child: const Icon(Icons.add),
          ),
          backgroundColor: GlobalStyles.kPrimaryBlueColor,
          appBar: AppBar(
            title: const Text(
              'Welcome to Notice Board',
              style: TextStyle(color: Colors.black),
            ),
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: 'Notices',
                ),
                Tab(
                  text: 'Events',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [NoticesView(), EventsView()], // add this later
          ),
        ));
  }
}
