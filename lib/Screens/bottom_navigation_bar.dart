import 'package:flutter/material.dart';
import 'my_haircut.dart';
import 'hair_color.dart';
import 'trending_haircut.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [     MyHaircut(),     HairColor(),    TrendingHaircut(),  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedLabelStyle: const TextStyle(color: Colors.white, fontSize: 14),
        backgroundColor: const Color.fromARGB(137, 119, 40, 70),
        fixedColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.cut, color: _currentIndex == 0 ?  const Color(0xB58A1B40) : null),
            label: 'My Haircut',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_color_fill, color: _currentIndex == 1 ? const Color(0xB58A1B40) : null),
            label: 'Hair Color',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face_retouching_natural, color: _currentIndex == 2 ? const Color(0xB58A1B40) : null),
            label: 'Trending Haircut',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
