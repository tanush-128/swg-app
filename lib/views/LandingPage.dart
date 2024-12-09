import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:swg_flutter/constants.dart';
import 'package:swg_flutter/models/Department.dart';
import 'package:swg_flutter/models/Event.dart';
import 'package:swg_flutter/models/Society.dart';
import 'package:swg_flutter/views/SocietiesPage.dart';
import 'package:swg_flutter/views/subviews/KnowYourDepartment.dart';
import 'package:swg_flutter/widgets/StudyMaterial/year_wise_tab.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPage extends StatelessWidget {
  final Function toPage;
  const LandingPage({super.key, required this.toPage});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Image.asset(
              'assets/images/swg.jpg',
              height: 200,
            ),
            Container(
              decoration: BoxDecoration(
                  color: GlobalStyles.kPrimaryBlueColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/noticeboard");
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: GlobalStyles.blueShadowCardDeco,
                        width: double.infinity,
                        child: const Column(
                          children: [
                            Text("Open Notice Board",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 16.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Upcoming events",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                onTap: () {
                                  // toPage(1);
                                  Navigator.pushNamed(context, "/noticeboard");
                                },
                                child: const Text("See all >",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500)),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),
                        FutureBuilder(
                          future: BriefEvent.getAll(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
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
                            return CarouselSlider(
                              options: CarouselOptions(
                                height: 150.0,
                                enlargeFactor: 1.2,
                                autoPlay: true,
                                viewportFraction: 1,
                              ),
                              items: events.map((i) {
                                return EventBanner(event: i);
                              }).toList(),
                            );
                          },
                        ),
                        const SizedBox(height: 12),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Study Material",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      toPage(1);
                                    },
                                    child: const Text("See all >",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500)),
                                  )
                                ],
                              ),
                            ),
                            // const SizedBox(height: 4),
                            SizedBox(
                                height: 120,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.all(8.0),
                                  children: [
                                    YearWiseTile(
                                      year: "First",
                                      desc:
                                          "Study Material for phy and chem sem",
                                      onClick: () {
                                        Navigator.pushNamed(
                                            context, "/first-year-sm");
                                      },
                                    ),
                                    YearWiseTile(
                                      year: "Second",
                                      desc:
                                          "Study Material for all departments",
                                      onClick: () {
                                        Navigator.pushNamed(
                                            context, "/second-year-sm");
                                      },
                                    ),
                                    YearWiseTile(
                                      year: "Third",
                                      desc:
                                          "Study Material for phy and chem sem",
                                      onClick: () {
                                        Navigator.pushNamed(
                                            context, "/third-year-sm");
                                      },
                                    ),
                                    YearWiseTile(
                                      year: "Fourth",
                                      desc:
                                          "Study Material for all departments",
                                      onClick: () {
                                        Navigator.pushNamed(
                                            context, "/fourth-year-sm");
                                      },
                                    )
                                  ],
                                ))
                          ],
                        ),
                        _buildDepartments(context),
                        _buildSWGInitiatives(),
                        const SizedBox(height: 8),
                        _buildKnowYourMentor(context),
                        _buildSocities(context),
                        _buildFundaeDocs(),
                        _buildBenifitsOfInstiId(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKnowYourMentor(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: InkWell(
          onTap: () => Navigator.pushNamed(context, "/mentor-mentee"),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: GlobalStyles.blueShadowCardDeco,
            width: double.infinity,
            child: Row(
              children: [
                Image.asset(
                  'assets/images/mentor-mentee.png',
                  height: 36,
                ),
                const SizedBox(width: 8),
                const Text("Know Your Mentor",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios),
              ],
            ),
          )),
    );
  }

  Container _buildDepartments(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: GlobalStyles.blueShadowCardDeco,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Know your department",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    childAspectRatio: 1.25,
                    children: <Widget>[
                      ...GlobalConstants.departments
                          .getRange(0, 5)
                          .map((department) =>
                              DepartmentCard(department: department))
                          .toList(),
                      ViewMore(
                        onClick: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const KnowYourDepartment();
                          }));
                        },
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildSocities(BuildContext context) {
    Future<String> fetchImage(String image_name) async {
      try {
        final ref =
            FirebaseStorage.instance.ref().child("soc-logos/$image_name");
        String url = await ref.getDownloadURL();
        print(url);
        return url;
      } catch (e) {
        print('Error fetching image: $e');
        return '';
      }
    }

    return Container(
      margin: const EdgeInsets.all(16),
      decoration: GlobalStyles.blueShadowCardDeco,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Socities",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    children: <Widget>[
                      // ...GlobalConstants.derpartments
                      //     .getRange(0, 5)
                      //     .map((department) =>
                      //         DepartmentCard(department: department))
                      //     .toList(),
                      ...socsJson
                          .getRange(0, 5)
                          .map((society) => Society.fromJson(society))
                          .map(
                            (e) => Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  child: FutureBuilder(
                                    future: fetchImage(e.image_name),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        if (snapshot.hasError) {
                                          return const Icon(Icons.error);
                                        }
                                        if (snapshot.hasData) {
                                          if (snapshot.data == '') {
                                            return const Icon(Icons.error);
                                          }
                                          return Image.network(
                                            snapshot.data!,
                                            height: 40,
                                            width: 40,
                                          );
                                        }
                                      }
                                      return const CircularProgressIndicator();
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  e.name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            ),
                          ),
                      ViewMore(
                        onClick: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const SocietiesPage();
                          }));
                        },
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildFundaeDocs() {
    final fundaeDocs = [
      {
        "image": 'assets/images/fundae-docs/book.png',
        "title": "Subject-wise fundae",
        "url":
            "https://drive.google.com/file/d/1dtkaV3P4wKk_5WWChMyHgMd0XPeiF3v1/view?usp=drivesdk"
      },
      {
        "image": 'assets/images/fundae-docs/puzzle 1.png',
        "title": "General fundae",
        "url":
            "https://drive.google.com/file/d/1PXfo1QsrKUNlbnc4ZN8xiuEwt6fScF9q/view?usp=drivesdk"
      },
      {
        "image": 'assets/images/fundae-docs/test 1.png',
        "title": "Examania",
        "url":
            "https://drive.google.com/file/d/13pB45by4XcxgSB6ADAZwDNKf2KP2yMCW/view?usp=drivesdk"
      },
      {
        "image": 'assets/images/fundae-docs/student 1.png',
        "title": "CDC Resources",
        "url":
            "https://drive.google.com/file/d/1SlOowUrdyLSR7hghkZbIafkWgQGnjX4y/view?usp=drivesdk"
      },
    ];
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: GlobalStyles.blueShadowCardDeco,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Fundae Docs",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  // crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: <Widget>[
                    for (var doc in fundaeDocs)
                      GestureDetector(
                        onTap: () {
                          launchUrl(Uri.parse(doc["url"]!));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              doc["image"]!,
                              height: 40,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              doc["title"]!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSWGInitiatives() {
    final initiatives = [
      "AKGP.png",
      "APP.png",
      "CT.png",
      "EXAM.png",
      "OCT.png",
      "RGW.png",
      "UPSCT.png",
      "AOST.png",
      "COS.png",
      "DEPCT.png",
      "FORESIGHT.png",
      "PDS.png",
      "SMP.png"
    ];

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "SWG Initiatives & Events",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: 200.0,
            enlargeFactor: 1.2,
            autoPlay: true,
            viewportFraction: 1,
          ),
          items: initiatives.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: GlobalStyles.blueShadowCardDeco,
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      fit: BoxFit.contain,
                      'assets/images/swg-events/$i',
                      height: 150,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildBenifitsOfInstiId() {
    final benifits = [
      {
        "image": 'AWS.png',
        "title": "AWS",
        "url":
            "https://medium.com/@swgiitkgp/amazon-web-services-through-institute-id-1a30fca0d1d8"
      },
      {
        "image": 'grammarly.png',
        "title": "Grammarly Premium",
        "url":
            "https://medium.com/@swgiitkgp/grammarly-premium-through-institute-id-74edb75f23fb"
      },
      {
        "image": 'Mathworks.png',
        "title": "Mathworks",
        "url":
            "https://medium.com/@swgiitkgp/mathworks-products-through-institute-id-151b9cc42c28"
      },
      {
        "image": 'IntelliJ idea.png',
        "title": "IntelliJ IDE",
        "url":
            "https://medium.com/@swgiitkgp/intellij-ides-through-institute-id-d56acf3513d8"
      },
      {
        "image": 'Autodesk.png',
        "title": "AutoDesk",
        "url":
            "https://medium.com/@swgiitkgp/autodesk-products-through-institute-id-27bd9226ccb4"
      },
      {
        "image": 'github.png',
        "title": "Github",
        "url":
            "https://medium.com/@swgiitkgp/github-student-developer-pack-and-pro-account-through-institute-id-a0fb56613410"
      },
      {
        "image": 'turnitin.png',
        "title": "TURNITIN",
        "url":
            "https://medium.com/@swgiitkgp/turnitin-license-through-institute-id-f40c9231c325"
      },
    ];

    return Container(
      margin: const EdgeInsets.all(16),
      decoration: GlobalStyles.blueShadowCardDeco,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Benifits of Institute ID",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  childAspectRatio: 1,
                  // crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: <Widget>[
                    for (var doc in benifits)
                      GestureDetector(
                        onTap: () {
                          launchUrl(Uri.parse(doc["url"]!));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/insti-id-benifits/${doc["image"]!}",
                              height: 36,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              doc["title"]!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EventBanner extends StatelessWidget {
  final BriefEvent event;

  const EventBanner({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage('assets/images/cos1.png'),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                opacity: 0.8,
                colorFilter: ColorFilter.mode(
                    Color.fromARGB(137, 37, 37, 37), BlendMode.colorBurn),
              )),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(event.heading,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(241, 191, 87, 1))),
                      const Text("Student Welfare Group",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                      Text(
                          "${event.dateTime.day}/${event.dateTime.month}/${event.dateTime.year} ${event.dateTime.hour}:${event.dateTime.minute.toString().padLeft(2, '0')}",
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                      Text("Location: ${event.location}",
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                      // Text("Target Audience:",
                      //     style: TextStyle(
                      //         fontSize: 13,
                      //         fontWeight: FontWeight.w500,
                      //         color: Colors.white)),
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 4,
                  right: 8,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/noticeboard',
                          arguments: <String, int>{'initialIndex': 1});
                    },
                    child: const Text("Know More >",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            decoration: TextDecoration.underline)),
                  ))
            ],
          ),
        ));
  }
}

class ViewMore extends StatelessWidget {
  const ViewMore({
    super.key,
    required this.onClick,
  });

  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(100),
            ),
            padding: const EdgeInsets.all(8),
            child: const Center(
              child: Icon(Icons.arrow_forward_sharp,
                  size: 20,
                  fill: 0,
                  weight: 0.2,
                  grade: 0.5,
                  color: Colors.black),
            ),
          ),
          const Text(
            "View More",
            style: TextStyle(fontSize: 14),
          )
        ],
      ),
    );
  }
}

class DepartmentCard extends StatelessWidget {
  final Department department;

  const DepartmentCard({super.key, required this.department});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final Uri uri = Uri.parse(department.mediumArticleLink ?? '');
        launchUrl(uri);
      },
      // decoration: const BoxDecoration(color: Colors.amber),
      child: Column(
        children: [
          Image.asset(
            department.image,
            height: 40,
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            department.code,
            style: const TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
