import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_finder_app/restapi.dart';

import 'list_cart_user.dart';
import 'list_cast.dart';

class DetailProduct extends StatefulWidget {
  final String id;

  const DetailProduct({super.key, required this.id});

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  bool isExpanded = false;
  final baseUrl = "https://image.tmdb.org/t/p/original";
  bool isLoading = true;
  bool isLoadingUser = true;

  // void _showModalBottomSheep() {
  //   print("HungDT I");
  //   showModalBottomSheet(
  //     shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
  //     elevation: 0,
  //     barrierColor: Colors.transparent,
  //     context: context,
  //     builder: (context) {
  //       return DetailMovie(
  //         id: widget.id,
  //       );
  //     },
  //   );
  // }

  final dio = Dio();
  ListCart? listcart = ListCart();
  User? user = User();

  Future<void> _getDetail() async {
    if (mounted) {
      final client = RestClient(dio);
      String apiKey = "9bb89316d8693b06d7a84980b29c011f";
      try {
        final result = await client.getDetail(apiKey, widget.id);
        log(result.toString());
        if (mounted) {
          setState(() {
            listcart = result;
          });
        }
      } catch (e) {
        log(e.toString());
      }
    }
  }

  Future<void> _getUser() async {
    if (mounted) {
      final client = RestClient(dio);
      String apiKey = "9bb89316d8693b06d7a84980b29c011f";
      try {
        final result = await client.getUers(apiKey, widget.id);
        log(result.toString());
        if (mounted) {
          setState(() {
            user = result;
          });
        }
      } catch (e) {
        log(e.toString());
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _getDetail().then((value) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });
    _getUser().then((value) {
      if (mounted) {
        setState(() {
          isLoadingUser = false;
        });
      }
    });
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   Future.delayed(Duration(seconds: 1))
    //       .then((value) => _showModalBottomSheep(
    //   ));
    // });
  }

  @override
  Widget build(BuildContext context) {
    final imagedetail = '$baseUrl${listcart?.backdropPath}';
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  child: Image.network(
                    imagedetail,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 30,
                  top: 70,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 400,
                    padding: const EdgeInsets.only(
                      top: 0,
                      right: 25,
                      left: 25,
                    ),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(50)),
                      gradient: LinearGradient(
                        colors: [Color(0xFF2E5676), Color(0xFF4B4576)],
                        begin: Alignment.bottomLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20,
                            child: Image.asset('assets/icon/1.png'),
                          ),
                          Text(
                            listcart?.title ?? '',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.white),
                          ),
                          Text(
                            listcart?.tagline ?? '',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.white.withOpacity(0.4)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 65,
                                height: 30,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Center(
                                  child: Text(
                                    'Acition',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 30,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Center(
                                  child: Text(
                                    '16+',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 7, vertical: 8),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.amber),
                                child: const Row(
                                  children: [
                                    Text(
                                      'IMDb 8,5',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                child: Image.asset('assets/icon/2.png'),
                              ),
                              const Icon(
                                Icons.favorite,
                                size: 30,
                                color: Colors.white,
                              )
                            ],
                          ),
                          isExpanded
                              ? Container(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: RichText(
                                      textAlign: TextAlign.start,
                                      text: TextSpan(children: [
                                        TextSpan(
                                          text: listcart?.overview!,
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                        WidgetSpan(
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    isExpanded = !isExpanded;
                                                  });
                                                },
                                                child: const Text("Less more",
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            100, 171, 219, 1),
                                                        fontSize: 12))))
                                      ])),
                                )
                              : Container(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: RichText(
                                    textAlign: TextAlign.start,
                                    maxLines: 3,
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: listcart?.overview!
                                              .substring(0, 100),
                                          style: const TextStyle(
                                            fontSize: 14,
                                          )),
                                      WidgetSpan(
                                          child: InkWell(
                                        mouseCursor: SystemMouseCursors.click,
                                        onTap: () {
                                          setState(() {
                                            isExpanded = !isExpanded;
                                          });
                                        },
                                        child: const Text(
                                          '... More',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color.fromRGBO(
                                                  100, 171, 219, 1)),
                                        ),
                                      )),
                                    ]),
                                  ),
                                ),
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Cast',
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      'See All',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 15,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                                isLoadingUser
                                    ? const SizedBox()
                                    : SizedBox(
                                        height: 170,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: user?.cast?.length,
                                          itemBuilder: (context, index) {
                                            final item = user?.cast?[index];
                                            final image =
                                                '$baseUrl${item?.profilePath}';
                                            return Container(
                                              height: 50,
                                              width: 70,
                                              child: Column(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    child: Image(
                                                      image: NetworkImage(
                                                        image,
                                                      ),
                                                      fit: BoxFit.cover,
                                                      height: 50,
                                                      width: 50,
                                                    ),
                                                  ),
                                                  Text(
                                                    item?.character ?? '',
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.white),
                                                  ),
                                                  Text(
                                                    item?.originalName ?? '',
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.white),
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
