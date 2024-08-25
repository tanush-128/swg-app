import 'package:flutter/material.dart';
import 'package:swg_flutter/views/CDC/CDCPage.dart';
import 'package:swg_flutter/views/LandingPage.dart';
import 'package:swg_flutter/views/ProfileView.dart';
import 'package:swg_flutter/views/StudyMaterial.dart';
import 'package:swg_flutter/views/StudyMaterialUG.dart';
import 'package:swg_flutter/widgets/SideBarView.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  setIndex(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: 0);
    List<Widget> views = [
      LandingPage(toPage: (index) {
        setIndex(index);
        controller.animateToPage(index,
            duration: const Duration(milliseconds: 500),
            curve: Curves.decelerate);
      }),
      const StudyMaterial(),
      CDCPage(setIndex: setIndex),

      // const CommunityPage(
      //   key: GlobalObjectKey(""),
      // ),
      const ProfileView(),
    ];

    List<String> titles = [
      "Student Welfare Group",
      "Study Material",
      "CDC",
      // "Community",
      "Profile",
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        actionsIconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          titles[_selectedIndex],
          style: const TextStyle(color: Colors.black),
        ),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      body: PageView(
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: views,
      ),
      drawer: SideBarView(
        changeIndex: (int index) {
          setIndex(index);
          controller.jumpToPage(index);
        },
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    controller.jumpToPage(0);
                    _selectedIndex = 0;
                  });
                },
                child: ImageIcon(
                  const AssetImage(
                    "assets/images/logo_black.png",
                  ),
                  size: 35.0,
                  color: _selectedIndex == 0 ? Colors.blue : Colors.black,
                ),
              ),
              //book

              GestureDetector(
                onTap: () {
                  setState(() {
                    controller.jumpToPage(1);
                    _selectedIndex = 1;
                  });
                },
                child: ImageIcon(
                  const AssetImage('assets/images/book.png'),
                  size: 30.0,
                  color: _selectedIndex == 1 ? Colors.blue : Colors.black,
                ),
              ),

              //grad
              GestureDetector(
                child: ImageIcon(
                  const AssetImage('assets/images/grad.png'),
                  size: 30.0,
                  color: _selectedIndex == 2 ? Colors.blue : Colors.black,
                ),
                onTap: () {
                  setState(() {
                    controller.jumpToPage(2);

                    _selectedIndex = 2;
                  });
                },
              ),



              //profile
              GestureDetector(
                onTap: () {
                  setState(() {
                    controller.jumpToPage(3);

                    _selectedIndex = 3;
                  });
                },
                child: ImageIcon(
                  const AssetImage('assets/images/profile.png'),
                  size: 30.0,
                  color: _selectedIndex == 3 ? Colors.blue : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: Container(
      //   decoration: BoxDecoration(boxShadow: [
      //     BoxShadow(
      //       color: _selectedIndex == 2
      //           ? Colors.blue.withOpacity(0.1)
      //           : Colors.grey.withOpacity(0.1),
      //       spreadRadius: 2,
      //       blurRadius: 5,
      //       offset: const Offset(0, 3),
      //     )
      //   ]),
      //   height: 60,
      //   width: 60,
      //   child: FittedBox(
      //     child: FloatingActionButton(
      //       backgroundColor: Colors.white,
      //       child: const CircleAvatar(
      //         backgroundImage: AssetImage("assets/images/3.png"),
      //         backgroundColor: Colors.white,
      //       ),
      //       onPressed: () {
      //         setState(() {
      //           controller.jumpToPage(2);
      //           _selectedIndex = 2;
      //         });
      //       },
      //     ),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
