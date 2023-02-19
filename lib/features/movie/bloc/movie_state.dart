part of 'movie_bloc.dart';

class MovieState extends Equatable {
  final MovieModelResponse? movieModelResponse;
  final MovieModelResponse? upcomingModelResponse;
  final MovieModelResponse? popularModelResponse;
  final DetailMovieResponse? detailMovieResponse;
  final ReviewModelResponse? reviewModelResponse;
  final bool isloading;
  final String errorMessage;

  const MovieState({
    this.movieModelResponse,
    this.upcomingModelResponse,
    this.popularModelResponse,
    this.detailMovieResponse,
    this.reviewModelResponse,
    this.isloading = false,
    this.errorMessage = '',
  });

  MovieState copyWith({
    MovieModelResponse? movieModelResponse,
    MovieModelResponse? upcomingModelResponse,
    MovieModelResponse? popularModelResponse,
    DetailMovieResponse? detailMovieResponse,
    ReviewModelResponse? reviewModelResponse,
    bool? isloading,
    String? errorMessage,
  }) {
    return MovieState(
      movieModelResponse: movieModelResponse ?? this.movieModelResponse,
      upcomingModelResponse: upcomingModelResponse ?? this.upcomingModelResponse,
      popularModelResponse: popularModelResponse ?? this.popularModelResponse,
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
        popularModelResponse ?? MovieModelResponse(),
        upcomingModelResponse ?? MovieModelResponse(),
        detailMovieResponse ?? DetailMovieResponse(),
        reviewModelResponse ?? ReviewModelResponse(),
        errorMessage,
      ];

  @override
  String toString() {
    return 'MovieState: { '
        'movieModelResponse: $movieModelResponse, '
        'detailMovieResponse: $detailMovieResponse'
        'popularModelResponse: $popularModelResponse'
        'upcomingModelResponse: $upcomingModelResponse' 
        'reviewModelResponse: $reviewModelResponse'
        'isloading: $isloading, '
        'errorMessage: $errorMessage, '
        '}';
  }
}
