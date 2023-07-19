import 'package:flutter/material.dart';

class BottomBarMovei extends StatefulWidget {
  const BottomBarMovei({super.key});

  @override
  State<BottomBarMovei> createState() => _BottomBarMovei();
}

class _BottomBarMovei extends State<BottomBarMovei> {
  final List<IconData> iconDatas = [
    Icons.home_outlined,
    Icons.favorite,
    Icons.airplane_ticket_outlined,
    Icons.account_circle_outlined,
    Icons.shuffle_outlined,
  ];
  // final List<String> imageBottom =[
  //   'assets/iconnavigator/home.png',
  //   'assets/iconnavigator/Favorite.png',
  //   'assets/iconnavigator/file.png',
  //   'assets/iconnavigator/accout.png',
  //   'assets/iconnavigator/shuffle.png',
  // ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white.withOpacity(0.1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          iconDatas.length,
          (index) {
            return Expanded(
              child: _buildBottomNavbarItem(
                iconDatas[index],
                // imageBottom[index],

                index: index,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBottomNavbarItem(IconData iconData, {int? index}) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        setState(() {
          _selectedIndex = index ?? 0;
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return PageView();
            },
          ));
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 30,
            color: Colors.white,
          ),
          if (index == _selectedIndex) ...[
            // SizedBox(height: 0),
            Icon(
              Icons.lens,
              size: 10,
              color: Colors.white,
            ),
          ],
        ],
      ),
    );
  }
}
