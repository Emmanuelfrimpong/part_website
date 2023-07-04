import 'package:auto_route/auto_route.dart';
import '../../presentation/pages/home/home_page.dart';
import '../../presentation/pages/login/login_page.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get routeType => const RouteType.adaptive();
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/', page: HomeRoute.page, initial: true),
        AutoRoute(
          path: '/auth',
          page: LoginRoute.page,
        ),
      ];
}
