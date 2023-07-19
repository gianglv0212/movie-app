import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _Search();
}

class _Search extends State<Search> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          //     gradient: LinearGradient(
          //   colors: [Color(0xFF2E5676), Color(0xFF4B4576)],
          //   begin: Alignment.bottomLeft,
          //   end: Alignment.bottomRight,
          // )
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 20, left: 20, top: 50, bottom: 20),
            child: Row(children: [
              Text(
                'Hello, Jane!',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              Spacer(),
              Icon(
                Icons.notifications_none,
                size: 20,
                color: Colors.white,
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              style: TextStyle(color: Colors.white),
              controller: _controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white.withOpacity(0.1),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                hintText: 'Search',
                hintStyle: const TextStyle(color: Colors.white54),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),

                suffixIcon: const Icon(
                  Icons.mic_none,
                  color: Colors.white54,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white)),
                // labelText: 'Search',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Most Popular',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
