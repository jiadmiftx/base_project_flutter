import 'package:dio/dio.dart';
import 'package:flutter_base/features/movie/model/detail_movie_model.dart';
import 'package:flutter_base/features/movie/model/movie_model.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('3/movie/now_playing')
  Future<MovieModelResponse> getMovieNowPlaying(@Query('api_key') String apiKey);

  @GET('3/movie/{movie_id}')
  Future<DetailMovieResponse> getMovieDetailNowPlaying(@Query('api_key') String apiKey, @Path() int movie_id);

  @GET('3/movie/{movie_id}/reviews')
  Future<DetailMovieResponse> getReviewMovieDetail(@Query('api_key') String apiKey, @Path() int movie_id);
  
}
