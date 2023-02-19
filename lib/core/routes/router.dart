import 'package:auto_route/auto_route.dart';
import 'package:flutter_base/features/home/presentation/home_page.dart';
import 'package:flutter_base/features/movie/presentation/detail_movie_page.dart';
import 'package:flutter_base/features/movie/presentation/movie_page.dart';
import 'package:flutter_base/features/tv/presentation/tv_page.dart';
import 'package:flutter_base/features/boarding/presentation/boarding_page.dart';
import 'package:flutter_base/features/profile/presentation/profile_page.dart';
import 'package:flutter_base/core/core.dart';


export 'router.gr.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  AutoRoute(page: BoardingPage, path: '/', guards: [IntroGuard]),
  AutoRoute(
    children: [
      AutoRoute(page: MoviePage, path: 'movie-screen'),
      AutoRoute(page: TvPage, path: 'tv-screen'),
      AutoRoute(page: ProfilePage, path: 'profile-screen'),
    ],
    page: HomePage,
    path: 'home-screen',
  ),
  AutoRoute(page: DetailMoviePage, path: 'detail-movie-screen'),
])

class $AppRouter {}
