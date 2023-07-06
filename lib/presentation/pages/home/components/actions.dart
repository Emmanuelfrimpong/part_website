import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import '../../../../config/routes/router.dart';
import '../../../../generated/assets.dart';
import '../../../../global/enum.dart';
import '../../../../services/state/navigation_state.dart';
import '../../../../utils/site_colors.dart';

class ActionsPart extends ConsumerStatefulWidget {
  const ActionsPart({super.key});

  @override
  ConsumerState<ActionsPart> createState() => _ActionSectionState();
}

class _ActionSectionState extends ConsumerState<ActionsPart> {
  @override
  Widget build(BuildContext context) {
    var device = ResponsiveBreakpoints.of(context);
    return Container(
        width: device.screenWidth,
        padding: device.screenWidth >= 900
            ? const EdgeInsets.symmetric(horizontal: 40, vertical: 20)
            : const EdgeInsets.all(20),
        color: primaryColor,
        child: device.screenWidth >= 900
            ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(children: [
                      Image.asset(Assets.imagesTeacher,
                          width: 200, height: 200),
                      const SizedBox(height: 10),
                      Text(
                        'Teach in the USA',
                        style: GoogleFonts.openSans(
                            color: secondaryColor,
                            fontSize: 32,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Embark on a cultural exchange journey to the United States alongside PART Cultural Exchange. We will be with you every step of the way, making sure it’s a rewarding experience both professionally and personally. PART is an official J-1 visa sponsor for teacher exchange visitors, designated by the U.S. Department of State. PART has supported thousands of teachers for more than a decade to realize their dreams of teaching in the United States. ',
                        textAlign: TextAlign.center,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.openSans(
                            height: 1.5,
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: secondaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 20)),
                          onPressed: () {
                            ref.read(homeNavigationProvider.notifier).state =
                                Pages.teachers;
                            AutoRouter.of(context).push(const TeacherRoute());
                          },
                          child: Text('Get Started',
                              style: GoogleFonts.openSans(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500)))
                    ]),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(children: [
                        Image.asset(Assets.imagesSchool,
                            width: 200, height: 200),
                        const SizedBox(height: 10),
                        Text(
                          'Host a Teacher',
                          style: GoogleFonts.openSans(
                              color: secondaryColor,
                              fontSize: 32,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'PART Cultural Exchange supports K-12 school districts across the U.S. with experienced, certified international educators in critical need areas, offering students world-class instruction while enhancing global awareness and cultural exposure. Schools engage in cultural exchange programming with teachers that meet diversity, equity, and inclusion criteria with a cultural makeup that closely aligns with that of the student body in many districts.',
                          textAlign: TextAlign.center,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.openSans(
                              height: 1.5,
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: secondaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0)),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 20)),
                            onPressed: () {
                              ref.read(homeNavigationProvider.notifier).state =
                                  Pages.schools;
                              AutoRouter.of(context).push(const SchoolsRoute());
                            },
                            child: Text('Get Started',
                                style: GoogleFonts.openSans(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500)))
                      ]),
                    )),
              ])
            : Column(
                children: [
                  Image.asset(Assets.imagesTeacher, width: 200, height: 200),
                  const SizedBox(height: 10),
                  Text(
                    'Teach in the USA',
                    style: GoogleFonts.openSans(
                        color: secondaryColor,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Embark on a cultural exchange journey to the United States alongside PART Cultural Exchange. We will be with you every step of the way, making sure it’s a rewarding experience both professionally and personally. PART is an official J-1 visa sponsor for teacher exchange visitors, designated by the U.S. Department of State. PART has supported thousands of teachers for more than a decade to realize their dreams of teaching in the United States. ',
                    textAlign: TextAlign.center,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.openSans(
                        height: 1.5,
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: secondaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 20)),
                      onPressed: () {
                        ref.read(homeNavigationProvider.notifier).state =
                            Pages.teachers;
                        AutoRouter.of(context).push(const TeacherRoute());
                      },
                      child: Text('Get Started',
                          style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500))),
                  const SizedBox(height: 30),
                  Image.asset(Assets.imagesSchool, width: 200, height: 200),
                  const SizedBox(height: 10),
                  Text(
                    'Host a Teacher',
                    style: GoogleFonts.openSans(
                        color: secondaryColor,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'PART Cultural Exchange supports K-12 school districts across the U.S. with experienced, certified international educators in critical need areas, offering students world-class instruction while enhancing global awareness and cultural exposure. Schools engage in cultural exchange programming with teachers that meet diversity, equity, and inclusion criteria with a cultural makeup that closely aligns with that of the student body in many districts.',
                    textAlign: TextAlign.center,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.openSans(
                        height: 1.5,
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: secondaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 20)),
                      onPressed: () {
                        ref.read(homeNavigationProvider.notifier).state =
                            Pages.schools;
                        AutoRouter.of(context).push(const SchoolsRoute());
                      },
                      child: Text('Get Started',
                          style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500)))
                ],
              ));
  }
}
