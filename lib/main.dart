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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Colors.indigo,
          onPrimary: Colors.white,
          secondary: Colors.indigo.shade100,
          onSecondary: Colors.black,
          error: Colors.red.shade900,
          onError: Colors.red.shade500,
          surface: Colors.indigo.shade50,
          onSurface: Colors.black,
        ),
        textTheme: const TextTheme(
          displayMedium: TextStyle(fontSize: 45),
          titleLarge: TextStyle(fontSize: 22),
        ),
      ),
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
  List screens = [
    const HomeScreen(),
    const DataScreen(),
    const ContactScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('App Two'))),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Theme.of(context).colorScheme.secondary,
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
