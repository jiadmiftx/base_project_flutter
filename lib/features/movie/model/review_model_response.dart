import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_model_response.freezed.dart';
part 'review_model_response.g.dart';

@freezed
class ReviewModelResponse with _$ReviewModelResponse {
  factory ReviewModelResponse({
    int? id,
    int? page,
    List<Result>? results,
    @JsonKey(name: 'total_pages') int? totalPages,
    @JsonKey(name: 'total_results') int? totalResults,
  }) = _ReviewModelResponse;

  factory ReviewModelResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelResponseFromJson(json);
}

@freezed
class Result with _$Result {
  factory Result({
    String? author,
    @JsonKey(name: 'author_details') AuthorDetails? authorDetails,
    String? content,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    String? id,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    String? url,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}

@freezed
class AuthorDetails with _$AuthorDetails {
  factory AuthorDetails({
    String? name,
    String? username,
    @JsonKey(name: 'avatar_path') String? avatarPath,
    double? rating,
  }) = _AuthorDetails;

  factory AuthorDetails.fromJson(Map<String, dynamic> json) => _$AuthorDetailsFromJson(json);
}


