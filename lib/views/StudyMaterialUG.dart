import 'package:flutter/material.dart';
import 'package:swg_flutter/constants.dart';
import 'package:swg_flutter/widgets/StudyMaterial/year_wise_tab.dart';

class StudyMaterialUG extends StatelessWidget {
  const StudyMaterialUG({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsIconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.black,
              size: 36,
            ),
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).pop();
            }),
        centerTitle: true,
        title: const Text(
          "UG Study Material",
          style: TextStyle(color: Colors.black),
        ),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      body: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: GlobalStyles.kPrimaryBlueColor,
        child: Column(
          children: [
            const Padding(
                padding: EdgeInsets.all(16.0),
                child: Image(
                  image: AssetImage("assets/images/books.png"),
                  height: 100,
                )),
            const Text(
              "Study Material",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "All the material you need a night before exam compiled in one place.",
                style: TextStyle(
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: List.generate(
                      150 ~/ 1,
                      (index) => Expanded(
                            child: Container(
                              color: index % 2 == 0
                                  ? Colors.transparent
                                  : Colors.black,
                              height: 2,
                            ),
                          )),
                )),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.5,
                ),
                children: [
                  YearWiseTile(
                    year: "First",
                    desc: "Study Material for Phy and Chem",
                    onClick: () {
                      Navigator.pushNamed(context, "/first-year-sm");
                    },
                  ),
                  YearWiseTile(
                    year: "Second",
                    desc: "Study Material for all departments",
                    onClick: () {
                      Navigator.pushNamed(context, "/second-year-sm");
                    },
                  ),
                  YearWiseTile(
                    year: "Third",
                    desc: "Study Material for all departments",
                    onClick: () {
                      Navigator.pushNamed(context, "/third-year-sm");
                    },
                  ),
                  YearWiseTile(
                    year: "Fourth",
                    desc: "Study Material for all departments",
                    onClick: () {
                      Navigator.pushNamed(context, "/fourth-year-sm");
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
