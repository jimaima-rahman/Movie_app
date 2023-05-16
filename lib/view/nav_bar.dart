import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/provider/providers.dart';
import 'package:movie/view/search/search.dart';
import 'package:movie/view/series/series.dart';

import 'home/home.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: BottomNavigationBar(
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white60,
              currentIndex: ref.watch(movieProvider),
              onTap: (value) {
                ref.read(movieProvider.notifier).state = value;
                ref.read(indexprovider.notifier).state.animateToPage(value,
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeIn);
              },
              backgroundColor: Color.fromARGB(133, 0, 0, 0),
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.movie,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.search,
                    ),
                    label: '')
              ],
            ),
          )),
      body: PageView(
        controller: ref.watch(indexprovider),
        onPageChanged: (value) {
          ref.read(movieProvider.notifier).state = value;
        },
        scrollDirection: Axis.horizontal,
        children: [
          Home(),
          Series(),
          SingleChildScrollView(
            child: Container(
              color: Colors.black,
              height: 1000,
              width: double.infinity,
            ),
          ),
          Search()
        ],
      ),
    );
  }
}
