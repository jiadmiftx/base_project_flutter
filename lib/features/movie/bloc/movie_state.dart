part of 'movie_bloc.dart';

class MovieState extends Equatable {
  final MovieModelResponse? movieModelResponse;
  final DetailMovieResponse? detailMovieResponse;
  final ReviewModelResponse? reviewModelResponse;
  final bool isloading;
  final String errorMessage;

  const MovieState({
    this.movieModelResponse,
    this.detailMovieResponse,
    this.reviewModelResponse,
    this.isloading = false,
    this.errorMessage = '',
  });

  MovieState copyWith({
    MovieModelResponse? movieModelResponse,
    DetailMovieResponse? detailMovieResponse,
    ReviewModelResponse? reviewModelResponse,
    bool? isloading,
    String? errorMessage,
  }) {
    return MovieState(
      movieModelResponse: movieModelResponse ?? this.movieModelResponse,
      detailMovieResponse: detailMovieResponse ?? this.detailMovieResponse,
      reviewModelResponse: reviewModelResponse ?? this.reviewModelResponse,
      isloading: isloading ?? this.isloading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => <Object>[
        isloading,
        movieModelResponse ?? MovieModelResponse(),
        detailMovieResponse ?? DetailMovieResponse(),
        reviewModelResponse ?? ReviewModelResponse(),
        errorMessage,
      ];

  @override
  String toString() {
    return 'MovieState: { '
        'movieModelResponse: $movieModelResponse, '
        'detailMovieResponse: $detailMovieResponse'
        'reviewModelResponse: $reviewModelResponse'
        'isloading: $isloading, '
        'errorMessage: $errorMessage, '
        '}';
  }
}
