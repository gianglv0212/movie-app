import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigatorBar extends StatefulWidget {
  const BottomNavigatorBar({super.key});

  @override
  State<BottomNavigatorBar> createState() => _BottomNavigatorBarState();
}

class _BottomNavigatorBarState extends State<BottomNavigatorBar> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 100,
        child: BottomNavigationBar(
          backgroundColor: Colors.white.withOpacity(0.2),
          items: [
         BottomNavigationBarItem(icon: Image.asset('assets/iconnavigator/home.png'),
         activeIcon: Column(
           children: [
             Image.asset('assets/iconnavigator/home.png'),
             Image.asset('assets/iconnavigator/ellipse.png')
           ],
         ),
           label: "Home"
         ),
            BottomNavigationBarItem(icon: Image.asset('assets/iconnavigator/Favorite.png'),
                activeIcon: Column(
                  children: [
                    Image.asset('assets/iconnavigator/Favorite.png'),
                    Image.asset('assets/iconnavigator/ellipse.png')
                  ],
                ),
                label: "Home"
            ),
            BottomNavigationBarItem(icon: Image.asset('assets/iconnavigator/ticket.png'),
                activeIcon: Column(
                  children: [
                    Image.asset('assets/iconnavigator/ticket.png'),
                    Image.asset('assets/iconnavigator/ellipse.png')
                  ],
                ),
                label: "Home"
            ),
            BottomNavigationBarItem(icon: Image.asset('assets/iconnavigator/accout.png'),
                activeIcon: Column(
                  children: [
                    Image.asset('assets/iconnavigator/accout.png'),
                    Image.asset('assets/iconnavigator/ellipse.png')
                  ],
                ),
                label: "Home"
            ),
            BottomNavigationBarItem(icon: Image.asset('assets/iconnavigator/shuffle.png'),
                activeIcon: Column(
                  children: [
                    Image.asset('assets/iconnavigator/shuffle.png'),
                    Image.asset('assets/iconnavigator/ellipse.png')
                  ],
                ),
                label: "Home"
            )
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
          showSelectedLabels: false,

        ),
      ),
    );
  }
}
