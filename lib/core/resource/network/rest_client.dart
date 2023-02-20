import 'package:dio/dio.dart';
import 'package:flutter_base/features/movie/model/detail_movie_model.dart';
import 'package:flutter_base/features/movie/model/movie_model.dart';
import 'package:flutter_base/features/movie/model/review_model_response.dart';
import 'package:flutter_base/features/tv/model/tv_detail_model.dart';
import 'package:flutter_base/features/tv/model/tv_model.dart';
import 'package:flutter_base/features/tv/model/tv_reviews_response.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('3/movie/{type}')
  Future<MovieModelResponse> getMovieNowPlaying(@Query('api_key') String apiKey, @Path() String type);

  @GET('3/movie/{movie_id}')
  Future<DetailMovieResponse> getMovieDetail(@Query('api_key') String apiKey, @Path() int movie_id);

  @GET('3/movie/{movie_id}/reviews')
  Future<ReviewModelResponse> getReviewMovieDetail(@Query('api_key') String apiKey, @Path() int movie_id);

  @GET('3/tv/{type}')
  Future<TvModelResponse> getTv(@Query('api_key') String apiKey, @Path() String type);

   @GET('3/tv/{tv_id}')
  Future<TvDetailModelResponse> getTvDetail(@Query('api_key') String apiKey, @Path() int tv_id);
  
   @GET('3/tv/{tv_id}/reviews')
  Future<TvReviewsResponse> getReviewTvDetail(@Query('api_key') String apiKey, @Path() int tv_id);

}
