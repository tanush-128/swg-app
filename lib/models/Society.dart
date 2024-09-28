import 'package:cloud_firestore/cloud_firestore.dart';

class Society {
  String name;
  String insta_url;
  String facebook_url;
  String linkedin_url;
  String image_name;
  // ImageProvider? icon;

  // String? intro;

  Society({
    required this.name,
    required this.insta_url,
    required this.facebook_url,
    required this.linkedin_url,
    required this.image_name,
  });

  static Society fromJson(Map<String, dynamic> json) {
    return Society(
      name: json['name'],
      insta_url: json['insta_url'],
      facebook_url: json['facebook_url'],
      linkedin_url: json['linkedin_url'],
      image_name: json['image_name'] ?? "",
    );
  }

  static Future<List<Society>> getSocities() async {
    final firestore = FirebaseFirestore.instance;
    // final snapshot = await firestore.collection('socities').get();
    // print("There are total of ${snapshot.docs.length} societies");
    // print(snapshot.docs[0].data());

    // final orgs =
    //     snapshot.docs.map((doc) => Society.fromJson(doc.data())).toList();
    // log(orgs.length.toString());

    List<Society> orgs = [];
    // for (var doc in snapshot.docs) {
    //   try {
    //     orgs.add(Society.fromJson(doc.data()));
    //   } catch (e) {
    //     print(e);
    //   }
    // }
    for (var doc in socsJson) {
      try {
        orgs.add(Society.fromJson(doc));
      } catch (e) {
        print(e);
      }
    }
    // print(orgs.length);
    return orgs;
  }
}

