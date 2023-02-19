// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_model.freezed.dart';
part 'movie_model.g.dart';

@freezed
class MovieModelResponse with _$MovieModelResponse {
  factory MovieModelResponse({
    int? page,
    List<Movie>? results,
    // Dates? dates,
    @JsonKey(name: 'total_pages') int? totalPages,
    @JsonKey(name: 'total_results') int? totalMovies,
  }) = _MovieModelResponse;

  factory MovieModelResponse.fromJson(Map<String, dynamic> json) => _$MovieModelResponseFromJson(json);
}

@freezed
class Movie with _$Movie {
  factory Movie({
    @JsonKey(name: 'poster_path') String? posterPath,
    bool? adult,
    String? overview,
    @JsonKey(name: 'release_date') String? releaseDate,
    @JsonKey(name: 'genre_ids') List<int>? genreIds,
    int? id,
    @JsonKey(name: 'original_title') String? originalTitle,
    @JsonKey(name: 'original_language') String? originalLanguage,
    String? title,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    double? popularity,
    @JsonKey(name: 'vote_count') int? voteCount,
    bool? video,
    @JsonKey(name: 'vote_average') double? voteAverage,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}

// @freezed
// class Dates with _$Dates {
//   factory Dates({
//     String? maximum,
//     String? minimum,
//   }) = _Dates;

//   factory Dates.fromJson(Map<String, dynamic> json) => _$DatesFromJson(json);
// }
