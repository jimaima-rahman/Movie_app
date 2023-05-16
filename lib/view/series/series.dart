import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/models/series_models/series_popular.dart';
import 'package:movie/models/series_models/series_top_rated.dart';

import '../../models/series_models/series_trending.dart';
import '../../provider/providers.dart';

class Series extends ConsumerWidget {
  Series({super.key});

  String imageBaseurl = 'https://image.tmdb.org/t/p';
  @override // SizedBox(
  //   width: 150,
  //   child: Center(
  //     child: Text(data.results[index].originalName,
  //         textAlign: TextAlign.center,
  //         style: const TextStyle(
  //           fontSize: 20,
  //           fontWeight: FontWeight.w500,
  //           color: Colors.white,
  //         )),
  //   ),
  // ),
  Widget build(BuildContext context, WidgetRef ref) {
    var seriespopular = ref.watch(seriespopularprovider);
    var seriestrending = ref.watch(seriestrendingprovider);
    var seriestoprated = ref.watch(Seriestopprovider);
    return Scaffold(
        backgroundColor: Colors.black,
        body: bodymethod(
          seriespopular,
          seriestrending,
          seriestoprated,
          context,
          ref,
        ));
  }

  CustomScrollView bodymethod(
      AsyncValue<SeriesPopular?> seriespopular,
      AsyncValue<SeriesTrending?> seriestrending,
      AsyncValue<Seriestoprated?> seriestoprated,
      BuildContext context,
      WidgetRef ref) {
    return CustomScrollView(slivers: [
      const SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.only(top: 30, bottom: 15),
          child: Text(
            'Series to watch',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      SliverToBoxAdapter(
          child: seriespopular.when(
              data: (data) => SizedBox(
                    height: 240,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: data!.results.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15)),
                                child: Image.network(
                                  '$imageBaseurl/w780${data.results[index].posterPath}',
                                  fit: BoxFit.cover,
                                ),
                                width: 200,
                                height: 200,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
              error: (error, stackTrace) => Center(
                    child: Text(error.toString()),
                  ),
              loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ))),
      const SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: Text(
            'Trending Now',
            style: TextStyle(
                color: Colors.white60,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      SliverAppBar(
          backgroundColor: Colors.transparent,
          collapsedHeight: kToolbarHeight + kToolbarHeight,
          expandedHeight: MediaQuery.of(context).size.height * 0.30,
          elevation: 0,
          flexibleSpace: seriestrending.when(
              data: (data) => PageView.builder(
                    itemCount: data!.results.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        width: 200,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: data.results[index].backdropPath == null
                              ? Container(
                                  color: Colors.tealAccent,
                                  child: Center(
                                      child: Text(
                                    'No image provided for \n${data.results[index].name}',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 20),
                                  )),
                                )
                              : Image.network(
                                  '$imageBaseurl/w780${data.results[index].backdropPath}',
                                  fit: BoxFit.cover,
                                ),
                        ),
                      );
                      // SizedBox(
                      //   width: 150,
                      //   child: Center(
                      //     child: Text(data.results[index].originalName,
                      //         textAlign: TextAlign.center,
                      //         style: const TextStyle(
                      //           fontSize: 20,
                      //           fontWeight: FontWeight.w500,
                      //           color: Colors.white,
                      //         )),
                      //   ),
                      // );
                    },
                  ),
              error: (error, stackTrace) => Center(
                    child: Text(error.toString()),
                  ),
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              })),
      SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text('Top Rated',
                style: TextStyle(
                    color: Colors.white60,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 10,
            ),
            seriestoprated.when(
                data: (data) => SizedBox(
                      height: 240,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: data!.results.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15)),
                                  width: 150,
                                  height: 200,
                                  child: Image.network(
                                    '$imageBaseurl/w780${data.results[index].posterPath}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                error: (error, stackTrace) => Center(
                      child: Text(error.toString()),
                    ),
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                })
          ],
        ),
      )
    ]);
  }
}
