import 'package:flutter_base/features/movie/model/detail_movie_model.dart';
import 'package:flutter_base/features/movie/model/movie_model.dart';
import 'package:flutter_base/features/movie/model/review_model_response.dart';
import 'package:flutter_base/features/tv/model/tv_detail_model.dart';
import 'package:flutter_base/features/tv/model/tv_model.dart';
import 'package:flutter_base/features/tv/model/tv_reviews_response.dart';

abstract class RepositoryInterface {
  Future<MovieModelResponse> getMovie({required String apikey, required String type});
  Future<DetailMovieResponse> getMovieDetail({required String apikey, required int movie_id});
  Future<ReviewModelResponse> getReviewMovieDetail({required String apikey, required int movie_id});
  Future<TvModelResponse> getTv({required String apikey, required String type});
  Future<TvDetailModelResponse> getTvDetail({required String apikey, required int tv_id});
  Future<TvReviewsResponse> getReviewTvDetail({required String apikey, required int tv_id});
}
