import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:papers/models/models.dart';

part 'wallhaven_response.freezed.dart';
part 'wallhaven_response.g.dart';

@freezed
class WallhavenResponse with _$WallhavenResponse {
  const factory WallhavenResponse({
    required List<Wallpaper> data,
    required WallhavenResponseMeta meta,
  }) = _WallhavenResponse;

  factory WallhavenResponse.fromJson(Map<String, dynamic> json) =>
      _$WallhavenResponseFromJson(json);
}

@freezed
class WallhavenResponseMeta with _$WallhavenResponseMeta {
  const factory WallhavenResponseMeta({
    @JsonKey(name: 'current_page') required int currentPage,
    @JsonKey(name: 'last_page') required int lastPage,
  }) = _WallhavenResponseMeta;

  factory WallhavenResponseMeta.fromJson(Map<String, dynamic> json) =>
      _$WallhavenResponseMetaFromJson(json);
}
