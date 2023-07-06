import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:part_website/utils/site_colors.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class QualificationSection extends StatelessWidget {
  QualificationSection({super.key});
  final List<String> benefits = [
    "Demonstrate an active interest in cultural exchange and an understanding of the cultural exchange program",
    "	Have the equivalent of a 4-year U.S. Bachelor’s in Education, as evaluated by a NACES-member organization",
    "	Have at least 2 years of full-time, K-12 lead classroom teacher experience",
    "	Meet the qualifications to be certified as a teacher in the U.S. state in which they will be teaching",
    "	Be currently working as a teacher",
    "	Be of good reputation and character",
    "	Be fluent in English. ",
  ];
  @override
  Widget build(BuildContext context) {
    var device = ResponsiveBreakpoints.of(context);
    return Container(
      width: device.screenWidth,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: const EdgeInsets.only(right: 30),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('QUALIFICATIONS',
            style: GoogleFonts.openSans(
              fontSize: device.isMobile ? 25 : 40,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            )),
        const SizedBox(height: 25),
        Text(
          'Teacher must: ',
          style: GoogleFonts.openSans(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.black.withOpacity(.7),
          ),
        ),
        for (var benefit in benefits)
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: const Icon(Icons.check, color: primaryColor, size: 20),
                ),
                Expanded(
                  child: Text(
                    benefit,
                    style: GoogleFonts.openSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(.7),
                    ),
                  ),
                ),
              ],
            ),
          )
      ]),
    );
  }
}
