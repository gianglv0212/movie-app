import 'package:flutter/material.dart';
import 'package:movie_finder_app/modal.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _Category();
}

class _Category extends State<Categories> {
  late PageController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20),
        height: 125,
        width: double.infinity,
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 42),
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 0,
            );
          },
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          itemCount: category.length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 95,
                  width: 69,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(category[index].imageCategory ?? ''),
                        fit: BoxFit.cover,
                        height: 31,
                        width: 31,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          category[index].nameCategory ?? '',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ));
  }
}
