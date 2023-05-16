import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/providers.dart';

class Search extends ConsumerWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          backgroundColor: Colors.transparent,
          flexibleSpace: SizedBox(
            height: 100,
            width: 300,
            // color: Colors.white10,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Movies,Tv shows and Other.',
                    hintStyle: TextStyle(color: Colors.grey),
                    // enabled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    // fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: ListTile(
            title: Text(
              'Recommened to Watch',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 290,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: ref.watch(seriesprovider).length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child: Image.asset(
                          ref.watch(seriesprovider)[index].image,
                          fit: BoxFit.fill,
                        ),
                        width: 200,
                        height: 260,
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: Center(
                        child: Text(ref.watch(seriesprovider)[index].name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 30,
            child: Text(
              'Catogeries',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        // SliverToBoxAdapter(
        //   child: ListView.builder(
        //     itemCount: ref.watch(categoryProvider).length,
        //     itemBuilder: (context, index) {
        //       return ElevatedButton(
        //           onPressed: () {},
        //           child: Text(ref.watch(categoryProvider)[index].buttonName));
        //     },
        //   ),
        // )
      ]),
    );
  }
}
