import 'package:flutter/material.dart';
import 'package:flutter_app_2/screens/contact_screen.dart';
import 'package:flutter_app_2/screens/data_screen.dart';
import 'package:flutter_app_2/screens/home_screen.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPageIndex = 0;
  var screens = [HomeScreen(), DataScreen(), ContactScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.indigo[200],
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(
              icon: Icon(Icons.person_search_sharp), label: 'Data'),
          NavigationDestination(
              icon: Icon(Icons.contact_mail_sharp), label: 'Contact'),
        ],
      ),
      body: screens[currentPageIndex],
    );
  }
}
