// import 'dart:developer';
//
// // ignore: implementation_imports
// import 'package:dio/src/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:movie_finder_app/list_cart_user.dart';
// import 'package:movie_finder_app/list_cast.dart';
// import 'package:movie_finder_app/restapi.dart';
//
// class DetailMovie extends StatefulWidget {
//   final String id;
//
//   const DetailMovie({super.key, required this.id});
//
//   @override
//   State<DetailMovie> createState() => _DetailMovieState();
// }
//
// class _DetailMovieState extends State<DetailMovie> {
//   bool isLoading = false;
//   final baseUrl = "https://image.tmdb.org/t/p/original";
//   final dio = Dio();
//   ListCart? listcart = ListCart();
//   User? user = User();
//
//   void _incrementCounter() async {
//     if (mounted) {
//       final client = RestClient(dio);
//       String apiKey = "9bb89316d8693b06d7a84980b29c011f";
//       try {
//         final result = await client.getDetail(apiKey, widget.id);
//         // list.addAll(result);
//         log(result.toString());
//         if (mounted) {
//           setState(() {
//             listcart = result;
//           });
//         }
//       } catch (e) {
//         log(e.toString());
//       }
//     }
//     // dio.options.headers["Demo-Header"] =
//     //     "demo header"; // config your dio headers globally
//   }
//
//   Future<void> _incrementCounter2() async {
//     if (mounted) {
//       final client = RestClient(dio);
//       String apiKey = "9bb89316d8693b06d7a84980b29c011f";
//       try {
//         final result = await client.getUers(apiKey, widget.id);
//         // list.addAll(result);
//         log(result.toString());
//         if (mounted) {
//           setState(() {
//             user = result;
//           });
//         }
//       } catch (e) {
//         log(e.toString());
//       }
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _incrementCounter();
//     _incrementCounter2().then((value) {
//       if (mounted) {
//         setState(() {
//           isLoading = true;
//         });
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final nameMovie = listcart?.title;
//     return SizedBox(
//       height: 300,
//       child: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.only(
//             top: 0,
//             right: 25,
//             left: 25,
//           ),
//           width: MediaQuery.of(context).size.width,
//           decoration: const BoxDecoration(
//             borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//             gradient: LinearGradient(
//               colors: [Color(0xFF2E5676), Color(0xFF4B4576)],
//               begin: Alignment.bottomLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: 20,
//                 child: Image.asset('assets/icon/1.png'),
//               ),
//               Text(
//                 nameMovie ?? '',
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 30,
//                     color: Colors.white),
//               ),
//               Text(
//                 listcart?.tagline ?? '',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 25,
//                     color: Colors.white.withOpacity(0.4)),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     width: 65,
//                     height: 30,
//                     margin: const EdgeInsets.symmetric(horizontal: 4),
//                     decoration: BoxDecoration(
//                         color: Colors.white.withOpacity(0.3),
//                         borderRadius: BorderRadius.circular(20)),
//                     child: Center(
//                       child: Text(
//                         'Acition',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     width: 50,
//                     height: 30,
//                     margin: EdgeInsets.symmetric(horizontal: 4),
//                     decoration: BoxDecoration(
//                         color: Colors.white.withOpacity(0.3),
//                         borderRadius: BorderRadius.circular(20)),
//                     child: Center(
//                       child: Text(
//                         '16+',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     padding:
//                     const EdgeInsets.symmetric(horizontal: 7, vertical: 8),
//                     margin: EdgeInsets.symmetric(horizontal: 4),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         color: Colors.amber),
//                     child: Row(
//                       children: [
//                         Text(
//                           'IMDb 8,5',
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 13,
//                               fontWeight: FontWeight.bold),
//                         )
//                       ],
//                     ),
//                   ),
//                   const Spacer(),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 4),
//                     child: Image.asset('assets/icon/2.png'),
//                   ),
//                   Icon(
//                     Icons.favorite,
//                     size: 30,
//                     color: Colors.white,
//                   )
//                 ],
//               ),
//               Container(
//                 padding: EdgeInsets.only(top: 30),
//                 child: Text(
//                   listcart?.overview ?? '',
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 3,
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 17,
//                       fontWeight: FontWeight.w300),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(top: 20),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'Cast',
//                           style: TextStyle(
//                               fontSize: 30,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white),
//                         ),
//                         Text(
//                           'See All',
//                           style: TextStyle(
//                               fontWeight: FontWeight.w300,
//                               fontSize: 15,
//                               color: Colors.white),
//                         )
//                       ],
//                     ),
//                     SizedBox(
//                       height: 120,
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         physics: NeverScrollableScrollPhysics(),
//                         itemCount: user?.cast?.length,
//                         itemBuilder: (context, index) {
//                           final item = user?.cast?[index];
//                           final image = '$baseUrl${item?.profilePath}';
//                           return isLoading ? Container(
//                             height: 50,
//                             width: 70,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20)),
//                             child: Column(
//                               children: [
//                                 Image(
//                                   image: AssetImage(
//                                     image ?? '',
//                                   ),
//                                   fit: BoxFit.cover,
//                                   // height: 50,
//                                   // width: 50,
//                                 ),
//                                 Text(
//                                   '',
//                                   style: TextStyle(
//                                       fontSize: 10, color: Colors.white),
//                                 ),
//                                 Text(
//                                   '',
//                                   style: TextStyle(
//                                       fontSize: 10, color: Colors.white),
//                                 )
//                               ],
//                             ),
//                           )  : Container( decoration: BoxDecoration(
//                             color: Colors.cyan
//                           ),);
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
