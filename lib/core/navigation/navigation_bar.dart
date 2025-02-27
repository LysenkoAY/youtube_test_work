import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../inherited/model.dart';
import 'app_router.gr.dart';

@RoutePage(name: "NavigationBarRoute")
class NavigationBar extends StatelessWidget {
  const NavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      extendBody: true,
      routes: [
        SearchScreenRoute(),
        FavoriteScreenRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
          backgroundColor: Colors.black38,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            BottomNavigationBarItem(label: "Пoиск", icon: Icon(Icons.search)),
            BottomNavigationBarItem(
              label: "Избранное",
              icon: Badge.count(
                count: AppInheritedModel.countOf(context),
                isLabelVisible: AppInheritedModel.countOf(context) > 0,
                child: Icon(Icons.favorite_border),
              ),
            ),
          ],
        );
      },
    );
  }
}
