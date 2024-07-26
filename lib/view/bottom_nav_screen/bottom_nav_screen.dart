import 'package:flutter/material.dart';
import 'package:netflix_app/utils/constants/color_constants.dart';
import 'package:netflix_app/view/coming_soon_screen/coming_soon_screen.dart';
import 'package:netflix_app/view/home_screen/home_screen.dart';
import 'package:netflix_app/view/more_screen/more_screen.dart';
import 'package:netflix_app/view/search_screen/search_screen.dart';
import 'package:netflix_app/view/user_name_screen/user_name_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int selectedIndex = 0;
  List<Widget> myScreens = [
    HomeScreen(),
    SearchScreen(),
    ComingSoonSreen(),
    Container(color: Colors.blue),
    Morescreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myScreens[selectedIndex],
      backgroundColor: ColorConstants.mainBlack,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        backgroundColor: ColorConstants.mainBlack,
        selectedItemColor: ColorConstants.mainWhite,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_collection_outlined),
              label: "Coming soon"),
          BottomNavigationBarItem(
              icon: Icon(Icons.file_download_sharp), label: "Downloads"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "More"),
        ],
        onTap: (value) {
          selectedIndex = value;
          setState(() {});
        },
      ),
    );
  }
}
