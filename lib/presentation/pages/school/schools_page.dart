import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:part_website/config/routes/router.dart';
import 'package:part_website/generated/assets.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import '../../../global/functions.dart';
import '../../../global/widget/custom_button.dart';
import '../../../services/state/navigation_state.dart';
import '../../../utils/site_colors.dart';
import '../home/components/custom_app_bar.dart';
import '../home/sections/footer_section.dart';

@RoutePage()
class SchoolsPage extends ConsumerStatefulWidget {
  const SchoolsPage({super.key});

  @override
  ConsumerState<SchoolsPage> createState() => _SchoolsPageState();
}

class _SchoolsPageState extends ConsumerState<SchoolsPage> {
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
              children: [
                const SizedBox(height: 70),
                Container(
                  width: device.screenWidth,
                  height: 450,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(Assets.imagesTeach),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(height: 25),
                FutureBuilder(
                    future: rootBundle.loadString(Assets.docsSchool),
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      if (snapshot.hasData) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: device.isDesktop
                                  ? 180
                                  : device.isTablet
                                      ? 50
                                      : 20),
                          child: Markdown(
                            data: snapshot.data!,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            selectable: true,
                            styleSheet: MarkdownStyleSheet(
                              p: GoogleFonts.openSans(
                                fontSize: 16,
                              ),
                              h1: GoogleFonts.openSans(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                              h2: GoogleFonts.openSans(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                              h3: GoogleFonts.openSans(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                              h4: GoogleFonts.openSans(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                              h5: GoogleFonts.openSans(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                              h6: GoogleFonts.openSans(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              listBullet: GoogleFonts.openSans(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            onTapLink: (text, href, title) {
                              launch(href!, isNewTab: true);
                            },
                          ),
                        );
                      }
                      return SizedBox(
                        width: device.screenWidth,
                        height: device.screenHeight * 0.8,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }),
                Container(
                  width: device.screenWidth,
                  color: primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 20),
                    child: Center(
                        child: Column(children: [
                      Text('Are you Ready to Host a Teacher!',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                      Text(
                          'If you are interested in hosting a teacher, please contact us.',
                          style: GoogleFonts.openSans(
                            fontSize: 18,
                            color: Colors.white,
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
