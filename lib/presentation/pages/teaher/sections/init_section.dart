import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:part_website/utils/site_colors.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class InitSection extends StatelessWidget {
  const InitSection({super.key});

  @override
  Widget build(BuildContext context) {
    var device = ResponsiveBreakpoints.of(context);
    return Container(
      width: device.screenWidth,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: const EdgeInsets.only(right: 30),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('FOR TEACHERS (TEACH IN THE US)',
            style: GoogleFonts.openSans(
              fontSize: device.isMobile ? 25 : 40,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            )),
        const SizedBox(height: 25),
        Text(
          'Embark on a cultural exchange journey to the United States alongside PART Cultural Exchange. We will be with you every step of the way, making sure it’s a rewarding experience both professionally and personally.',
          style: GoogleFonts.openSans(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.black.withOpacity(.7),
          ),
        ),
        const SizedBox(height: 20),
        Text(
            'PART is an official J-1 visa sponsor for teacher exchange visitors, designated by the U.S. Department of State. PART has supported thousands of teachers for more than a decade to realize their dreams of teaching in the United States. ',
            style: GoogleFonts.openSans(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.black.withOpacity(.7),
            )),
        const SizedBox(height: 20),
        Text(
            'Teachers can engage in the cultural exchange program for up to 5 years: the initial visa is issued for 3 years, and at the conclusion of the 3 years, teachers can request an extension for 2 more years for a total of 5 years. At the conclusion of the program, educators are required to return to their home countries for a minimum of two years before returning to the U.S. on the J-1 non-immigrant  visa.',
            style: GoogleFonts.openSans(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.black.withOpacity(.7),
            )),
        Container(
          color: Colors.grey.withOpacity(.2),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: ListTile(
            title: Text(
              'Note:',
              style: GoogleFonts.openSans(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              'PART do NOT charge any fees for sponsorship and does NOT work with any third parties who charge fees to prospective Exchange Visitors.',
              style: GoogleFonts.openSans(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black.withOpacity(.7),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
