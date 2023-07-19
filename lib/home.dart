import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_finder_app/listmovie.dart';
import 'package:movie_finder_app/producmovie.dart';
import 'package:movie_finder_app/restapi.dart';

import 'category.dart';
import 'heard.dart';
import 'search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  bool isLoagding = true;
  int _selectedIndex = 0;
  final dio = Dio();
  Movies? movies = Movies();

  void _mostPopular() async {
    // dio.options.headers["Demo-Header"] =
    //     "demo header"; // config your dio headers globally
    final client = RestClient(dio);
    String apiKey = "1c41bc4d48164328c74673990b12b00f";
    //Movies? result = Movies();

      //sleep(const Duration(seconds: 20));
      final result = await client.getTasks2(apiKey);

      log(result.toString());
       // if (mounted) {
         setState(() {
           movies = result;
           isLoagding = false;
         });
       // }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    log("initState");
    super.initState();
    _mostPopular();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2E5676), Color(0xFF4B4576)],
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              Search(),
              ListHeard(movie: movies),
              Categories(),
              ProduceMovie(movie: movies),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2E5676), Color(0xFF4B4576)],
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight,
          ),
        ),
      height: 70,
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Image.asset('assets/iconnavigator/home.png', height: 20,),
              backgroundColor: Colors.white.withOpacity(0),
              activeIcon: Column(
                children: [
                  Image.asset('assets/iconnavigator/home.png', height: 20,),
                  Image.asset('assets/iconnavigator/ellipse.png')
                ],
              ),
              label: "Home"
          ),
          BottomNavigationBarItem(icon: Image.asset('assets/iconnavigator/Favorite.png', height: 20,),
              backgroundColor: Colors.white.withOpacity(0),
              activeIcon: Column(
                children: [
                  Image.asset('assets/iconnavigator/Favorite.png', height: 15,),
                  Image.asset('assets/iconnavigator/ellipse.png')
                ],
              ),
              label: "Home"
          ),
          BottomNavigationBarItem(icon: Image.asset('assets/iconnavigator/ticket.png', height: 20,),
              backgroundColor: Colors.white.withOpacity(0),
              activeIcon: Column(
                children: [
                  Image.asset('assets/iconnavigator/ticket.png', height: 15,),
                  Image.asset('assets/iconnavigator/ellipse.png')
                ],
              ),
              label: "Home"
          ),
          BottomNavigationBarItem(icon: Image.asset('assets/iconnavigator/accout.png', height: 20,),
              backgroundColor: Colors.white.withOpacity(0),
              activeIcon: Column(
                children: [
                  Image.asset('assets/iconnavigator/accout.png', height: 15,),
                  Image.asset('assets/iconnavigator/ellipse.png')
                ],
              ),
              label: "Home"
          ),
          BottomNavigationBarItem(icon: Image.asset('assets/iconnavigator/shuffle.png',height: 20,),
              backgroundColor: Colors.white.withOpacity(0.1),
              activeIcon: Column(
                children: [
                  Image.asset('assets/iconnavigator/shuffle.png', height: 15,),
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
  // Container(
  //     decoration: const BoxDecoration(
  //       gradient: LinearGradient(
  //         colors: [Color(0xFF2E5676), Color(0xFF4B4576)],
  //         begin: Alignment.bottomLeft,
  //         end: Alignment.bottomRight,
  //       ),
  //     ),
  //     child: BottomBarMovei()),
}
