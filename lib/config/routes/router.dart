import 'package:auto_route/auto_route.dart';
import 'package:part_website/presentation/pages/faqs/faqs_page.dart';
import '../../presentation/pages/about/about_us_page.dart';
import '../../presentation/pages/contact/contact_page.dart';
import '../../presentation/pages/forms/forms_page.dart';
import '../../presentation/pages/home/home_page.dart';
import '../../presentation/pages/login/login_page.dart';
import '../../presentation/pages/school/schools_page.dart';
import '../../presentation/pages/teaher/teacher_page.dart';

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
        AutoRoute(
          path: '/faqs',
          page: FAQSRoute.page,
        ),
        AutoRoute(
          path: '/contact-us',
          page: ContactUsRoute.page,
        ),
        AutoRoute(
          path: '/about-us',
          page: AboutUsRoute.page,
        ),
        AutoRoute(
          path: '/teach-in-usa',
          page: TeacherRoute.page,
        ),
        AutoRoute(
          path: '/host-a-teacher',
          page: SchoolsRoute.page,
        ),
        AutoRoute(
          path: '/apply-now',
          page: FormsRoute.page,
        ),
      ];
}
