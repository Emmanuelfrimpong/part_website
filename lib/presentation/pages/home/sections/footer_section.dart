import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:part_website/utils/site_colors.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import '../../../../generated/assets.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    var device = ResponsiveBreakpoints.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: device.screenWidth,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.imagesFooter),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              alignment: Alignment.center,
              color: primaryColor.withOpacity(0.8),
              child: Column(
                children: [
                  if (device.screenWidth < 900)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            Assets.logoLogoWhite,
                            width: device.screenWidth * 0.3,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'About Us'.toUpperCase(),
                          style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          width: 60,
                          height: 4,
                          color: secondaryColor,
                        ),
                        const SizedBox(height: 10),
                        RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(children: [
                              TextSpan(
                                  text:
                                      'If you are a school official interested in learning more about what PART has to offer, please visit our ',
                                  style: GoogleFonts.openSans(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  )),
                              TextSpan(
                                  text: 'host a teacher page.',
                                  style: GoogleFonts.openSans(
                                    color: secondaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // navigate to host a teacher page
                                    }),
                            ])),
                        const SizedBox(height: 10),
                        RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(children: [
                              TextSpan(
                                  text:
                                      'If you are a teacher outside the United States and are interested in teaching in America, please visit our ',
                                  style: GoogleFonts.openSans(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  )),
                              TextSpan(
                                  text: 'Teach in the USA ',
                                  style: GoogleFonts.openSans(
                                    color: secondaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // navigate to teach in the USA page
                                    }),
                              TextSpan(
                                  text:
                                      'section to learn about the benefits and requirements.',
                                  style: GoogleFonts.openSans(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  )),
                            ])),
                        const SizedBox(height: 25),
                        Text(
                          'Get in Touch'.toUpperCase(),
                          style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          width: 60,
                          height: 4,
                          color: secondaryColor,
                        ),
                        const SizedBox(height: 10),
                        ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          leading: const Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 30,
                          ),
                          title: Text(
                            'Address',
                            style: GoogleFonts.openSans(
                              color: secondaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            'COLUMBIA – SOUTH CAROLINA',
                            style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          leading: const Icon(
                            Icons.phone,
                            color: Colors.white,
                            size: 30,
                          ),
                          title: Text(
                            'Phone',
                            style: GoogleFonts.openSans(
                              color: secondaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // call the number
                                },
                                child: Text(
                                  '803-389-1947',
                                  style: GoogleFonts.openSans(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              GestureDetector(
                                onTap: () {
                                  // call the number
                                },
                                child: Text(
                                  '734-695-9462',
                                  style: GoogleFonts.openSans(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              GestureDetector(
                                onTap: () {
                                  // call the number
                                },
                                child: Text(
                                  '803-917-4874',
                                  style: GoogleFonts.openSans(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          leading: const Icon(
                            Icons.email,
                            color: Colors.white,
                            size: 30,
                          ),
                          title: Text(
                            'Email',
                            style: GoogleFonts.openSans(
                              color: secondaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: GestureDetector(
                            onTap: () {
                              // send email
                            },
                            child: Text(
                              'PARTLLC2023@GMAIL.COM',
                              style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (device.screenWidth >= 900)
                    SizedBox(
                      height: 350,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Image.asset(
                              Assets.logoLogoWhite,
                              width: device.screenWidth * 0.2,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'About Us'.toUpperCase(),
                                    style: GoogleFonts.openSans(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    width: 60,
                                    height: 4,
                                    color: secondaryColor,
                                  ),
                                  const SizedBox(height: 10),
                                  RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text:
                                                'If you are a school official interested in learning more about what PART has to offer, please visit our ',
                                            style: GoogleFonts.openSans(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            )),
                                        TextSpan(
                                            text: 'host a teacher page.',
                                            style: GoogleFonts.openSans(
                                              color: secondaryColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                // navigate to host a teacher page
                                              }),
                                      ])),
                                  const SizedBox(height: 10),
                                  RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text:
                                                'If you are a teacher outside the United States and are interested in teaching in America, please visit our ',
                                            style: GoogleFonts.openSans(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            )),
                                        TextSpan(
                                            text: 'Teach in the USA ',
                                            style: GoogleFonts.openSans(
                                              color: secondaryColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                // navigate to teach in the USA page
                                              }),
                                        TextSpan(
                                            text:
                                                'section to learn about the benefits and requirements.',
                                            style: GoogleFonts.openSans(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            )),
                                      ])),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Get in Touch'.toUpperCase(),
                                      style: GoogleFonts.openSans(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Container(
                                      width: 60,
                                      height: 4,
                                      color: secondaryColor,
                                    ),
                                    const SizedBox(height: 10),
                                    ListTile(
                                      leading: const Icon(
                                        Icons.location_on,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      title: Text(
                                        'Address',
                                        style: GoogleFonts.openSans(
                                          color: secondaryColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      subtitle: Text(
                                        'COLUMBIA – SOUTH CAROLINA',
                                        maxLines: 1,
                                        style: GoogleFonts.openSans(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    ListTile(
                                      leading: const Icon(
                                        Icons.phone,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      title: Text(
                                        'Phone',
                                        style: GoogleFonts.openSans(
                                          color: secondaryColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              // call the number
                                            },
                                            child: Text(
                                              '803-389-1947',
                                              style: GoogleFonts.openSans(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          GestureDetector(
                                            onTap: () {
                                              // call the number
                                            },
                                            child: Text(
                                              '734-695-9462',
                                              style: GoogleFonts.openSans(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          GestureDetector(
                                            onTap: () {
                                              // call the number
                                            },
                                            child: Text(
                                              '803-917-4874',
                                              style: GoogleFonts.openSans(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    ListTile(
                                      leading: const Icon(
                                        Icons.email,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      title: Text(
                                        'Email',
                                        style: GoogleFonts.openSans(
                                          color: secondaryColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      subtitle: GestureDetector(
                                        onTap: () {
                                          // send email
                                        },
                                        child: Text(
                                          'PARTLLC2023@GMAIL.COM',
                                          maxLines: 1,
                                          style: GoogleFonts.openSans(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ]),
                    )
                ],
              )),
        ),
        Container(
            color: primaryColor,
            width: device.screenWidth,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '© 2023 - All rights reserved',
                  style: GoogleFonts.openSans(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  'Developed by Fussion Teck',
                  style: GoogleFonts.openSans(
                    color: Colors.white54,
                    fontSize: 12,
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
