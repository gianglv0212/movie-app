import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import 'detailproduc.dart';
import 'listmovie.dart';

class ProduceMovie extends StatefulWidget {
  final Movies? movie;

  const ProduceMovie({
    super.key,
    this.movie,
  });

  @override
  State<ProduceMovie> createState() => _ProduceMovieState();
}

class _ProduceMovieState extends State<ProduceMovie> {
  final baseUrl = "https://image.tmdb.org/t/p/original";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final itemCount = widget.movie?.results?.length ?? 0;
    if (itemCount > 0) {
      return Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Upcoming releases',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: Swiper(
                indicatorLayout: PageIndicatorLayout.COLOR,
                pagination: SwiperPagination(builder: SwiperCustomPagination(
                  builder: (context, config) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List<Widget>.generate(config.itemCount,
                          (int index) {
                        final isActive = index == config.activeIndex;
                        return Container(
                          width: isActive ? 10.0 : 10.0,
                          height: 10.0,
                          margin: const EdgeInsets.symmetric(horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isActive
                                ? const Color.fromRGBO(100, 171, 219, 1)
                                : const Color.fromRGBO(130, 110, 200, 1),
                          ),
                        );
                      }),
                    );
                  },
                )),
                viewportFraction: 0.5,
                scale: 1,
                fade: 0.5,
                outer: true,
                scrollDirection: Axis.horizontal,
                itemCount: itemCount > 5 ? 5 : itemCount,
                itemBuilder: (context, index) {
                  final item = widget.movie?.results?[index];
                  final image = '$baseUrl${item?.posterPath}';
                  return GestureDetector(
                    onTap: () {
                      String? id = widget.movie?.results?[index].id.toString();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => DetailProduct(id: id ?? "")));
                    },
                    child: Container(
                      width: 145,
                      height: 215,
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.network(
                          image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      );
    } else {
      return const Column();
    }
  }
}
