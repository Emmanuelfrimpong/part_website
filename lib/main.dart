import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:part_website/services/firebase/firebase_services.dart';
import 'package:part_website/services/state/navigation_state.dart';
import 'package:part_website/utils/site_colors.dart';
import 'package:responsive_framework/breakpoint.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:url_strategy/url_strategy.dart';
import 'config/routes/router.dart';
import 'global/enum.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseApi.init();
  setPathUrlStrategy();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  final _appRouter = AppRouter();
  @override
  void initState() {
    // if widget is build, then do this
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //get current route name
      final currentRoute = _appRouter.current.name;
      print('Home Current :$currentRoute');
      switch (currentRoute) {
        case "LoginRoute":
          ref.read(homeNavigationProvider.notifier).state = Pages.login;
          break;
        case "HomeRoute":
          ref.read(homeNavigationProvider.notifier).state = Pages.home;
          break;
        case "AboutUsRoute":
          ref.read(homeNavigationProvider.notifier).state = Pages.about;
          break;
        case "ContactUsRoute":
          ref.read(homeNavigationProvider.notifier).state = Pages.contact;
          break;
        case "FAQSRoute":
          ref.read(homeNavigationProvider.notifier).state = Pages.faq;
          break;
        case "SchoolsRoute":
          ref.read(homeNavigationProvider.notifier).state = Pages.schools;
          break;
        case "TeacherRoute":
          ref.read(homeNavigationProvider.notifier).state = Pages.teachers;
          break;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      title: 'PART',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 650, name: MOBILE),
          const Breakpoint(start: 651, end: 900, name: TABLET),
          const Breakpoint(start: 901, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
    );
  }
}
