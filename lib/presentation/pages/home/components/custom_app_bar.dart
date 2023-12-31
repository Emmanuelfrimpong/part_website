import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:part_website/utils/site_colors.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import '../../../../config/routes/router.dart';
import '../../../../generated/assets.dart';
import '../../../../global/enum.dart';
import '../../../../services/state/navigation_state.dart';

class CustomAppBar extends ConsumerStatefulWidget {
  const CustomAppBar({super.key});

  @override
  ConsumerState<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends ConsumerState<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    var device = ResponsiveBreakpoints.of(context);
    var navigationState = ref.watch(homeNavigationProvider);
    var appBarOpacity = ref.watch(appBarOpacityProvider);
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: Container(
        width: device.screenWidth,
        height: device.isDesktop ? 70 : 50,
        color: appBarOpacity ? Colors.white : Colors.white.withOpacity(0.8),
        child: Row(
          children: [
            const SizedBox(width: 15),
            InkWell(
              onTap: () {
                ref.read(homeNavigationProvider.notifier).state = Pages.home;
                AutoRouter.of(context).pushAndPopUntil(const HomeRoute(),
                    predicate: (route) => false);
              },
              child: Image.asset(
                Assets.logoLogoNoText,
                height: device.isDesktop
                    ? 60
                    : device.isTablet
                        ? 70
                        : 40,
              ),
            ),
            const Spacer(),
            if (device.screenWidth < 1000)
              PopupMenuButton<PageRouteInfo>(
                  constraints: const BoxConstraints(minWidth: 300),
                  position: PopupMenuPosition.under,
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          value: const HomeRoute(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              'Home',
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: navigationState == Pages.home
                                    ? primaryColor
                                    : Colors.black45,
                              ),
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          value: const TeacherRoute(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              'Teach in USA',
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: navigationState == Pages.teachers
                                    ? primaryColor
                                    : Colors.black45,
                              ),
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          value: const SchoolsRoute(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              'Host a Teacher',
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: navigationState == Pages.schools
                                    ? primaryColor
                                    : Colors.black45,
                              ),
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          value: const AboutUsRoute(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              'About Us',
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: navigationState == Pages.about
                                    ? primaryColor
                                    : Colors.black45,
                              ),
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          value: const ContactUsRoute(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              'Contact',
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: navigationState == Pages.contact
                                    ? primaryColor
                                    : Colors.black45,
                              ),
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          value: const FAQSRoute(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              'FAQs',
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: navigationState == Pages.faq
                                    ? primaryColor
                                    : Colors.black45,
                              ),
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          value: const LoginRoute(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              'Login',
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: navigationState == Pages.login
                                    ? primaryColor
                                    : Colors.black45,
                              ),
                            ),
                          ),
                        ),
                      ],
                  onSelected: (value) {
                    switch (value.routeName) {
                      case HomeRoute.name:
                        ref.read(homeNavigationProvider.notifier).state =
                            Pages.home;
                        break;
                      case TeacherRoute.name:
                        ref.read(homeNavigationProvider.notifier).state =
                            Pages.teachers;
                        break;
                      case SchoolsRoute.name:
                        ref.read(homeNavigationProvider.notifier).state =
                            Pages.schools;
                        break;
                      case AboutUsRoute.name:
                        ref.read(homeNavigationProvider.notifier).state =
                            Pages.about;
                        break;
                      case ContactUsRoute.name:
                        ref.read(homeNavigationProvider.notifier).state =
                            Pages.contact;
                        break;
                      case FAQSRoute.name:
                        ref.read(homeNavigationProvider.notifier).state =
                            Pages.faq;
                        break;
                      case LoginRoute.name:
                        ref.read(homeNavigationProvider.notifier).state =
                            Pages.login;
                        break;
                    }
                    final _appRouter = AppRouter();
                    if (_appRouter.current.name != value.routeName) {
                      AutoRouter.of(context)
                          .pushAndPopUntil(value, predicate: (route) => false);
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      border: Border.all(color: primaryColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    child: Icon(
                      MdiIcons.menu,
                      color: Colors.white,
                      size: 26,
                    ),
                  )),
            if (device.screenWidth >= 1000)
              Row(
                children: [
                  CustomAppBarItem(
                    onPressed: () {
                      pushToPage(Pages.home, const HomeRoute());
                    },
                    isSelected: navigationState == Pages.home,
                    child: Text(
                      'Home',
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: navigationState == Pages.home
                            ? primaryColor
                            : Colors.black45,
                      ),
                    ),
                  ),
                  // add dropdown menu here
                  CustomAppBarItem(
                    onPressed: () {
                      pushToPage(Pages.teachers, const TeacherRoute());
                    },
                    isSelected: navigationState == Pages.teachers,
                    child: Text(
                      'Teach in USA',
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: navigationState == Pages.teachers
                            ? primaryColor
                            : Colors.black45,
                      ),
                    ),
                  ),
                  CustomAppBarItem(
                    onPressed: () {
                      pushToPage(Pages.schools, const SchoolsRoute());
                    },
                    isSelected: navigationState == Pages.schools,
                    child: Text(
                      'Host a Teacher',
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: navigationState == Pages.schools
                            ? primaryColor
                            : Colors.black45,
                      ),
                    ),
                  ),
                  CustomAppBarItem(
                    onPressed: () {
                      pushToPage(Pages.about, const AboutUsRoute());
                    },
                    isSelected: navigationState == Pages.about,
                    child: Text(
                      'About us',
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: navigationState == Pages.about
                            ? primaryColor
                            : Colors.black45,
                      ),
                    ),
                  ),
                  CustomAppBarItem(
                    onPressed: () {
                      pushToPage(Pages.faq, const FAQSRoute());
                    },
                    isSelected: navigationState == Pages.faq,
                    child: Text(
                      'FAQs',
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: navigationState == Pages.faq
                            ? primaryColor
                            : Colors.black45,
                      ),
                    ),
                  ),
                  CustomAppBarItem(
                    onPressed: () {
                      pushToPage(Pages.contact, const ContactUsRoute());
                    },
                    isSelected: navigationState == Pages.contact,
                    child: Text(
                      'Contact us',
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: navigationState == Pages.contact
                            ? primaryColor
                            : Colors.black45,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: navigationState == Pages.login
                              ? Colors.white
                              : primaryColor,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: navigationState == Pages.login
                                      ? primaryColor
                                      : Colors.white,
                                  width: 1),
                              borderRadius: BorderRadius.circular(0))),
                      onPressed: () {
                        pushToPage(Pages.login, const LoginRoute());
                      },
                      child: Text(
                        'Login',
                        style: GoogleFonts.openSans(
                          color: navigationState == Pages.login
                              ? primaryColor
                              : Colors.white,
                          fontSize: 18,
                        ),
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  void pushToPage(Pages pages, PageRouteInfo page) {
    ref.read(homeNavigationProvider.notifier).state = pages;
    //get current rout name
    final String name = AutoRouter.of(context).current.name;
    if (name != page.routeName) {
      AutoRouter.of(context).pushAndPopUntil(page, predicate: (route) => false);
    } else {}
  }
}

class CustomAppBarItem extends ConsumerStatefulWidget {
  const CustomAppBarItem(
      {required this.child,
      required this.onPressed,
      required this.isSelected,
      super.key});

  final Widget child;
  final VoidCallback onPressed;
  final bool isSelected;

  @override
  ConsumerState<CustomAppBarItem> createState() => _CustomAppBarItemState();
}

class _CustomAppBarItemState extends ConsumerState<CustomAppBarItem> {
  bool onHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      onHover: (value) {
        setState(() {
          onHover = value;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.child,
            if (onHover && !widget.isSelected)
              Container(
                margin: const EdgeInsets.only(top: 5),
                height: 2,
                width: 30,
                color: secondaryColor.withOpacity(.6),
              ),
            if (widget.isSelected)
              Container(
                margin: const EdgeInsets.only(top: 5),
                height: 4,
                width: 30,
                color: secondaryColor,
              ),
          ],
        ),
      ),
    );
  }
}
