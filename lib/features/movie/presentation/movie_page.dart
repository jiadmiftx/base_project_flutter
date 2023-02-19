import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/core/core.dart';
import 'package:flutter_base/core/resource/injector/injection_container.dart';
import 'package:flutter_base/core/utils/extensions/widget_util.dart';
import 'package:flutter_base/features/movie/bloc/movie_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    sl<MovieBloc>().add(DataMovieEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieBloc, MovieState>(
      listener: (context, state) {},
      builder: (BuildContext context, MovieState state) {
        return Loadable(
          appBar: AppBar(
            title: Text("Movie Time!"),
          ),
          child: SafeArea(
            child: RefreshIndicator(
              onRefresh: () async {
                // await remoteconfigInstance.fetchAndActivate();
                // sl<ProfileBloc>().add(DataProfileUserEvent(isNeedUpdate: true));
                // sl<ProfileMemberBloc>().add(DataMembersEvent(isNeedUpdate: true));
                setState(() {});
              },
              child: SingleChildScrollView(
                child: LeftAlignedColumn(
                  children: [
                    Text18BlackBold("Now Playing Movies").padded(12),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2.8,
                      child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: state.movieModelResponse?.results?.length,
                          itemBuilder: (context, index) {
                            var data = state.movieModelResponse?.results?[index];
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
                                                    placeholder: 'assets/movie.gif',
                                                    image: 'https://image.tmdb.org/t/p/w500${data?.posterPath}',
                                                    fit: BoxFit.cover,
                                                    placeholderFit: BoxFit.cover,
                                                    alignment: Alignment.center,
                                                  ).bottomPadded(4),
                                                  Text12Black87Bold(
                                                    "${data?.title ?? ""}",
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
                                                child: Center(child: Text11BlackF45Medium("${data?.voteAverage ?? "0.0"}")),
                                              ).padded8()
                                            ],
                                          )),
                                          Text12GreyDefaultRegular(
                                            "${data?.releaseDate ?? ""}",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ).horizontalPadded(2).bottomPadded(4)
                                        ],
                                      ),
                              ).padded(12),
                            );
                          }),
                    )
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

  Container _placeholder() {
    return Container(
      padding: EdgeInsets.all(4),
      height: 50,
      width: 50,
      child: Icon(
        Icons.slow_motion_video_rounded,
        size: 40,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: BaseColor.colorDivider,
      ),
    );
  }
}
