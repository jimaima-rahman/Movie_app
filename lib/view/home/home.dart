import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/models/Movie_model.dart';
import 'package:movie/models/home_models/trending_movie.dart';

import '../../controller/home_controller.dart';
import '../../models/home_models/AlsoLiked.dart';
import '../../models/home_models/popular.dart';
import '../../provider/providers.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  // late PageController smoothpageincatorController;
  // @override
  // void initState() {
  //   super.initState();
  //   smoothpageincatorController = PageController();
  // }

  String imageBaseurl = 'https://image.tmdb.org/t/p';

  @override
  Widget build(BuildContext context) {
    // List<MoViModel> recommentedMovie = ref.watch(recommentedProvider);
    var alsoLiked = ref.watch(alsoLikedProvider);
    var trendingmovies = ref.watch(apiFutureProvider);
    var popularmovies = ref.watch(popularprovider);
    return Scaffold(
      backgroundColor: Colors.black,
      body: trendingmovies.when(
        data: (data) =>
            buildBody(context, ref, data!, alsoLiked, popularmovies),
        error: (error, stackTrace) => Center(
          child: Text(error.toString()),
        ),
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  CustomScrollView buildBody(
      BuildContext context,
      // List<MoViModel> recommentedMovie,
      WidgetRef ref,
      TrendingMovies data,
      AsyncValue<AlsoLikedMovies?> alsoLiked,
      AsyncValue<PopularMovies?> popularmovies) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.transparent,
          expandedHeight: MediaQuery.of(context).size.height * 0.5,
          flexibleSpace: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CarouselSlider.builder(
                itemCount: data.results.length,
                options: CarouselOptions(
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlay: true,
                  viewportFraction: 1,
                  height: MediaQuery.of(context).size.height * 0.5,
                  onPageChanged: (index, reason) {
                    // ref.read(homeCarouselIndexProvider.notifier).state = index;
                    // smoothpageincatorController.animateToPage(
                    //   index,
                    //   duration: const Duration(milliseconds: 500),
                    //   curve: Curves.easeIn,
                    // );
                  },
                ),
                itemBuilder: (context, index, realIndex) => FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      ShaderMask(
                        shaderCallback: (Rect bounds) => LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.6, 1],
                          colors: [
                            Colors.transparent,
                            Colors.black,
                          ],
                        ).createShader(bounds),
                        blendMode: BlendMode.srcATop,
                        child: Image.network(
                          '$imageBaseurl/w780${data.results[index].backdropPath}',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        left: 20,
                        right: 20,
                        bottom: 20,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              data.results[index].title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                data.results[index].overview,
                                textAlign: TextAlign.center,
                                maxLines: 3,
                                overflow: TextOverflow.fade,
                                style: TextStyle(
                                  // overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromARGB(210, 255, 255, 255),
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SmoothPageIndicator(
                    //   controller: smoothpageincatorController,
                    //   count: 2,
                    //   onDotClicked: (index) {
                    //     smoothpageincatorController.animateToPage(
                    //       index,
                    //       duration: Duration(milliseconds: 100),
                    //       curve: Curves.easeIn,
                    //     );
                    //   },
                    //   axisDirection: Axis.horizontal,
                    //   effect: ScrollingDotsEffect(
                    //     dotColor: Color(0x55FFFFFF),
                    //     activeDotColor: Colors.white,
                    //     activeDotScale: 1.1,
                    //     dotHeight: 6,
                    //     dotWidth: 6,
                    //   ),
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              ListTile(
                title: Text(
                  'You might also like',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                subtitle: Text(
                  'updated after each viewing and rating',
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    )),
              ),
              alsoLiked.when(
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
                                  borderRadius: BorderRadius.circular(20)),
                              child: Image.network(
                                '$imageBaseurl/w500${data.results[index].posterPath}',
                                fit: BoxFit.fill,
                              ),
                              width: 150,
                              height: 200,
                            ),
                          ),
                          Center(
                              child: Text(
                            data.results[index].voteAverage.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ))
                        ],
                      );
                    },
                  ),
                ),
                error: (error, stackTrace) => Center(
                  child: Text(error.toString()),
                ),
                loading: () => Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              ListTile(
                title: Text(
                  'Most Popular movies',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    )),
              ),
              popularmovies.when(
                data: (data) => SizedBox(
                  height: 280,
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
                              child: Image.network(
                                '$imageBaseurl/w500${data.results[index].posterPath}',
                                fit: BoxFit.fill,
                              ),
                              width: 200,
                              height: 200,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(data.results[index].originalTitle,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                )),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                error: (error, stackTrace) => Center(
                  child: Text(error.toString()),
                ),
                loading: () => Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
