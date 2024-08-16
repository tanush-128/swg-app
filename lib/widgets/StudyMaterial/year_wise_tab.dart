import 'package:flutter/material.dart';

class YearWiseTile extends StatelessWidget {
  final String year;
  final String desc;
  final Function()? onClick;

  const YearWiseTile(
      {super.key, required this.year, required this.desc, this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.all(8.0),
        height: 100,
        width: (MediaQuery.of(context).size.width - 40) / 2,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 3.0,
                  offset: const Offset(4, 4)),
            ],
            color: Colors.black,
            image: const DecorationImage(
                opacity: 0.4,
                image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpUJ870f29d47y-h4QQn0trUgkpmS5LQcxE8Q_U91HUA&s"),
                fit: BoxFit.cover)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            year == "UG" || year == "PG" ? year : "$year Year",
            style: const TextStyle(fontSize: 18, color: Colors.amber),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            desc,
            style: const TextStyle(color: Colors.white, fontSize: 10),
            textAlign: TextAlign.center,
          ),
        ]),
      ),
    );
  }
}
