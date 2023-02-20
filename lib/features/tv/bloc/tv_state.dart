part of 'tv_bloc.dart';

class TvState extends Equatable {
  final TvModelResponse? tvModelResponse;
  final TvModelResponse? tvOnAirResponse;
  final bool isloading;
  final String errorMessage;

  const TvState({
    this.tvModelResponse,
    this.tvOnAirResponse,
    // this.reviewModelResponse,
    this.isloading = false,
    this.errorMessage = '',
  });

  TvState copyWith({
    TvModelResponse? tvModelResponse,
    TvModelResponse? tvOnAirResponse,
    bool? isloading,
    String? errorMessage,
  }) {
    return TvState(
      tvModelResponse: tvModelResponse ?? this.tvModelResponse,
      tvOnAirResponse: tvOnAirResponse ?? this.tvOnAirResponse,
      // reviewModelResponse: reviewModelResponse ?? this.reviewModelResponse,
      isloading: isloading ?? this.isloading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => <Object>[
        isloading,
        tvModelResponse ?? TvModelResponse(),
        tvOnAirResponse ?? TvModelResponse(),
        // reviewModelResponse ?? ReviewModelResponse(),
        errorMessage,
      ];

  @override
  String toString() {
    return 'TvState: { '
        'tvModelResponse: $tvModelResponse, '
        'tvOnAirResponse: $tvOnAirResponse'
        // 'reviewModelResponse: $reviewModelResponse'
        'isloading: $isloading, '
        'errorMessage: $errorMessage, '
        '}';
  }
}
