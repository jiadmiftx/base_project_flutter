import 'package:flutter_base/core/resource/network/rest_client.dart';
import 'package:flutter_base/core/resource/repositories/repository_interface.dart';
import 'package:dio/dio.dart';
import 'package:flutter_base/features/movie/model/detail_movie_model.dart';
import 'package:flutter_base/features/movie/model/movie_model.dart';
import 'package:flutter_base/features/movie/model/review_model_response.dart';
import 'package:flutter_base/features/tv/model/tv_detail_model.dart';
import 'package:flutter_base/features/tv/model/tv_model.dart';
import 'package:flutter_base/features/tv/model/tv_reviews_response.dart';

class Repository implements RepositoryInterface {
  final RestClient _rest;
  const Repository(this._rest);

  @override
  Future<MovieModelResponse> getMovie({required String apikey, required String type}) async {
    try {
      final _response = await _rest.getMovieNowPlaying(apikey, type);
      return _response;
    } on DioError catch (e) {
      return MovieModelResponse();
    } catch (e) {
      return MovieModelResponse();
    }
  }

  @override
  Future<DetailMovieResponse> getMovieDetail({required String apikey, required int movie_id}) async {
    try {
      final _response = await _rest.getMovieDetail(apikey, movie_id);
      return _response;
    } on DioError catch (e) {
      return DetailMovieResponse();
    } catch (e) {
      return DetailMovieResponse();
    }
  }

  @override
  Future<ReviewModelResponse> getReviewMovieDetail({required String apikey, required int movie_id}) async {
    try {
      final _response = await _rest.getReviewMovieDetail(apikey, movie_id);
      return _response;
    } on DioError catch (e) {
      return ReviewModelResponse();
    } catch (e) {
      return ReviewModelResponse();
    }
  }
  
  @override
  Future<TvModelResponse> getTv({required String apikey, required String type}) async {
   try {
      final _response = await _rest.getTv(apikey, type);
      return _response;
    } on DioError catch (e) {
      return TvModelResponse();
    } catch (e) {
      return TvModelResponse();
    }
  }
  
  @override
  Future<TvDetailModelResponse> getTvDetail({required String apikey, required int tv_id}) async {
     try {
      final _response = await _rest.getTvDetail(apikey, tv_id);
      return _response;
    } on DioError catch (e) {
      return TvDetailModelResponse();
    } catch (e) {
      return TvDetailModelResponse();
    }
  }

  @override
  Future<TvReviewsResponse> getReviewTvDetail({required String apikey, required int tv_id}) async {
    try {
      final _response = await _rest.getReviewTvDetail(apikey, tv_id);
      return _response;
    } on DioError catch (e) {
      return TvReviewsResponse();
    } catch (e) {
      return TvReviewsResponse();
    }
  }
}