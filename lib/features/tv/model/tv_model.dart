import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_model.freezed.dart';
part 'tv_model.g.dart';

@freezed
class TvModelResponse with _$TvModelResponse {
  factory TvModelResponse({
    int? page,
    List<Result>? results,
    @JsonKey(name: 'total_results') int? totalResults,
    @JsonKey(name: 'total_pages') int? totalPages,
  }) = _TvModelResponse;

  factory TvModelResponse.fromJson(Map<String, dynamic> json) => _$TvModelResponseFromJson(json);
}

@freezed
class Result with _$Result {
  factory Result({
    @JsonKey(name: 'poster_path') String? posterPath,
    double? popularity,
    int? id,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'vote_average') double? voteAverage,
    String? overview,
    @JsonKey(name: 'first_air_date') String? firstAirDate,
    @JsonKey(name: 'origin_country') List<String>? originCountry,
    @JsonKey(name: 'genre_ids') List<int>? genreIds,
    @JsonKey(name: 'original_language') String? originalLanguage,
    @JsonKey(name: 'vote_count') int? voteCount,
    String? name,
    @JsonKey(name: 'original_name') String? originalName,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
