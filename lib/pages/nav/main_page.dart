import 'package:flutter/material.dart';
import 'package:little/pages/nav/bar_item.dart';
import 'package:little/pages/home.dart';
import 'package:little/pages/nav/my_page.dart';
import 'package:little/pages/nav/search.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    const HomePage(),
    const BarItemPage(),
    const SearchPage(),
    const MyPage(),
  ];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        // showSelectedLabels: false,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
              label: 'home', icon: Icon(Icons.apps_rounded)),
          BottomNavigationBarItem(
              label: 'bar', icon: Icon(Icons.bar_chart_sharp)),
          BottomNavigationBarItem(
              label: 'search', icon: Icon(Icons.search_rounded)),
          BottomNavigationBarItem(
              label: 'user', icon: Icon(Icons.person_rounded)),
        ],
      ),
    );
  }
}
