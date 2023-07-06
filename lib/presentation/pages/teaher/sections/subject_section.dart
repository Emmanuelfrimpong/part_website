import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:part_website/utils/site_colors.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class SubjectSection extends StatelessWidget {
  SubjectSection({super.key});
  final List<String> benefits = [
    "Special education;",
    "Math;",
    "Science (general science, biology, chemistry, physics, etc.);",
    "Elementary;",
    "Reading/Literacy;",
    "English Language Arts;",
    "ESOL;",
    "World Languages (Spanish, French, etc.);",
    "Social Studies;",
    "& more",
  ];
  @override
  Widget build(BuildContext context) {
    var device = ResponsiveBreakpoints.of(context);
    return Container(
      width: device.screenWidth,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: const EdgeInsets.only(right: 30),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('SUBJECTS AREAS',
            style: GoogleFonts.openSans(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            )),
        const SizedBox(height: 25),
        Text(
          'PART engages with K-12 educators in a variety of backgrounds, including: ',
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
