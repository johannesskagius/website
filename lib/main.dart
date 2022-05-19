import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:website/projects.dart';

import 'about.dart';
import 'acheive.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await FirebaseAppCheck.instance.activate(
  //   webRecaptchaSiteKey: '6Lea-P8fAAAAAFbXk5WIh6bBkySCNxp1GAqpRrdd',
  // );ewewe
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String s = '';

  @override
  Widget build(BuildContext context) {
    return const Home();
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _pController = PageController();
  int _selected = 0;

  void _onPageChanged(int i) {
    setState(() {
      _selected = i;
    });
  }

  void onTapped(int index) {
    setState(() {
      _pController.animateToPage(index,
          duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('test'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: PageView(
              pageSnapping: true,
              controller: _pController,
              onPageChanged: _onPageChanged,
              children: const [
                Achieve(),
                Projects(),
                About(),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: BottomNavigationBar(
        showSelectedLabels: true,
        currentIndex: _selected,
        selectedItemColor: Colors.green,
        onTap: onTapped,
        items: const [
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.doorOpen), label: 'Achieve'),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.airbnb), label: 'Welcome'),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.doorOpen), label: 'Projects'),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.doorOpen), label: 'About'),
        ],
      ),
    );
  }
}
