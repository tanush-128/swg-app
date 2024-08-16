import 'package:flutter/material.dart';
import 'package:swg_flutter/constants.dart';
import 'package:swg_flutter/views/subviews/YearWiseStudyMaterial/second_year_sm.dart';
import 'package:swg_flutter/widgets/StudyMaterial/year_wise_tab.dart';

class StudyMaterial extends StatelessWidget {
  const StudyMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  year: "UG",
                  desc: "Study Material for UG Students",
                  onClick: () {
                    Navigator.pushNamed(context, "/studymaterialug");
                  },
                ),
                YearWiseTile(
                  year: "PG",
                  desc: "Study Material for PG Students",
                  onClick: () {
                    Navigator.pushNamed(context, "/studymaterialpg");
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