final socsJson = [
  {
    "name": "Student Welfare Group",
    "image_name": "swg.png",
    "insta_url":
        "https://www.instagram.com/swg.iit_kgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/SWGIITKGP",
    "linkedin_url":
        "https://www.linkedin.com/company/student-welfare-group-iit-kharagpur/"
  },
  {
    "name": "Institute Wellness Group",
    "image_name": "iwg.png",
    "insta_url":
        "https://www.instagram.com/iwg_iitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/iwg.iitkgp",
    "linkedin_url":
        "https://www.linkedin.com/company/institute-wellness-group-iit-kharagpur/"
  },
  {
    "name": "Ambar",
    "image_name": "ambar.jpeg",
    "insta_url":
        "https://www.instagram.com/ambar_iitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "(20+) Ambar - IIT Kharagpur | Facebook",
    "linkedin_url": "Ambar IIT Kharagpur: Overview | LinkedIn"
  },
  {
    "name": "Awaaz",
    "image_name": "awaaz2.ico",
    "insta_url":
        "https://www.instagram.com/awaaziitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/awaaziitkgp",
    "linkedin_url": "Awaaz, IIT Kharagpur: Overview | LinkedIn"
  },
  {
    "name": "Aroma",
    "image_name": "aroma.jpeg",
    "insta_url":
        "https://www.instagram.com/aroma.iitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/aroma.iitkgp",
    "linkedin_url":
        "https://www.linkedin.com/company/technology-culinary-arts-society/"
  },
  {
    "name": "Kharagpur Open Source Society",
    "image_name": "koss.jpeg",
    "insta_url":
        "https://www.instagram.com/kossiitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/kossiitkgp",
    "linkedin_url":
        "https://www.linkedin.com/company/kharagpur-open-source-society/"
  },
  {
    "name": "Blockchain",
    "image_name": "kbs.webp",
    "insta_url":
        "https://www.instagram.com/blockchainkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/blockchainkgp",
    "linkedin_url": "https://www.linkedin.com/company/blockchainkgp/"
  },
  {
    "name": "Debating Society, IIT Kharagpur",
    "image_name": "debsoc.png",
    "insta_url":
        "https://www.instagram.com/debsoc.iitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/kgpdebsoc",
    "linkedin_url":
        "https://www.linkedin.com/company/debating-society-iit-kharagpur/"
  },
  {
    "name": "Breakfree: Technology dance Society",
    "image_name": "breakfree.png",
    "insta_url":
        "https://www.instagram.com/breakfreeiitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/Breakfreenowornever",
    "linkedin_url":
        "https://www.linkedin.com/company/technology-dance-society-iit-kharagpur/"
  },
  {
    "name": "Business Club",
    "image_name": "bclub.png",
    "insta_url":
        "https://www.instagram.com/bclub.iitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/bclubkgp",
    "linkedin_url": "https://www.linkedin.com/company/bclubiitkgp/"
  },
  {
    "name": "CGS IIT-KGP",
    "image_name": null,
    "insta_url":
        "https://www.instagram.com/iitkgp.cgs?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/cgsiitkgp",
    "linkedin_url": "Computer Graphics Society: Overview | LinkedIn"
  },
  {
    "name": "Chess Club",
    "image_name": "chess.png",
    "insta_url":
        "https://www.instagram.com/chessclub_iitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/ChessClubIITKGP",
    "linkedin_url": "https://www.linkedin.com/company/chessclub-iitkgp/"
  },
  {
    "name": "Code Club",
    "image_name": "code club.jpg",
    "insta_url":
        "https://www.instagram.com/codeclub.iitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/CodeClub.IITKGP",
    "linkedin_url": "CodeClub: Overview | LinkedIn"
  },
  {
    "name": "Communique",
    "image_name": "cq.jpeg",
    "insta_url":
        "https://www.instagram.com/communique_iitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/communique.iitkgp",
    "linkedin_url":
        "https://www.linkedin.com/company/communiqu%C3%A9-iit-kharagpur/"
  },
  {
    "name": "Composit",
    "image_name": null,
    "insta_url":
        "https://www.instagram.com/composit_iitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/composit.iitkgp",
    "linkedin_url": "https://www.linkedin.com/company/composit-iit-kharagpur/"
  },
  {
    "name": "Developers Society",
    "image_name": null,
    "insta_url":
        "https://www.instagram.com/devsoc.iitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/devsoc.iitkgp",
    "linkedin_url": "https://www.linkedin.com/company/devsoc-iitkgp/"
  },
  {
    "name": "Eastern Techology Music society",
    "image_name": "etms.png",
    "insta_url":
        "https://www.instagram.com/etmsiitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/ETMSIITKGP",
    "linkedin_url": null
  },
  {
    "name": "E-Cell",
    "image_name": "e cell.jpg",
    "insta_url":
        "https://www.instagram.com/iitkgp_ecell?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/ecell.iitkgp",
    "linkedin_url": "https://www.linkedin.com/company/ecellkgp/"
  },
  {
    "name": "The English Dramatics Society{ ENCORE }",
    "image_name": "encore.jpeg",
    "insta_url":
        "https://www.instagram.com/iitkgpencore?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/TDSEncore",
    "linkedin_url": "https://www.linkedin.com/company/etds-encore/"
  },
  {
    "name": "E-Sports Club, IIT Kharagpur",
    "image_name": null,
    "insta_url":
        "https://www.instagram.com/esports.iitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/iitkgp.esports",
    "linkedin_url": "https://www.linkedin.com/company/esports-iitkgp/"
  },
  {
    "name": "Finance & Economics Club",
    "image_name": "finance club.png",
    "insta_url":
        "https://www.instagram.com/fec_iitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/profile.php?id=100093523843643",
    "linkedin_url": "https://www.linkedin.com/company/fec-iit-kharagpur/"
  },
  {
    "name": "Gopali Youth Welfare Society",
    "image_name": "gyws.jpeg",
    "insta_url":
        "https://www.instagram.com/gyws_ngo.iitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url":
        "https://www.facebook.com/groups/104634882959212/user/100064708027238/",
    "linkedin_url":
        "https://www.linkedin.com/company/gopali-youth-welfare-society/"
  },
  {
    "name": "Grimoire of Code",
    "image_name": "grimoier.png",
    "insta_url":
        "https://www.instagram.com/grimoireofcode?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/goc.iitkgp",
    "linkedin_url": "https://www.linkedin.com/company/grimoire-of-code/"
  },
  {
    "name": "International Relations Cell",
    "image_name": "irc.jpeg",
    "insta_url":
        "https://www.instagram.com/irc.iitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/IRCIITKGP",
    "linkedin_url":
        "https://www.linkedin.com/company/international-relations-cell-iit-kharagpur/"
  },
  {
    "name": "KDAG",
    "image_name": "kdag.jpeg",
    "insta_url":
        "https://www.instagram.com/kdag.iitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/kgpdag",
    "linkedin_url": "https://www.linkedin.com/company/kdag/"
  },
  {
    "name": "KRSSG",
    "image_name": "krssg.png",
    "insta_url":
        "https://www.instagram.com/_krssg_?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/krssg",
    "linkedin_url":
        "https://www.linkedin.com/company/kharagpur-robosoccer-students-group/"
  },
  {
    "name": "Kshitij",
    "image_name": "ktj.jpeg",
    "insta_url":
        "https://www.instagram.com/ktj.iitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/groups/ktj.in",
    "linkedin_url": "(5) Kshitij, IIT Kharagpur: Overview | LinkedIn"
  },
  {
    "name": "Manga and Anime Society, Kharagpur",
    "image_name": "mask.png",
    "insta_url":
        "https://www.instagram.com/maskiitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/maskiitkgp",
    "linkedin_url": null
  },
  {
    "name": "Megalith",
    "image_name": null,
    "insta_url":
        "https://www.instagram.com/iitkgp.megalith?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/megalithkgp",
    "linkedin_url": "https://www.linkedin.com/company/megalith-iit-kharagpur/"
  },
  {
    "name": "North-East Students' Forum, IIT Kharagpur",
    "image_name": null,
    "insta_url":
        "https://www.instagram.com/nesf.iitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/profile.php?id=100087504068563",
    "linkedin_url":
        "https://www.linkedin.com/company/north-east-students-forum-iit-kharagpur/"
  },
  {
    "name": "Optima",
    "image_name": null,
    "insta_url":
        "https://www.instagram.com/optima.iitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/optima.iitkgp",
    "linkedin_url": "https://www.linkedin.com/company/optima-iitkgp/"
  },
  {
    "name": "Prakriti",
    "image_name": "prakriti.jpeg",
    "insta_url":
        "https://www.instagram.com/prkrt.iitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/prkrt.iitkgp",
    "linkedin_url": "Prakriti, IIT Kharagpur : Overview | LinkedIn"
  },
  {
    "name": "Prasthanam-TDS",
    "image_name": "prasthanam.jpeg",
    "insta_url":
        "https://www.instagram.com/prasthanam_iitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/Prasthanam.TDS",
    "linkedin_url": "https://www.linkedin.com/company/prasthanam-tds/"
  },
  {
    "name": "Pravah",
    "image_name": "pravah.jpeg",
    "insta_url":
        "https://www.instagram.com/pravah_iitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/Pravah.iitkgp",
    "linkedin_url": "Technology Dramatics Society - Pravah: Overview | LinkedIn"
  },
  {
    "name": "ProDex",
    "image_name": "pdx.png",
    "insta_url":
        "https://www.instagram.com/prodex.iitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/prodex.iitkgp",
    "linkedin_url": "https://www.linkedin.com/company/prodex-iit-kharagpur/"
  },
  {
    "name": "Public Policy and Governance Society",
    "image_name": null,
    "insta_url":
        "https://www.instagram.com/ppgs.iitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/ppgs.iitkgp",
    "linkedin_url":
        "https://www.linkedin.com/company/civil-services-club-iitkgp/"
  },
  {
    "name": "Quant Club, IIT Kharagpur",
    "image_name": "quant club.png",
    "insta_url":
        "https://www.instagram.com/quantclub_iitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/quantclubiitkgp",
    "linkedin_url": "https://www.linkedin.com/company/qciitkgp/"
  },
  {
    "name": "Quiz Club",
    "image_name": "quiz club.png",
    "insta_url":
        "https://www.instagram.com/iitkgp.qc?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/iitkgp.quizclub",
    "linkedin_url": "IIT Kharagpur Quiz Club: Overview | LinkedIn"
  },
  {
    "name": "shARE",
    "image_name": "share.jpeg",
    "insta_url":
        "https://www.instagram.com/share_iitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/share.iitkgp",
    "linkedin_url": "https://www.linkedin.com/company/share-iit-kharagpur/"
  },
  {
    "name": "Shaurya",
    "image_name": null,
    "insta_url":
        "https://www.instagram.com/shaurya.iitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/shauryaiitkgp",
    "linkedin_url": "https://www.linkedin.com/company/shaurya-iit-kharagpur/"
  },
  {
    "name": "Space Technology Students' Society (spAts)",
    "image_name": "spats.png",
    "insta_url":
        "https://www.instagram.com/spats.nssc.iitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/spAts.iitkgp",
    "linkedin_url": "https://www.linkedin.com/company/spats/"
  },
  {
    "name": "Spectra",
    "image_name": "spectra.jpg",
    "insta_url":
        "https://www.instagram.com/spectra.iitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/Spectra.IITKGP",
    "linkedin_url": "https://www.linkedin.com/company/spectra-iit-kharagpur/"
  },
  {
    "name": "Spring Fest",
    "image_name": "sf.JPEG",
    "insta_url":
        "https://www.instagram.com/iitkgp.springfest?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/springfest.iitkgp",
    "linkedin_url": "https://www.linkedin.com/company/spring-fest/"
  },
  {
    "name": "Students' Alumni Cell",
    "image_name": null,
    "insta_url":
        "https://www.instagram.com/sac.iitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/iitkgp.alumnicell",
    "linkedin_url": "https://www.linkedin.com/company/sac-iitkgp/"
  },
  {
    "name": "Student's Branding and Relations Cell",
    "image_name": "sbrc.jpg",
    "insta_url":
        "https://www.instagram.com/sbrc.iitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/sbrciitkgp",
    "linkedin_url":
        "Students\u2019 Branding and Relations Cell, IIT Kharagpur: Overview | LinkedIn"
  },
  {
    "name": "TDS-Druheen",
    "image_name": "dhruheen.png",
    "insta_url":
        "https://www.instagram.com/btdsdruheeniitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/tdsdruheen",
    "linkedin_url":
        "https://www.linkedin.com/company/druheen-bengali-technology-dramatics-society-iit-kharagpur/"
  },
  {
    "name": "TeamKART",
    "image_name": "team kart.jpeg",
    "insta_url":
        "https://www.instagram.com/team.kart?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/TeamKART",
    "linkedin_url": "https://www.linkedin.com/company/team-kart/"
  },
  {
    "name": "Technology Adventure Society",
    "image_name": "tads2.jpeg",
    "insta_url":
        "https://www.instagram.com/tads_iitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/TAdS.IIT",
    "linkedin_url":
        "https://www.linkedin.com/company/technology-adventure-society-tads-iit-kharagpur/"
  },
  {
    "name": "Technology Environment Society",
    "image_name": null,
    "insta_url":
        "https://www.instagram.com/tesiitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/TESIITKGP",
    "linkedin_url": "https://www.linkedin.com/company/tesiitkgp/"
  },
  {
    "name": "Technology Literary Society",
    "image_name": "tls.jpeg",
    "insta_url":
        "https://www.instagram.com/tls.iitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/tls.iitkgp",
    "linkedin_url":
        "https://www.linkedin.com/company/technology-literary-society/"
  },
  {
    "name": "Technology Robotix Society",
    "image_name": "trs.jpeg",
    "insta_url":
        "https://www.instagram.com/robotix_iitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/robotixiitkgp",
    "linkedin_url":
        "https://www.linkedin.com/company/technology-robotix-society/"
  },
  {
    "name": "TFPS",
    "image_name": "tfps.jpeg",
    "insta_url":
        "https://www.instagram.com/tfps.iitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/tfps.iitkgp",
    "linkedin_url":
        "https://www.linkedin.com/company/unavailable/ (unavailable)"
  },
  {
    "name": "The KGPian Game Theory Society",
    "image_name": "game theory.png",
    "insta_url":
        "https://www.instagram.com/kgts.iitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/The.KGTS",
    "linkedin_url":
        "https://www.linkedin.com/company/the-kgpian-game-theory-society/"
  },
  {
    "name": "The Scholars' Avenue",
    "image_name": null,
    "insta_url":
        "https://www.instagram.com/scholarsavenue?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/scholarsavenue",
    "linkedin_url": "https://www.linkedin.com/company/the-scholars'-avenue/"
  },
  {
    "name": "TMES",
    "image_name": null,
    "insta_url":
        "https://www.instagram.com/tmes_iitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/profile.php?id=100054504698718",
    "linkedin_url": "https://www.linkedin.com/company/tmes-iitkgp/"
  },
  {
    "name": "Western technology music society",
    "image_name": "wtms.jpeg",
    "insta_url":
        "https://www.instagram.com/wtmsiitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/wtmsiitkgp",
    "linkedin_url":
        "https://www.linkedin.com/company/western-technology-music-society/"
  },
  {
    "name": "180 Degrees Consulting",
    "image_name": "180dc.png",
    "insta_url":
        "https://www.instagram.com/180dc.iitkgp?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/180dckgp",
    "linkedin_url": "https://www.linkedin.com/company/180degreesconsulting/"
  },
  {
    "name": "Technology Comedy Club",
    "image_name": null,
    "insta_url":
        "https://www.instagram.com/comedy_club_iit_kharagpur?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
    "facebook_url": "https://www.facebook.com/comedyclubiitkgp",
    "linkedin_url": "Technology Comedy Club, IIT Kharagpur: Overview | LinkedIn"
  }
];
