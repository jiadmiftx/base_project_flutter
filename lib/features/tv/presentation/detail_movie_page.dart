import 'package:flutter/material.dart';
import 'package:flutter_base/core/core.dart';
import 'package:flutter_base/core/resource/injector/injection_container.dart';
import 'package:flutter_base/core/utils/extensions/widget_util.dart';
import 'package:flutter_base/features/tv/bloc/tv_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailTvPage extends StatefulWidget {
  final int tvid;

  const DetailTvPage({super.key, required this.tvid});

  @override
  State<DetailTvPage> createState() => _DetailTvPageState();
}

class _DetailTvPageState extends State<DetailTvPage> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    sl<TvBloc>().add(DataDetailTvEvent(tvid: widget.tvid));
    sl<TvBloc>().add(ReviewDetailTvEvent(tvid: widget.tvid));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TvBloc, TvState>(
      listener: (context, state) {},
      builder: (BuildContext context, TvState state) {
        var data = state.tvDetailModelResponse;
        return Loadable(
          appBar: AppBar(
            title: Text("${state.tvDetailModelResponse?.name}"),
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
                    Text14BlackRegular("${data?.name}").padded(12),
                    Text18BlackBold("Overview").padded(12),
                    Text14BlackRegular("${data?.overview}").padded(12),
                    Divider(),
                    state.tvReviewsResponse?.totalResults == 0 ? Text18BlackBold("No Review").padded(12) : Text18BlackBold("Reviews").padded(12),
                    state.tvReviewsResponse?.totalResults != null
                        ? Container(
                            height: MediaQuery.of(context).size.height / 2,
                            child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: state.tvReviewsResponse!.results!.length > 3 ? 3 : state.tvReviewsResponse?.results?.length,
                                itemBuilder: (context, index) {
                                  var reviewer = state.tvReviewsResponse?.results;
                                  return Card(
                                      child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(25),
                                          child: Image.network(
                                            'https://image.tmdb.org/t/p/w500${reviewer?[index].authorDetails?.avatarPath}',
                                          ),
                                        ),
                                      ).padded(6),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text12Black87Bold("${reviewer?[index].author ?? "Reviewer"}"),
                                            Text("${reviewer?[index].content ?? "....."}", maxLines: 5, overflow: TextOverflow.ellipsis),
                                          ],
                                        ),
                                      )
                                    ],
                                  ).padded(8));
                                }),
                          )
                        : Center(child: Text("Empty Review")).bottomPadded20()
                    // Text14BlackRegular("${data?}").padded(12),
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
