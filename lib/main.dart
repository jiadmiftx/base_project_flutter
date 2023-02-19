import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/core/resource/injector/injection_container.dart';
import 'package:flutter_base/features/movie/bloc/movie_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_base/core/resource/injector/injection_container.dart' as injector;

import 'core/core.dart';

void main() {
  injector.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter(introGuard: IntroGuard());
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return _main(context);
  }

  Widget _main(BuildContext ctx) {
    var app = AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarBrightness: Brightness.light, statusBarIconBrightness: Brightness.dark),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: _appRouter.delegate(
          navigatorObservers: () => [AutoRouteObserver()],
        ),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
    return MultiBlocProvider(providers: [
       BlocProvider<MovieBloc>(create: (BuildContext context) => sl<MovieBloc>()),
    ], child: app);
  }
}
