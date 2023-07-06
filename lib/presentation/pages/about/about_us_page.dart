import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:part_website/config/routes/router.dart';
import 'package:part_website/generated/assets.dart';
import 'package:part_website/global/enum.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import '../../../global/widget/custom_button.dart';
import '../../../services/state/navigation_state.dart';
import '../../../utils/site_colors.dart';
import '../home/components/actions.dart';
import '../home/components/custom_app_bar.dart';
import '../home/sections/footer_section.dart';

@RoutePage()
class AboutUsPage extends ConsumerStatefulWidget {
  const AboutUsPage({super.key});

  @override
  ConsumerState<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends ConsumerState<AboutUsPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // if widget is build, then do this
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.addListener(() {
        if (_scrollController.offset >= 2) {
          ref.read(appBarOpacityProvider.notifier).state = true;
        } else {
          ref.read(appBarOpacityProvider.notifier).state = false;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var device = ResponsiveBreakpoints.of(context);
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 70),
                Container(
                  width: device.screenWidth,
                  alignment: Alignment.bottomCenter,
                  height: 250,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(Assets.imagesAbout),
                          fit: BoxFit.cover)),
                  child: Container(
                    color: Colors.black.withOpacity(.7),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    child: Text('About Us',
                        style: GoogleFonts.openSans(
                            fontSize: device.screenWidth * .05,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: device.isMobile
                      ? device.screenWidth * .9
                      : device.screenWidth * .7,
                  child: Column(
                    children: [
                      Text(
                          "PART sponsors international teachers to teach in American schools—providing opportunities for global educators to make a positive \"imPART\" on their students, host schools, and local communities. PART partners with school districts to select the right teachers to teach in their schools, not only helping districts by recruiting qualified teachers to teach needed subjects, but also introducing students to a more globally connected world.",
                          style: GoogleFonts.openSans(
                            fontSize: 20,
                          )),
                      const SizedBox(height: 10),
                      Text(
                          "PART understands that experience matters. That's why we recruit highly qualified and experienced teachers—rigorously screening potential teachers to find the best fit for both the school district and the exchange teachers. Having a diverse and talented teaching faculty allows us to enrich and empower the global community one classroom at a time.",
                          style: GoogleFonts.openSans(
                            fontSize: 20,
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Card(
                  color: Colors.grey[200],
                  child: SizedBox(
                    width: device.isMobile
                        ? device.screenWidth * .9
                        : device.screenWidth * .7,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 40),
                      child: Column(children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text:
                                  'If you are a school official interested in learning more about what PART has to offer, please visit our ',
                              style: GoogleFonts.openSans(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                  color: primaryColor)),
                          TextSpan(
                              text: 'Host a Teacher',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  AutoRouter.of(context)
                                      .push(const SchoolsRoute());
                                },
                              style: GoogleFonts.openSans(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 3,
                                  color: primaryColor)),
                          TextSpan(
                              text: 'page.',
                              style: GoogleFonts.openSans(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                  color: primaryColor)),
                        ])),
                        const SizedBox(height: 20),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text:
                                  'If you are a teacher outside the United States and are interested in teaching in America, please visit our ',
                              style: GoogleFonts.openSans(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                  color: primaryColor)),
                          TextSpan(
                              text: 'Teach in the USA',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  AutoRouter.of(context)
                                      .push(const TeacherRoute());
                                },
                              style: GoogleFonts.openSans(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 3,
                                  color: primaryColor)),
                          TextSpan(
                              text:
                                  'section to learn about the benefits and requirements.',
                              style: GoogleFonts.openSans(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                  color: primaryColor)),
                        ]))
                      ]),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const ActionsPart(),
                SizedBox(
                  width: device.screenWidth,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 20),
                    child: Center(
                        child: Column(children: [
                      Text('Get in touch with us!',
                          style: GoogleFonts.openSans(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                      Text(
                          'If you have any questions, please feel free to contact us.',
                          style: GoogleFonts.openSans(
                            fontSize: 18,
                          )),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 200,
                        child: CustomButton(
                            text: 'Contact Us',
                            icon: Icons.arrow_forward,
                            color: secondaryColor,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            radius: 0,
                            onPressed: () {
                              ref.read(homeNavigationProvider.notifier).state =
                                  Pages.contact;
                              AutoRouter.of(context)
                                  .push(const ContactUsRoute());
                            }),
                      )
                    ])),
                  ),
                ),
                const FooterSection(),
              ],
            ),
          ),
          const Positioned(top: -5, left: -5, child: CustomAppBar()),
        ],
      ),
    );
  }
}
