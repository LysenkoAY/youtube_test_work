import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'app_router.gr.dart';

@RoutePage(name: "NavigationBarRoute")
class NavigationBar extends StatelessWidget {
  const NavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: [
        SearchScreenRoute(),
        FavoriteScreenRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            BottomNavigationBarItem(label: "Пoиск", icon: Icon(Icons.search)),
            BottomNavigationBarItem(label: "Избранное", icon: Icon(Icons.favorite_border)),
          ],
        );
      },
    );
  }
}
