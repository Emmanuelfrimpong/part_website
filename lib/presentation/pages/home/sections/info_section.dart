import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import '../../../../utils/site_colors.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    var device = ResponsiveBreakpoints.of(context);
    return Container(
      width: device.screenWidth,
      height: 500,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: Column(children: [
        Text(
          'PALMETTO AGENCY FOR RECRUITING TEACHERS - PART',
          style: GoogleFonts.openSans(
              fontSize: device.screenWidth * .025,
              fontWeight: FontWeight.bold,
              color: primaryColor),
        )
      ]),
    );
  }
}
