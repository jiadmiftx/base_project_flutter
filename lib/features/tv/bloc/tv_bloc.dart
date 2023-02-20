import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_base/core/resource/repositories/repository.dart';
import 'package:flutter_base/features/tv/model/tv_detail_model.dart';
import 'package:flutter_base/features/tv/model/tv_model.dart';
import 'package:flutter_base/features/tv/model/tv_reviews_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tv_event.dart';
part 'tv_state.dart';

class TvBloc extends Bloc<TvEvent, TvState> {
  final Repository _repository;

  TvBloc(this._repository) : super(const TvState()) {
    on<DataTvEvent>(_doFetchTvPlayingNow);
    on<DataDetailTvEvent>(_doFetchDetailTv);
    on<ReviewDetailTvEvent>(_doFetchReviewDetailTv);
  }

  final String apikey = '95b7396aabdb0e2e958fb2e93367c322';

  Future<void> _doFetchTvPlayingNow(DataTvEvent event, Emitter<TvState> emit) async {
    try {
      emit(state.copyWith(isloading: true));
      if (event.type == 'on_the_air') {
        final data = await _repository.getTv(apikey: apikey, type: event.type);
        emit(state.copyWith(tvModelResponse: data));
      } else if (event.type == 'top_rated') {
        final data = await _repository.getTv(apikey: apikey, type: event.type);
        emit(state.copyWith(tvOnAirResponse: data));
      }
      emit(state.copyWith(isloading: false));
    } catch (e) {
      emit(state.copyWith(isloading: false, errorMessage: e.toString()));
    }
  }

  Future<void> _doFetchDetailTv(DataDetailTvEvent event, Emitter<TvState> emit) async {
    try {
      emit(state.copyWith(isloading: true));
      final data = await _repository.getTvDetail(apikey: apikey, tv_id: event.tvid);
      emit(state.copyWith(isloading: false, tvDetailModelResponse: data));
    } catch (e) {
      emit(state.copyWith(isloading: false, errorMessage: e.toString()));
    }
  }

  Future<void> _doFetchReviewDetailTv(ReviewDetailTvEvent event, Emitter<TvState> emit) async {
    try {
      emit(state.copyWith(isloading: true));
      final data = await _repository.getReviewTvDetail(apikey: apikey, tv_id: event.tvid);
      log('Data bloc review ${data.toJson()}');
      emit(state.copyWith(isloading: false, tvReviewsResponse: data));
    } catch (e) {
      emit(state.copyWith(isloading: false, errorMessage: e.toString()));
    }
  }
}
