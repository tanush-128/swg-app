import 'package:flutter/material.dart';
import 'package:swg_flutter/constants.dart';

class SideBarView extends StatelessWidget {
  final Function(int) changeIndex;
  const SideBarView({super.key, required this.changeIndex});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 4),
      decoration: BoxDecoration(
        color: GlobalStyles.kPrimaryBlueColor.withOpacity(0.9),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.05),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32.0, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Positioned(
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
                        // Positioned(
                        //   left: 75,
                        //   bottom: 10,
                        //   child: Container(
                        //       decoration: BoxDecoration(
                        //         color: Colors.white,
                        //         border: Border.all(
                        //           color: Colors.black,
                        //           width: 2,
                        //         ),
                        //         borderRadius: BorderRadius.circular(100),
                        //       ),
                        //       child: const Padding(
                        //         padding: EdgeInsets.all(2.0),
                        //         child: Icon(Icons.edit, size: 16),
                        //       )),
                        // )
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      " KGPIAN",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                        changeIndex(3);
                      },
                      child: const Text(
                        " View Profile",
                        style: TextStyle(
                          color: Color.fromARGB(255, 33, 149, 243),
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            const SizedBox(height: 6),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 10),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Options(
                      title: "Study Material",
                      route: '/studymaterial',
                      onClick: () {
                        Navigator.of(context).pop();
                        changeIndex(1);
                      },
                    ),
                    const Options(
                      title: "Know your departments",
                      route: '/knowyourdep',
                    ),
                    const Options(
                        title: "Societies of KGP", route: '/societies'),
                    Options(
                      title: "Featured Blogs",
                      route: '/cdcinternshipblogs',
                      onClick: () {
                        Navigator.of(context).pop();
                        changeIndex(2);
                      },
                    ),
                    const Options(title: "Our Team", route: '/ourteam'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Options extends StatelessWidget {
  final String title;
  final String route;
  final void Function()? onClick;
  const Options({
    required this.title,
    super.key,
    this.route = '/',
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick ??
          () {
            Navigator.of(context).pushNamed(route);
          },
      child: Container(
        width: 300,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              style: BorderStyle.solid,
              color: Colors.grey,
              width: 1,
            ),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
