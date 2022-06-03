import 'package:dio/dio.dart';
import 'package:papers/api/wallhaven/models/models.dart';
import 'package:retrofit/retrofit.dart';

part 'wallhaven_api.g.dart';

@RestApi(baseUrl: 'https://wallhaven.cc/api/v1/')
abstract class WallhavenApi {
  factory WallhavenApi(Dio dio, {String baseUrl}) = _WallhavenApi;

  @GET('/search')
  Future<WallhavenResponse> getWallpapers(@Query('page') int page);
}
