import 'package:auto_animated/auto_animated.dart';
import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:part_website/config/routes/router.dart';
import 'package:part_website/global/enum.dart';
import 'package:part_website/services/state/navigation_state.dart';
import 'package:part_website/utils/site_colors.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import '../../../../generated/assets.dart';

class LandingPage extends ConsumerStatefulWidget {
  const LandingPage({super.key});

  @override
  ConsumerState<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends ConsumerState<LandingPage> {
  int _currentSlide = 0;
  final listOfSlides = [
    Assets.imagesSlide1,
    Assets.imagesSlide2,
    Assets.imagesSlide3,
    Assets.imagesSlide4,
  ];
  @override
  Widget build(BuildContext context) {
    var device = ResponsiveBreakpoints.of(context);
    var height = device.screenHeight * .9;
    var width = device.screenWidth;
    return Stack(
      children: [
        SizedBox(
          width: device.screenWidth,
          height: height,
          child: CarouselSlider(
            options: CarouselOptions(
                animateToClosest: true,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1,
                height: height,
                autoPlayAnimationDuration: const Duration(seconds: 2),
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentSlide = index;
                  });
                }),
            items: listOfSlides
                .map((e) => Container(
                      width: width,
                      height: height,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(e),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
        Container(
          width: device.screenWidth,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                primaryColor.withOpacity(.8),
                const Color.fromARGB(255, 79, 145, 81).withOpacity(.8),
                secondaryColor.withOpacity(.4),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: device.isDesktop
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(25),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Be part of PART',
                                    style: GoogleFonts.openSans(
                                      fontSize: width * .05,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 100),
                                    child: Column(
                                      children: [
                                        RichText(
                                            text: TextSpan(children: [
                                          TextSpan(
                                            text:
                                                'We provide opportunities for global Educators to make a positive ',
                                            style: GoogleFonts.openSans(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          TextSpan(
                                            text: '"imPART"',
                                            style: GoogleFonts.aBeeZee(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              color: secondaryColor,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                ' on their students, host schools, and local communities.',
                                            style: GoogleFonts.openSans(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ])),
                                        const SizedBox(height: 20),
                                        Text(
                                          'PART understands that experience matters. That\'s why we recruit highly qualified and experienced teachers',
                                          style: GoogleFonts.openSans(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: secondaryColor,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 20),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(0),
                                        ),
                                      ),
                                      onPressed: () {
                                        ref
                                            .read(
                                                homeNavigationProvider.notifier)
                                            .state = Pages.about;
                                        AutoRouter.of(context)
                                            .push(const AboutUsRoute());
                                      },
                                      child: Text(
                                        ' Read More ',
                                        style: GoogleFonts.openSans(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: device.screenWidth < 1100
                                ? width * .3
                                : width * .4,
                            height: height,
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < listOfSlides.length; i++)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: _currentSlide == i ? 20 : 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: _currentSlide == i
                                    ? secondaryColor
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          )
                      ],
                    ),
                  ],
                )
              : Padding(
                  padding: EdgeInsets.all(width * .05),
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Be part of PART',
                              style: GoogleFonts.openSans(
                                fontSize: width * .1,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Column(
                              children: [
                                RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text:
                                            'We provide opportunities for global Educators to make a positive ',
                                        style: GoogleFonts.openSans(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '"imPART"',
                                        style: GoogleFonts.aBeeZee(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: secondaryColor,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            ' on their students, host schools, and local communities.',
                                        style: GoogleFonts.openSans(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ])),
                                const SizedBox(height: 20),
                                Text(
                                  'PART understands that experience matters. That\'s why we recruit highly qualified and experienced teachers',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.openSans(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: secondaryColor,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 20),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                ),
                                onPressed: () {
                                  ref
                                      .read(homeNavigationProvider.notifier)
                                      .state = Pages.about;
                                  AutoRouter.of(context)
                                      .push(const AboutUsRoute());
                                },
                                child: Text(
                                  ' Read More ',
                                  style: GoogleFonts.openSans(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < listOfSlides.length; i++)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: _currentSlide == i ? 20 : 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: _currentSlide == i
                                      ? secondaryColor
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            )
                        ],
                      ),
                    ],
                  ),
                ),
        ),
      ],
    );
  }
}
