import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:part_website/utils/site_colors.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class CostSection extends StatelessWidget {
   CostSection({super.key});


  final List<String> list1=[
                "NACES-member credential evaluation: \$220-\$280",
                "J-1 application fee: \$185, non-refundable and payable directly to the U.S. Consulate",
                "SEVIS fee: \$220",
                "Criminal background checks (cost varies based upon country of origin)",
                "Exams for English proficiency: \$100-\$200",
                "Medical exams (cost varies based on country of origin)",
                "TB tests (cost varies based on country of origin)",
                "COVID-19 tests (cost varies based on country of origin)",
              ];
  @override
  Widget build(BuildContext context) {
    var device = ResponsiveBreakpoints.of(context);
    return Container(
      width: device.screenWidth,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: const EdgeInsets.only(right: 30),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('EXPECTED COSTS',
            style: GoogleFonts.openSans(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            )),
        const SizedBox(height: 25),
        Text(
          'PART do NOT charge teachers any fees for sponsorship and does not work with any third parties who charge fees to prospective Exchange Visitors. However, there are other expenses that may apply to you for joining the program for teachers to be aware of and prepare for (all costs listed as U.S. dollars). ',
          style: GoogleFonts.openSans(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.black.withOpacity(.7),
          ),
        ),
        const SizedBox(height: 25),
        ListTile(
          title: Text(
            'Initial expenses',
            style: GoogleFonts.openSans(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          subtitle: Column(
            children: [
              Text(
                'Applicants to the program may incur some personal costs for their collection of documents necessary to prove eligibility for a J-1 visa, including but not limited to: ',
                style: GoogleFonts.openSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(.7),
                ),
              ),
              const SizedBox(height: 10),
              .map((e) => Text(e)).toList(),
             

              
            ],
          ),
        ),
      ]),
    );
  }
}
