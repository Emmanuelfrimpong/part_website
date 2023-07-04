import 'package:auto_animated/auto_animated.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:part_website/global/widget/custom_button.dart';
import 'package:part_website/utils/site_colors.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

import '../../../services/state/navigation_state.dart';
import '../home/components/custom_app_bar.dart';
import '../home/sections/footer_section.dart';

@RoutePage()
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
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

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var device = ResponsiveBreakpoints.of(context);

    return Scaffold(
      body: Stack(
        children: [
          // Positioned(top: 0, child: CustomAppBar()),
          AnimateIfVisibleWrapper(
            // Show each item through (default 250)
            controller: _scrollController,
            showItemInterval: const Duration(milliseconds: 200),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: device.screenWidth < 500 ? 80 : 120),
                    width: device.screenWidth <= 560
                        ? device.screenWidth * .9
                        : device.screenWidth > 560 && device.screenWidth <= 1000
                            ? device.screenWidth * .6
                            : device.screenWidth * .37,
                    padding: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 20),
                    color: primaryColor.withOpacity(.1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Login",
                          style: GoogleFonts.openSans(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Login to your account to continue",
                          style: GoogleFonts.openSans(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Password",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text("Forgot Password?"),
                            ),
                            CustomButton(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              onPressed: () {},
                              text: "Login",
                              icon: MdiIcons.login,
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        SocialLoginButton(
                          buttonType: SocialLoginButtonType.google,
                          onPressed: () {},
                        ),
                        const SizedBox(height: 10),
                        SocialLoginButton(
                          buttonType: SocialLoginButtonType.appleBlack,
                          onPressed: () {},
                        ),
                        const SizedBox(height: 10),
                        SocialLoginButton(
                          buttonType: SocialLoginButtonType.facebook,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  const FooterSection(),
                ],
              ),
            ),
          ),
          const Positioned(top: -5, left: -5, child: CustomAppBar()),
        ],
      ),
    );
  }
}
