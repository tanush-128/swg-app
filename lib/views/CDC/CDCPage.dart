import 'package:flutter/material.dart';
import 'package:swg_flutter/constants.dart';

class CDCPage extends StatelessWidget {
  CDCPage({super.key, required this.setIndex});
  Function(dynamic) setIndex;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: GlobalStyles.kPrimaryBlueColor,
      child: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 30.0),
        child: Column(
          children: [
            Image.asset(
              'assets/images/internship.png',
              scale: 5,
            ),
            const Text(
              "Career Development Centre",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '"Mistakes are the best lessons, while Experience is the best teacher" -- Read through the Experiences of seniors who bagged CDC',
                style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400),
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
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/cdcinternshipblogs');
              },
              child: Container(
                decoration: GlobalStyles.blueShadowCardDeco,
                margin: const EdgeInsets.all(12.0),
                child: const SizedBox(
                  height: 75,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'CDC Internship Blogs',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/cdcplacementblogs');
              },
              child: Container(
                decoration: GlobalStyles.blueShadowCardDeco,
                margin: const EdgeInsets.all(12.0),
                child: const SizedBox(
                  height: 75,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'CDC Placement Blogs',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
