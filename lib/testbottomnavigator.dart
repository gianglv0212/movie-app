// import 'package:flutter/material.dart';
//
// class TestBottomNavigator extends StatefulWidget {
//   const TestBottomNavigator({super.key});
//
//   @override
//   State<TestBottomNavigator> createState() => _TestBottomNavigatorState();
// }
//
// class _TestBottomNavigatorState extends State<TestBottomNavigator> {
//   int _selectedIndex = 0;
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return  Center(),
//       bottomNavigationBar: Container(
//         padding: EdgeInsets.zero,
//         decoration: BoxDecoration(
//             gradient: LinearGradient(
//           colors: [Color(0xFF2E5676), Color(0xFF4B4576)],
//           begin: Alignment.bottomLeft,
//           end: Alignment.bottomRight,
//         )),
//         child: BottomNavigationBar(
//           backgroundColor: Colors.white.withOpacity(0.2),
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//                 icon: Image(image: AssetImage('assets/iconnavigator/home.png')),
//                 label: '.',
//                ),
//             BottomNavigationBarItem(
//               icon: Image(image: AssetImage('assets/iconnavigator/Favorite.png')),
//               label: '.',
//             ),
//             BottomNavigationBarItem(
//               icon:  Image(image: AssetImage('assets/iconnavigator/file.png')),
//               label: '.',
//             ),
//             BottomNavigationBarItem(
//               icon:  Image(image: AssetImage('assets/iconnavigator/accout.png')),
//               label: '.',
//             ),
//             BottomNavigationBarItem(
//               icon:  Image(image: AssetImage('assets/iconnavigator/Ellipse 4.png')),
//               label: '.',
//             ),
//           ],
//           currentIndex: _selectedIndex,
//           selectedItemColor: Colors.white,
//           onTap: _onItemTapped,
//           showSelectedLabels: true,
//           showUnselectedLabels: false,
//           selectedLabelStyle:
//               TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
//         ),
//       )
//   }
// }
// Column(
// mainAxisAlignment: MainAxisAlignment.end,
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Image(image: AssetImage('assets/iconnavigator/home.png')),
// Image(image: AssetImage('assets/iconnavigator/home.png')),
// Image(image: AssetImage('assets/iconnavigator/home.png')),
// Image(image: AssetImage('assets/iconnavigator/home.png')),
// Image(image: AssetImage('assets/iconnavigator/home.png')),
// ],
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Image(image: AssetImage('assets/iconnavigator/shuffle.png')),
// Image(image: AssetImage('assets/iconnavigator/shuffle.png')),
// Image(image: AssetImage('assets/iconnavigator/shuffle.png')),
// Image(image: AssetImage('assets/iconnavigator/shuffle.png')),
// Image(image: AssetImage('assets/iconnavigator/shuffle.png')),
// ],
// )
// ],
// ),
