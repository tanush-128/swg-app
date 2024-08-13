import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rxdart/subjects.dart';
import 'package:swg_flutter/BaseLayout.dart';
import 'package:swg_flutter/LoginPage/LoginPage.dart';
import 'package:swg_flutter/constants.dart';
import 'package:swg_flutter/firebase_options.dart';
import 'package:swg_flutter/logoView.dart';
import 'package:swg_flutter/utils/notification.dart';
import 'package:swg_flutter/views/CDC/CDCIntershipPage.dart';
import 'package:swg_flutter/views/ProfileView.dart';
import 'package:swg_flutter/views/SocietiesPage.dart';
import 'package:swg_flutter/views/StudyMaterial.dart';
import 'package:swg_flutter/views/subviews/BenifitsOfInstiIdPage.dart';
import 'package:swg_flutter/views/subviews/EventView.dart';
import 'package:swg_flutter/views/subviews/KnowYourDepartment.dart';
import 'package:swg_flutter/views/subviews/NoticeBoard.dart';
import 'package:swg_flutter/views/subviews/YearWiseStudyMaterial/first_year_sm.dart';
import 'package:swg_flutter/views/subviews/YearWiseStudyMaterial/fourth_year_sm.dart';
import 'package:swg_flutter/views/subviews/YearWiseStudyMaterial/second_year_sm.dart';
import 'package:swg_flutter/views/subviews/YearWiseStudyMaterial/third_year_sm.dart';
import 'package:swg_flutter/views/subviews/mentor_mentee_page.dart';
import 'package:swg_flutter/views/subviews/ourTeamPage.dart';

// used to pass messages from event handler to the UI
final messageStreamController = BehaviorSubject<RemoteMessage>();
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // showNotification(message);
  if (kDebugMode) {
    print("Handler in main.dart");
    print("Handling a background message: ${message.messageId}");
    print('Message data: ${message.data}');
    print('Message notification: ${message.notification?.title}');
    print('Message notification: ${message.notification?.body}');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: false,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelGroupKey: 'basic_channel_group',
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          ledColor: Colors.white,
          importance: NotificationImportance.High,
          channelShowBadge: true,
          defaultRingtoneType: DefaultRingtoneType.Notification,
          playSound: true,
          enableVibration: true,
          vibrationPattern: Int64List.fromList([1000, 1000, 2000, 1000, 3000]),
        )
      ],
      // Channel groups are only visual and are not required
      channelGroups: [
        NotificationChannelGroup(
          channelGroupKey: 'basic_channel_group',
          channelGroupName: 'Basic group',
        )
      ],
      debug: true);
  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });

  final messaging = FirebaseMessaging.instance;

  messaging.setForegroundNotificationPresentationOptions(
    alert: true, // Required to display a heads up notification
    badge: true,
    sound: true,
  );
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (kDebugMode) {
        print('A new onMessageOpenedApp event was published!');
      }

      messageStreamController.sink.add(message);
    });

    FirebaseMessaging.onMessage.listen(foregroundMessageHandler(context));

    setUpAwesomeNotif();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: GlobalStyles.kPrimaryBlueColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            foregroundColor: MaterialStateProperty.all(Colors.black),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.black),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          labelStyle: const TextStyle(color: Colors.black),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          actionsIconTheme: IconThemeData(color: Colors.black),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.white,
          ),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            color: GlobalStyles.kPrimaryBlueColor,
          ),
        ),
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.white,
          height: 60,
          padding: EdgeInsets.all(0),
          elevation: 0,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          // backgroundColor: Colors.blue,
          elevation: 5,
          shape: CircleBorder(),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        'logo': (context) => const LogoView(),
        '/login': (context) => const LoginPage(),
        '/': (context) => const HomePage(),
        '/profile': (context) => Scaffold(
              appBar: AppBar(
                title: const Text("Profile"),
              ),
              body: const ProfileView(),
            ),
        '/cdcinternshipblogs': (context) => CDCIntershipPage(
              heading: 'Internship',
            ),
        '/cdcplacementblogs': (context) => CDCIntershipPage(
              heading: 'Placement',
            ),
        '/event-view': (context) => EventView(event: event),
        '/first-year-sm': (context) => const FirstYearSM(),
        '/second-year-sm': (context) => const SecondYearSM(),
        '/third-year-sm': (context) => const ThirdYearSM(),
        '/fourth-year-sm': (context) => const FourthYearSM(),
        '/societies': (context) => const SocietiesPage(),
        '/knowyourdep': (context) => const KnowYourDepartment(),
        '/benefitsofinsti': (context) => const BenifitsOfInstiId(),
        '/studymaterial': (context) => const StudyMaterial(),
        '/noticeboard': (context) => const NoticeBoard(),
        '/ourteam': (context) => OurTeamPage(),
        '/mentor-mentee': (context) => const MentorMenteePage(),
      },
    );
  }
}
