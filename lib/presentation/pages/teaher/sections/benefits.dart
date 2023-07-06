import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:part_website/utils/site_colors.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class BenefitsSection extends StatelessWidget {
  BenefitsSection({super.key});
  final List<String> benefits = [
    "Expand your horizons by teaching abroad and learning new perspectives",
    "No cost for visa sponsorship",
    "Earn a salary equivalent to that of a similarly-situated American educator",
    "Gain professional development opportunities through PART’s free professional development both before your arrival and throughout your time in the U.S., as well as through your school and district",
    "Pre-departure and post-arrival orientation and relocation support",
    "Comprehensive health insurance that meets Department of State requirements",
    "Sponsorship for qualified dependents under the J-2 visa at no cost",
    "Embark on the journey of a lifetime and return home to pass your learnings along to your students, friends, and family"
  ];
  @override
  Widget build(BuildContext context) {
    var device = ResponsiveBreakpoints.of(context);
    return Container(
      width: device.screenWidth,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: const EdgeInsets.only(right: 30),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('THE BENEFITS',
            style: GoogleFonts.openSans(
              fontSize: device.isMobile ? 25 : 40,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            )),
        const SizedBox(height: 25),
        for (var benefit in benefits)
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: Icon(Icons.check, color: primaryColor, size: 20),
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
