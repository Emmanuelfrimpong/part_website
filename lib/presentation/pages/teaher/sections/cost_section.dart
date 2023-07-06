import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:part_website/utils/site_colors.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class CostSection extends StatelessWidget {
  CostSection({super.key});

  final List<String> list1 = [
    "NACES-member credential evaluation: \$220-\$280",
    "J-1 application fee: \$185, non-refundable and payable directly to the U.S. Consulate",
    "SEVIS fee: \$220",
    "Criminal background checks (cost varies based upon country of origin)",
    "Exams for English proficiency: \$100-\$200",
    "Medical exams (cost varies based on country of origin)",
    "TB tests (cost varies based on country of origin)",
    "COVID-19 tests (cost varies based on country of origin)",
  ];

  final List<String> list2 = [
    "The School district that hires them",
    "Their degree(s) as evaluated by the credential evaluation service",
    "Their year(s) of experience at an accredited K-12 school after receiving the equivalent of a U.S. Bachelor’s in Education",
  ];
  final List<String> list3 = [
    "Rent: \$750-\$2,000 depending on the area and type of housing",
    "Food: \$500-\$1,500",
    "Utilities, cellphone, wifi, etc.: \$100 - \$1,000",
    "Car/transportation: \$250-\$1,000",
    "Health insurance: \$55-\$400 (depending on size of family)",
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
              for (var i in list1)
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: const Icon(Icons.check,
                            color: primaryColor, size: 20),
                      ),
                      Expanded(
                        child: Text(
                          i,
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
            ],
          ),
        ),
        ListTile(
          title: Text(
            'Salary',
            style: GoogleFonts.openSans(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Teachers are paid the equivalent salary to a similarly situated American educator, based upon: ',
                style: GoogleFonts.openSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(.7),
                ),
              ),
              const SizedBox(height: 10),
              for (int i = 0; i < list2.length; i++)
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: Text('${i + 1}  )',
                            style: GoogleFonts.openSans(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: primaryColor,
                            )),
                      ),
                      Expanded(
                        child: Text(
                          list2[i],
                          style: GoogleFonts.openSans(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(.7),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 10),
              Text(
                "Salaries range from \$35,000 to \$85,000 per year depending on these factors.",
                style: GoogleFonts.openSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(.7),
                ),
              )
            ],
          ),
        ),
        ListTile(
          title: Text(
            'Taxes',
            style: GoogleFonts.openSans(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            'Salaries in the United States are subject to federal and state income taxes and withholdings and Federal Insurance Contributions Act (FICA) Deductions. Taxes may range from 15-35% of salary depending a number of factors. Based on your country of citizenship, you may be eligible for certain tax treaty benefits.',
            style: GoogleFonts.openSans(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.black.withOpacity(.7),
            ),
          ),
        ),
        ListTile(
          title: Text(
            'Health insurance',
            style: GoogleFonts.openSans(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            'Teachers are offered comprehensive medical insurance that includes medical evacuation, repatriation, and sickness/accident coverage, in line with U.S. Department of State requirements. Health insurance costs vary from \$55-\$400 per month depending on the size of your family. Additionally, the health insurance does include some member cost when receiving services, in line with the Department of State limitations. J-1 teachers are responsible for monthly health insurance premiums for their J-2 dependents. ',
            style: GoogleFonts.openSans(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.black.withOpacity(.7),
            ),
          ),
        ),
        ListTile(
          title: Text(
            'Typical monthly expenses',
            style: GoogleFonts.openSans(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Monthly expenses for a family of three are: ',
                style: GoogleFonts.openSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(.7),
                ),
              ),
              const SizedBox(height: 10),
              for (var i in list3)
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: const Icon(Icons.check,
                            color: primaryColor, size: 20),
                      ),
                      Expanded(
                        child: Text(
                          i,
                          style: GoogleFonts.openSans(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(.7),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 10),
              Text(
                "We also ask that teachers take into consideration the cost of childcare if you are bringing small children with you to the U.S.",
                style: GoogleFonts.openSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(.7),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
