import 'dart:async';

import 'package:movie_finder_app/list_cart_user.dart';
import 'package:movie_finder_app/listmovie.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import 'list_cast.dart';

part 'restapi.g.dart';

@RestApi(baseUrl: "https://api.themoviedb.org/3/movie")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/popular")
  Future<Movies?> getTasks2(@Query("api_key") String apiKey);
  @GET("/{id}")
  Future<ListCart?> getDetail(
      @Query("api_key") String apiKey, @Path() String id);
  @GET("/{id}/credits")
  Future<User?> getUers(@Query("api_key") String apiKey, @Path() String id);
}
