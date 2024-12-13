import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swg_flutter/widgets/column_tile.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        children: [
          Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                          image: AssetImage('assets/images/1.png'),
                          fit: BoxFit.cover)),
                  height: 150,
                ),
                Positioned(
                  top: 125,
                  child: Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage('assets/images/1.png'),
                          fit: BoxFit.cover),
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 5,
                        color: Colors.white,
                      ),
                      color: Colors.black,
                    ),
                  ),
                ),
              ]),
          const SizedBox(
            height: 45,
          ),
          const Text(
            "KGPIAN",
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          const Text("23AE1001"),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: const Column(children: [
              ColumnTile(heading: "Mentor", desc: "Satyaki Chakraborty"),
              // ColumnTile(
              // heading: "Department",
              // desc: "Department of Civil Engineering"),
              // ColumnTile(heading: "Facad", desc: "Prof. Bharab Maitra"),
              // ColumnTile(
              // heading: "Hall Warden", desc: "Prof. Sanjeeb Kumar Patra"),
              ColumnTile(heading: "B C Roy Ambulance", desc: "03222 281 008"),
              ColumnTile(heading: "Councelling Centre", desc: "03222 281 008")
            ]),
          )
        ],
      ),
      BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5.0,
          sigmaY: 5.0,
        ),
        child: Container(
          color: Colors.white.withAlpha(100),
          constraints: const BoxConstraints.expand(),
        ),
      ),
      const Center(
        child: Text(
          'Comming Soon...',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
      )
    ]);
  }
}
