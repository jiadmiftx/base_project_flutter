import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_base/core/core.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TabsRouter _tabsRouter;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      bottomNavigationBuilder: (ctx, tabsRouter) {
        _tabsRouter = tabsRouter;
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          items: _menu(),
          onTap: (idx) {
            tabsRouter.setActiveIndex(idx);
          },
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
        );
      },
      routes: _setupItems().map((e) => e.route).toList(),
    );
  }

  List<BottomNavigationBarItem> _menu() => _setupItems()
      .asMap()
      .map(
        (idx, element) => MapEntry(
          idx,
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Icon(
                  _tabsRouter.activeIndex == idx ? element.iconActive : element.iconInactive,
                  size: 20,
                  color: _tabsRouter.activeIndex == idx ? const Color.fromARGB(255, 24, 128, 255) : Colors.grey,
                ).bottomPadded4().topPadded(4),
                _tabsRouter.activeIndex == idx ? Text14BlueBold(element.title) : Text14GreyLight(element.title)
              ],
            ),
            label: '',
          ),
        ),
      )
      .values
      .toList();

  List<_Tab> _setupItems() {
    return [
      _Tab(
        iconActive: Icons.movie_creation_outlined,
        iconInactive: Icons.movie,
        title: 'Movie',
        route: MovieRoute(),
      ),
      _Tab(
        iconActive: Icons.live_tv_sharp,
        iconInactive: Icons.live_tv_rounded,
        title: 'TV+',
        route: TvRoute(),
      ),
      _Tab(
        iconActive: Icons.person_sharp,
        iconInactive: Icons.person_outline_outlined,
        title: 'Profile',
        route: ProfileRoute(),
      ),
    ];
  }
}

class _Tab {
  final IconData iconInactive;

  final IconData iconActive;

  final String title;

  final PageRouteInfo route;

  const _Tab({
    required this.iconActive,
    required this.iconInactive,
    required this.title,
    required this.route,
  });
}
