part of 'tv_bloc.dart';

class TvState extends Equatable {
  final TvModelResponse? tvModelResponse;
  final TvModelResponse? tvOnAirResponse;
  final TvDetailModelResponse? tvDetailModelResponse;
  final TvReviewsResponse? tvReviewsResponse;
  final bool isloading;
  final String errorMessage;

  const TvState({
    this.tvModelResponse,
    this.tvOnAirResponse,
    this.tvDetailModelResponse,
    this.tvReviewsResponse,
    this.isloading = false,
    this.errorMessage = '',
  });

  TvState copyWith({
    TvModelResponse? tvModelResponse,
    TvModelResponse? tvOnAirResponse,
    TvDetailModelResponse? tvDetailModelResponse,
    TvReviewsResponse? tvReviewsResponse,
    bool? isloading,
    String? errorMessage,
  }) {
    return TvState(
      tvModelResponse: tvModelResponse ?? this.tvModelResponse,
      tvOnAirResponse: tvOnAirResponse ?? this.tvOnAirResponse,
      tvDetailModelResponse: tvDetailModelResponse ?? this.tvDetailModelResponse,
      tvReviewsResponse: tvReviewsResponse ?? this.tvReviewsResponse,
      isloading: isloading ?? this.isloading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => <Object>[
        isloading,
        tvModelResponse ?? TvModelResponse(),
        tvOnAirResponse ?? TvModelResponse(),
        tvDetailModelResponse ?? TvDetailModelResponse(),
        tvReviewsResponse ?? TvReviewsResponse(),
        errorMessage,
      ];

  @override
  String toString() {
    return 'TvState: { '
        'tvModelResponse: $tvModelResponse, '
        'tvOnAirResponse: $tvOnAirResponse'
        'tvDetailModelResponse: $tvDetailModelResponse'
        'tvReviewsResponse: $tvReviewsResponse'
        'isloading: $isloading, '
        'errorMessage: $errorMessage, '
        '}';
  }
}
