import 'package:flutter/material.dart';
import 'package:flutter_base/core/core.dart';
import 'package:flutter_base/core/resource/injector/injection_container.dart';
import 'package:flutter_base/core/utils/extensions/widget_util.dart';
import 'package:flutter_base/features/movie/bloc/movie_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailMoviePage extends StatefulWidget {
  final int movieid;

  const DetailMoviePage({super.key, required this.movieid});

  @override
  State<DetailMoviePage> createState() => _DetailMoviePageState();
}

class _DetailMoviePageState extends State<DetailMoviePage> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    sl<MovieBloc>().add(DataDetailMovieEvent(movieid: widget.movieid));
    sl<MovieBloc>().add(ReviewDetailMovieEvent(movieid: widget.movieid));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieBloc, MovieState>(
      listener: (context, state) {},
      builder: (BuildContext context, MovieState state) {
        var data = state.detailMovieResponse;
        return Loadable(
          appBar: AppBar(
            title: Text("${state.detailMovieResponse?.title}"),
          ),
          child: SafeArea(
            child: RefreshIndicator(
              onRefresh: () async {
                setState(() {});
              },
              child: SingleChildScrollView(
                child: LeftAlignedColumn(
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Colors.black.withOpacity(0.15),
                            spreadRadius: 0,
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: ClipRRect(
                          child: Stack(
                        children: [
                          Center(
                              child: FadeInImage.assetNetwork(
                            placeholder: 'assets/movie.gif',
                            image: 'https://image.tmdb.org/t/p/w500${data?.posterPath}',
                            fit: BoxFit.cover,
                            placeholderFit: BoxFit.cover,
                            alignment: Alignment.center,
                          )),
                          Container(
                            width: 50,
                            height: 50,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Colors.black.withOpacity(0.15),
                                  spreadRadius: 0,
                                ),
                              ],
                              color: Colors.yellow,
                            ),
                            child: Center(child: Text14BlackBold("${data?.voteAverage ?? "0.0"}")),
                          ).padded8()
                        ],
                      )),
                    ).padded16(),
                    Text14BlackRegular("${data?.title}").padded(12),
                    Text18BlackBold("Overview").padded(12),
                    Text14BlackRegular("${data?.overview}").padded(12),
                    Divider(),
                    Text18BlackBold("Reviews").padded(12),
                    state.reviewModelResponse?.totalResults != null ?
                    Container(
                      height: MediaQuery.of(context).size.height / 2,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.reviewModelResponse!.results!.length > 3 ? 3 : state.reviewModelResponse?.results?.length,
                        itemBuilder: (context, index) {
                          var reviewer = state.reviewModelResponse?.results;
                          return Card(
                            child: Text12BlackRegular("${reviewer?[index].author ?? "Reviewer"}"),
                          );
                        }),
                    ) : Center(child: Text("Empty Review")).bottomPadded20()
                    // Text14BlackRegular("${data?}").padded(12),
                  ],
                ),
              ),
            ),
          ),
          loading: state.isloading,
          isUsingGradient: false,
        );
      },
    );
  }
}
