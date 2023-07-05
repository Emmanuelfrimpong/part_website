import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import '../../../global/widget/custom_button.dart';
import '../../../services/state/navigation_state.dart';
import '../../../utils/site_colors.dart';
import '../home/components/actions.dart';
import '../home/components/custom_app_bar.dart';
import '../home/sections/footer_section.dart';

@RoutePage()
class TeacherPage extends ConsumerStatefulWidget {
  const TeacherPage({super.key});

  @override
  ConsumerState<TeacherPage> createState() => _TeacherPageState();
}

class _TeacherPageState extends ConsumerState<TeacherPage> {
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
                const SizedBox(height: 100),
                Container(
                  width: device.screenWidth,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Contact Us',
                        style: GoogleFonts.openSans(
                          fontSize: device.screenWidth * .02,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
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
                            onPressed: () {}),
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
