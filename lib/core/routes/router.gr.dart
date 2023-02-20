// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../../features/boarding/presentation/boarding_page.dart' as _i1;
import '../../features/home/presentation/home_page.dart' as _i2;
import '../../features/movie/presentation/detail_movie_page.dart' as _i3;
import '../../features/movie/presentation/movie_page.dart' as _i5;
import '../../features/profile/presentation/profile_page.dart' as _i7;
import '../../features/tv/presentation/detail_movie_page.dart' as _i4;
import '../../features/tv/presentation/tv_page.dart' as _i6;
import '../core.dart' as _i10;

class AppRouter extends _i8.RootStackRouter {
  AppRouter({
    _i9.GlobalKey<_i9.NavigatorState>? navigatorKey,
    required this.introGuard,
  }) : super(navigatorKey);

  final _i10.IntroGuard introGuard;

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    BoardingRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.BoardingPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.HomePage(),
      );
    },
    DetailMovieRoute.name: (routeData) {
      final args = routeData.argsAs<DetailMovieRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.DetailMoviePage(
          key: args.key,
          movieid: args.movieid,
        ),
      );
    },
    DetailTvRoute.name: (routeData) {
      final args = routeData.argsAs<DetailTvRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.DetailTvPage(
          key: args.key,
          tvid: args.tvid,
        ),
      );
    },
    MovieRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.MoviePage(),
      );
    },
    TvRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.TvPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.ProfilePage(),
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          BoardingRoute.name,
          path: '/',
          guards: [introGuard],
        ),
        _i8.RouteConfig(
          HomeRoute.name,
          path: 'home-screen',
          children: [
            _i8.RouteConfig(
              MovieRoute.name,
              path: 'movie-screen',
              parent: HomeRoute.name,
            ),
            _i8.RouteConfig(
              TvRoute.name,
              path: 'tv-screen',
              parent: HomeRoute.name,
            ),
            _i8.RouteConfig(
              ProfileRoute.name,
              path: 'profile-screen',
              parent: HomeRoute.name,
            ),
          ],
        ),
        _i8.RouteConfig(
          DetailMovieRoute.name,
          path: 'detail-movie-screen',
        ),
        _i8.RouteConfig(
          DetailTvRoute.name,
          path: 'detail-tv-screen',
        ),
      ];
}

/// generated route for
/// [_i1.BoardingPage]
class BoardingRoute extends _i8.PageRouteInfo<void> {
  const BoardingRoute()
      : super(
          BoardingRoute.name,
          path: '/',
        );

  static const String name = 'BoardingRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          path: 'home-screen',
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.DetailMoviePage]
class DetailMovieRoute extends _i8.PageRouteInfo<DetailMovieRouteArgs> {
  DetailMovieRoute({
    _i9.Key? key,
    required int movieid,
  }) : super(
          DetailMovieRoute.name,
          path: 'detail-movie-screen',
          args: DetailMovieRouteArgs(
            key: key,
            movieid: movieid,
          ),
        );

  static const String name = 'DetailMovieRoute';
}

class DetailMovieRouteArgs {
  const DetailMovieRouteArgs({
    this.key,
    required this.movieid,
  });

  final _i9.Key? key;

  final int movieid;

  @override
  String toString() {
    return 'DetailMovieRouteArgs{key: $key, movieid: $movieid}';
  }
}

/// generated route for
/// [_i4.DetailTvPage]
class DetailTvRoute extends _i8.PageRouteInfo<DetailTvRouteArgs> {
  DetailTvRoute({
    _i9.Key? key,
    required int tvid,
  }) : super(
          DetailTvRoute.name,
          path: 'detail-tv-screen',
          args: DetailTvRouteArgs(
            key: key,
            tvid: tvid,
          ),
        );

  static const String name = 'DetailTvRoute';
}

class DetailTvRouteArgs {
  const DetailTvRouteArgs({
    this.key,
    required this.tvid,
  });

  final _i9.Key? key;

  final int tvid;

  @override
  String toString() {
    return 'DetailTvRouteArgs{key: $key, tvid: $tvid}';
  }
}

/// generated route for
/// [_i5.MoviePage]
class MovieRoute extends _i8.PageRouteInfo<void> {
  const MovieRoute()
      : super(
          MovieRoute.name,
          path: 'movie-screen',
        );

  static const String name = 'MovieRoute';
}

/// generated route for
/// [_i6.TvPage]
class TvRoute extends _i8.PageRouteInfo<void> {
  const TvRoute()
      : super(
          TvRoute.name,
          path: 'tv-screen',
        );

  static const String name = 'TvRoute';
}

/// generated route for
/// [_i7.ProfilePage]
class ProfileRoute extends _i8.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: 'profile-screen',
        );

  static const String name = 'ProfileRoute';
}
