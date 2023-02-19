import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_base/core/resource/repositories/repository.dart';
import 'package:flutter_base/features/movie/model/detail_movie_model.dart';
import 'package:flutter_base/features/movie/model/movie_model.dart';
import 'package:flutter_base/features/movie/model/review_model_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final Repository _repository;

  MovieBloc(this._repository) : super(const MovieState()) {
    on<DataMovieEvent>(_doFetchMoviePlayingNow);
    on<DataDetailMovieEvent>(_doFetchDetailMoviePlayingNow);
    on<ReviewDetailMovieEvent>(_doFetchReviewDetailMovie);
  }

  final String apikey = '95b7396aabdb0e2e958fb2e93367c322';

  Future<void> _doFetchMoviePlayingNow(DataMovieEvent event, Emitter<MovieState> emit) async {
    try {
      emit(state.copyWith(isloading: true));
      final data = await _repository.getMovieNowPlaying(apikey: apikey);
      log('Data bloc ${data.toJson()}');
      emit(state.copyWith(isloading: false, movieModelResponse: data));
    } catch (e) {
      emit(state.copyWith(isloading: false, errorMessage: e.toString()));
    }
  }

  Future<void> _doFetchDetailMoviePlayingNow(DataDetailMovieEvent event, Emitter<MovieState> emit) async {
    try {
      emit(state.copyWith(isloading: true));
      final data = await _repository.getMovieDetailNowPlaying(apikey: apikey, movie_id: event.movieid);
      log('Data bloc ${data.toJson()}');
      emit(state.copyWith(isloading: false, detailMovieResponse: data));
    } catch (e) {
      emit(state.copyWith(isloading: false, errorMessage: e.toString()));
    }
  }

  Future<void> _doFetchReviewDetailMovie(ReviewDetailMovieEvent event, Emitter<MovieState> emit) async {
    try {
      emit(state.copyWith(isloading: true));
      final data = await _repository.getReviewMovieDetail(apikey: apikey, movie_id: event.movieid);
      log('Data bloc ${data.toJson()}');
      emit(state.copyWith(isloading: false, reviewModelResponse: data));
    } catch (e) {
      emit(state.copyWith(isloading: false, errorMessage: e.toString()));
    }
  }
}
