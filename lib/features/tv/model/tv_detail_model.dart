import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_detail_model.freezed.dart';
part 'tv_detail_model.g.dart';

@freezed
class TvDetailModelResponse with _$TvDetailModelResponse {
  factory TvDetailModelResponse({
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'created_by') List<CreatedBy>? createdBy,
    @JsonKey(name: 'episode_run_time') List<int>? episodeRunTime,
    @JsonKey(name: 'first_air_date') String? firstAirDate,
    List<Genre>? genres,
    String? homepage,
    int? id,
    @JsonKey(name: 'in_production') bool? inProduction,
    List<String>? languages,
    @JsonKey(name: 'last_air_date') String? lastAirDate,
    @JsonKey(name: 'last_episode_to_air') LastEpisodeToAir? lastEpisodeToAir,
    String? name,
    @JsonKey(name: 'next_episode_to_air') dynamic nextEpisodeToAir,
    List<Network>? networks,
    @JsonKey(name: 'number_of_episodes') int? numberOfEpisodes,
    @JsonKey(name: 'number_of_seasons') int? numberOfSeasons,
    @JsonKey(name: 'origin_country') List<String>? originCountry,
    @JsonKey(name: 'original_language') String? originalLanguage,
    @JsonKey(name: 'original_name') String? originalName,
    String? overview,
    double? popularity,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'production_companies') List<ProductionCompany>? productionCompanies,
    @JsonKey(name: 'production_countries') List<ProductionCountry>? productionCountries,
    List<Season>? seasons,
    @JsonKey(name: 'spoken_languages') List<SpokenLanguage>? spokenLanguages,
    String? status,
    String? tagline,
    String? type,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,
  }) = _TvDetailModelResponse;

  factory TvDetailModelResponse.fromJson(Map<String, dynamic> json) => _$TvDetailModelResponseFromJson(json);
}

@freezed
class CreatedBy with _$CreatedBy {
  factory CreatedBy({
    int? id,
    @JsonKey(name: 'credit_id') String? creditId,
    String? name,
    int? gender,
    @JsonKey(name: 'profile_path') String? profilePath,
  }) = _CreatedBy;

  factory CreatedBy.fromJson(Map<String, dynamic> json) => _$CreatedByFromJson(json);
}

@freezed
class Genre with _$Genre {
  factory Genre({
    int? id,
    String? name,
  }) = _Genre;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}

@freezed
class LastEpisodeToAir with _$LastEpisodeToAir {
  factory LastEpisodeToAir({
    @JsonKey(name: 'air_date') String? airDate,
    @JsonKey(name: 'episode_number') int? episodeNumber,
    int? id,
    String? name,
    String? overview,
    @JsonKey(name: 'production_code') String? productionCode,
    @JsonKey(name: 'season_number') int? seasonNumber,
    @JsonKey(name: 'still_path') String? stillPath,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,
  }) = _LastEpisodeToAir;

  factory LastEpisodeToAir.fromJson(Map<String, dynamic> json) => _$LastEpisodeToAirFromJson(json);
}

@freezed
class Network with _$Network {
  factory Network({
    String? name,
    int? id,
    @JsonKey(name: 'logo_path') String? logoPath,
    @JsonKey(name: 'origin_country') String? originCountry,
  }) = _Network;

  factory Network.fromJson(Map<String, dynamic> json) => _$NetworkFromJson(json);
}

@freezed
class ProductionCompany with _$ProductionCompany {
  factory ProductionCompany({
    int? id,
    @JsonKey(name: 'logo_path') String? logoPath,
    String? name,
    @JsonKey(name: 'origin_country') String? originCountry,
  }) = _ProductionCompany;

  factory ProductionCompany.fromJson(Map<String, dynamic> json) => _$ProductionCompanyFromJson(json);
}

@freezed
class ProductionCountry with _$ProductionCountry {
  factory ProductionCountry({
    @JsonKey(name: 'iso_3166_1') String? iso31661,
    String? name,
  }) = _ProductionCountry;

  factory ProductionCountry.fromJson(Map<String, dynamic> json) => _$ProductionCountryFromJson(json);
}

@freezed
class Season with _$Season {
  factory Season({
    @JsonKey(name: 'air_date') String? airDate,
    @JsonKey(name: 'episode_count') int? episodeCount,
    int? id,
    String? name,
    String? overview,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'season_number') int? seasonNumber,
  }) = _Season;

  factory Season.fromJson(Map<String, dynamic> json) => _$SeasonFromJson(json);
}

@freezed
class SpokenLanguage with _$SpokenLanguage {
  factory SpokenLanguage({
    @JsonKey(name: 'english_name') String? englishName,
    @JsonKey(name: 'iso_639_1') String? iso6391,
    String? name,
  }) = _SpokenLanguage;

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) => _$SpokenLanguageFromJson(json);
}
