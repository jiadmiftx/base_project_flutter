import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/core/resource/network/rest_client.dart';
import 'package:flutter_base/core/resource/repositories/repository.dart';
import 'package:flutter_base/features/movie/bloc/movie_bloc.dart';
import 'package:flutter_base/features/tv/bloc/tv_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.I;
final platform = MethodChannel('channel');

Future<void> init() async {
  final Dio _dio = Dio();
  sl.registerSingleton<RestClient>(RestClient(_dio, baseUrl: 'https://api.themoviedb.org/'));
  sl.registerLazySingleton(() => Repository(sl<RestClient>()));
  sl.registerLazySingleton(() => MovieBloc(sl<Repository>()));
  sl.registerLazySingleton(() => TvBloc(sl<Repository>()));
}
