part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object?> get props => <Object>[];
}

class DataMovieEvent extends MovieEvent {
  const DataMovieEvent();

  @override
  List<Object> get props => <Object>[];
}

class DataDetailMovieEvent extends MovieEvent {
  final int movieid;

  const DataDetailMovieEvent({required this.movieid});

  @override
  List<Object> get props => <Object>[movieid];
}

class ReviewDetailMovieEvent extends MovieEvent {
  final int movieid;

  const ReviewDetailMovieEvent({required this.movieid});

  @override
  List<Object> get props => <Object>[movieid];
}
