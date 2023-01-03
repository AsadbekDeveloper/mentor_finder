import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:mentor_finder/helper/color.dart';
import 'package:mentor_finder/screens/home/home_page.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        body: const HomePage(),
        bottomNavigationBar: SnakeNavigationBar.color(
          snakeViewColor: mainblue,
          unselectedItemColor: maingrey,
          behaviour: SnakeBarBehaviour.pinned,
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'person',
            ),
          ],
        ),
      ),
    );
  }
}