import 'package:flutter/material.dart';
import 'package:swg_flutter/constants.dart';
import 'package:swg_flutter/data/dummy_foresight_data.dart';
import 'package:swg_flutter/models/CDCDomain.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogsListView extends StatelessWidget {
  final CDCDomain domain;
  const BlogsListView({super.key, required this.domain});

  @override
  Widget build(BuildContext context) {
    final List blogsList =
        foresightDummyData['internship']![domain.name]!['2018'] as List;
    return Scaffold(
      appBar: AppBar(
        actionsIconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          domain.name,
          style: const TextStyle(color: Colors.black),
        ),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
          itemCount: blogsList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                final Uri uri = Uri.parse(blogsList[index]['Url']);
                launchUrl(uri);
              },
              child: Container(
                decoration: GlobalStyles.blueShadowCardDeco,
                margin:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                padding:
                    const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      blogsList[index]['Company'],
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'By: ${blogsList[index]['Name']}',
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      blogsList[index]['desc'],
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
