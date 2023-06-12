import 'package:flutter/material.dart';
import 'package:spotify_clone/pages/home_page.dart';
import 'package:spotify_clone/theme/colors.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: const [
        HomePage(),
        Center(
          child: Text(
            "Library",
            style: TextStyle(
              fontSize: 20,
              color: white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Center(
          child: Text(
            "Search",
            style: TextStyle(
              fontSize: 20,
              color: white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Center(
          child: Text(
            "Settings",
            style: TextStyle(
              fontSize: 20,
              color: white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget getFooter() {
    List items = [
      Icons.home,
      Icons.library_music,
      Icons.search,
      Icons.settings,
    ];
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: black,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            items.length,
            (index) => IconButton(
              splashRadius: 1,
              onPressed: () {
                setState(() {
                  activeTab = index;
                });
              },
              icon: Icon(
                items[index],
                color: activeTab == index ? primary : white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
