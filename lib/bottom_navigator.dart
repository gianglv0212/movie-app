import 'package:flutter/material.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _selectedItem = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2E5676), Color(0xFF4B4576)],
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white.withOpacity(0.2),
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/iconnavigator/home.png'),
                    color: Colors.grey,
                  ),
                  label: '',
                  activeIcon: Column(
                    children: [
                      ImageIcon(
                        AssetImage('assets/iconnavigator/home.png'),
                        color: Colors.white,
                      ),
                      ImageIcon(
                        AssetImage('assets/iconnavigator/ellipse.png'),
                        color: Colors.white,
                      )
                    ],
                  )),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/iconnavigator/home.png'),
                    color: Colors.grey,
                  ),
                  label: '',
                  activeIcon: Column(
                    children: [
                      ImageIcon(
                        AssetImage('assets/iconnavigator/home.png'),
                        color: Colors.white,
                      ),
                      ImageIcon(
                        AssetImage('assets/iconnavigator/ellipse.png'),
                        color: Colors.white,
                      )
                    ],
                  )),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/iconnavigator/home.png'),
                    color: Colors.grey,
                  ),
                  label: '',
                  activeIcon: Column(
                    children: [
                      ImageIcon(
                        AssetImage('assets/iconnavigator/home.png'),
                        color: Colors.white,
                      ),
                      ImageIcon(
                        AssetImage('assets/iconnavigator/ellipse.png'),
                        color: Colors.white,
                      )
                    ],
                  )),
            ],
            onTap: _onItemTapped,
            currentIndex: _selectedItem,
            showSelectedLabels: false,
            showUnselectedLabels: true,
          )),
    );
  }
}
