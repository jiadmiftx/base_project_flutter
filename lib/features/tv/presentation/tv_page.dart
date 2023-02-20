import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/core/core.dart';
import 'package:flutter_base/core/resource/injector/injection_container.dart';
import 'package:flutter_base/core/utils/extensions/widget_util.dart';
import 'package:flutter_base/features/tv/bloc/tv_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TvPage extends StatefulWidget {
  const TvPage({super.key});

  @override
  State<TvPage> createState() => _TvPageState();
}

class _TvPageState extends State<TvPage> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    sl<TvBloc>().add(DataTvEvent(type: 'on_the_air'));
    sl<TvBloc>().add(DataTvEvent(type: 'top_rated'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TvBloc, TvState>(
      listener: (context, state) {},
      builder: (BuildContext context, TvState state) {
        return Loadable(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.black,
            title: Text16WhiteBold("Television"),
          ),
          child: SafeArea(
            child: RefreshIndicator(
              onRefresh: () async {
                sl<TvBloc>().add(DataTvEvent(type: 'on_the_air'));
                sl<TvBloc>().add(DataTvEvent(type: 'popular'));
                setState(() {});
              },
              child: SingleChildScrollView(
                child: LeftAlignedColumn(
                  children: [
                    Text18BlackBold("On the Air!").padded(12),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2.8,
                      child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: state.tvOnAirResponse?.results?.length,
                          itemBuilder: (context, index) {
                            var data = state.tvOnAirResponse?.results?[index];
                            return InkWell(
                              onTap: () {
                                if (data?.id != null) {
                                  context.router.push(DetailMovieRoute(movieid: data!.id!));
                                }
                              },
                              child: Container(
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
                                width: MediaQuery.of(context).size.width / 3,
                                child: data == null
                                    ? Center(
                                        child: Image.asset('assets/movie.gif'),
                                      )
                                    : Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          ClipRRect(
                                              child: Stack(
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  FadeInImage.assetNetwork(
                                                    placeholderCacheHeight: 500,
                                                    placeholder: 'assets/movie.gif',
                                                    image: 'https://image.tmdb.org/t/p/w500${data?.posterPath}',
                                                    fit: BoxFit.cover,
                                                    placeholderFit: BoxFit.cover,
                                                    alignment: Alignment.center,
                                                  ).bottomPadded(4),
                                                  Text12Black87Bold(
                                                    "${data.name ?? "..."}",
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                  ).horizontalPadded(4),
                                                ],
                                              ),
                                              Container(
                                                width: 30,
                                                height: 30,
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
                                                child: Center(child: Text11BlackF45Medium("${data.voteAverage ?? "0.0"}")),
                                              ).padded8()
                                            ],
                                          )),
                                          Text12GreyDefaultRegular(
                                            "${data.firstAirDate ?? ""}",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ).horizontalPadded(2).bottomPadded(4)
                                        ],
                                      ),
                              ).padded(12),
                            );
                          }),
                    ),
                    Text18BlackBold("Popular Film!").padded(12),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2.8,
                      child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: state.tvModelResponse?.results?.length,
                          itemBuilder: (context, index) {
                            var data = state.tvModelResponse?.results?[index];
                            return InkWell(
                              onTap: () {
                                if (data?.id != null) {
                                  context.router.push(DetailTvRoute(tvid: data!.id!));
                                }
                              },
                              child: Container(
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
                                width: MediaQuery.of(context).size.width / 3,
                                child: data == null
                                    ? Center(
                                        child: Image.asset('assets/movie.gif'),
                                      )
                                    : Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          ClipRRect(
                                              child: Stack(
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  FadeInImage.assetNetwork(
                                                    placeholder: 'assets/movie.gif',
                                                    image: 'https://image.tmdb.org/t/p/w500${data?.posterPath}',
                                                    fit: BoxFit.cover,
                                                    placeholderFit: BoxFit.cover,
                                                    alignment: Alignment.center,
                                                  ).bottomPadded(4),
                                                  Text12Black87Bold(
                                                    "${data.name ?? ""}",
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                  ).horizontalPadded(4),
                                                ],
                                              ),
                                              Container(
                                                width: 30,
                                                height: 30,
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
                                                child: Center(child: Text11BlackF45Medium("${data.voteAverage ?? "0.0"}")),
                                              ).padded8()
                                            ],
                                          )),
                                          Text12GreyDefaultRegular(
                                            "${data.firstAirDate ?? ""}",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ).horizontalPadded(2).bottomPadded(4)
                                        ],
                                      ),
                              ).padded(12),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
          loading: state.isloading,
        );
      },
    );
  }
}
