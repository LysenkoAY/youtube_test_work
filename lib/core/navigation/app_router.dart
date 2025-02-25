import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

final router = AppRouter();

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: NavigationBarRoute.page,
          initial: true,
          children: [
            AutoRoute(
              page: SearchShellScreenRoute.page,
              initial: true,
              children: [AutoRoute(page: SearchScreenRoute.page, initial: true)],
            ),
            AutoRoute(
              page: FavoriteShellScreenRoute.page,
              children: [AutoRoute(page: FavoriteScreenRoute.page)],
            ),
          ],
        ),
        AutoRoute(page: DetailScreenRoute.page),
      ];
}
