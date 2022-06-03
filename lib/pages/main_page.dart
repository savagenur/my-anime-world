import 'package:flutter/material.dart';
import 'package:my_animes/pages/discussion_page.dart';
import 'package:my_animes/pages/home_page.dart';
import 'package:my_animes/pages/my_list_page.dart';
import 'package:my_animes/pages/seasonal_page.dart';
import 'package:my_animes/services/apis/upcoming_api.dart';
import 'package:my_animes/widgets/home_appbar.dart';

import '../widgets/anime_item.dart';
import '../widgets/navigation_drawer.dart';
import 'discover_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int currentIndex = 0;
  List pages = [
    HomePage(),
    DiscussionPage(),
    DiscoverPage(),
    SeasonalPage(),
    MyListPage(),


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: homeAppBar(),
            drawer: NavigationDrawer(),
            body: pages[currentIndex],
            bottomNavigationBar: bottomNavBar(),
          );
  }

  BottomNavigationBar bottomNavBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      fixedColor: Colors.blue,
      currentIndex: currentIndex,
      onTap: (int index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline_rounded), label: "Discussion"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.search_outlined,
            ),
            label: "Discover"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month_outlined,
            ),
            label: "Seasonal"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.list_rounded,
            ),
            label: "My List"),
      ],
    );
  }
}
