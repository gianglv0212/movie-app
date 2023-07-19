import 'package:card_swiper/card_swiper.dart';
import 'package:circular/circular.dart';
import 'package:flutter/material.dart';
import 'package:movie_finder_app/listmovie.dart';

import 'detailproduc.dart';

class ListHeard extends StatefulWidget {
  final Movies? movie;

  const ListHeard({super.key, required this.movie});

  @override
  State<ListHeard> createState() => _ListHeardState();
}

class _ListHeardState extends State<ListHeard> {
  bool isLoagding = false;
  final baseUrl = "https://image.tmdb.org/t/p/original";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final itemCount = widget.movie?.results?.length ?? 0;
    if (itemCount > 0) {
      return Container(
          height: 180,
          child: Swiper(
              pagination: SwiperPagination(builder: SwiperCustomPagination(
                builder: (context, config) {
                  return Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                          List<Widget>.generate(config.itemCount, (int index) {
                        final isActive = index == config.activeIndex;
                        return Container(
                          width: isActive ? 10.0 : 9.0,
                          height: 10.0,
                          margin: const EdgeInsets.symmetric(horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isActive
                                ? const Color.fromRGBO(100, 171, 219, 1)
                                : Color.fromRGBO(130, 110, 200, 1),
                          ),
                        );
                      }),
                    ),
                  );
                },
              )),
              viewportFraction: 0.7,
              scale: 0.8,
              fade: 0.2,
              scrollDirection: Axis.horizontal,
              itemCount: itemCount > 5 ? 5 : itemCount,
              outer: true,
              itemBuilder: (context, index) {
                final item = widget.movie?.results?[index];
                final image = '$baseUrl${item?.backdropPath}';
                print(image);
                return GestureDetector(
                  onTap: () {
                    String? id = widget.movie?.results?[index].id.toString();
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return DetailProduct(id: id ?? '');
                      },
                    ));
                  },
                  child: Container(
                      height: double.infinity,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: NetworkImage(image),
                            fit: BoxFit.cover,
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 170,
                                child: Text(
                                  item?.originalTitle ?? '',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Colors.amber),
                                child: Row(
                                  children: [
                                    Text(
                                      'IMBd ${item?.voteAverage?.toString()}',
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                );
              }));
    }
    else {
      //return Container();
       return CircularViewer(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(-10, -10),
                  color: Colors.white,
                  blurRadius: 20,
                  spreadRadius: 1),
              BoxShadow(
                  offset: Offset(10, 10),
                  color: Color.fromARGB(255, 158, 158, 158),
                  blurRadius: 20,
                  spreadRadius: 1)
            ]),
        value: 100,
        maxValue: 100,
        radius: 100,
        textStyle: const TextStyle(fontSize: 30),
        color: const Color(0xffEEEEEE),
        sliderColor: const Color(0xff62CBDA),
        unSelectedColor: const Color(0xffD7DEE7),
      );
    }
  }
}
