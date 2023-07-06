import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:part_website/generated/assets.dart';
import 'package:part_website/global/widget/custom_drop_down.dart';
import 'package:part_website/global/widget/custom_input.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import '../../../global/strings.dart';
import '../../../global/widget/custom_button.dart';
import '../../../services/state/navigation_state.dart';
import '../../../utils/site_colors.dart';
import '../home/components/actions.dart';
import '../home/components/custom_app_bar.dart';
import '../home/sections/footer_section.dart';

@RoutePage()
class ContactUsPage extends ConsumerStatefulWidget {
  const ContactUsPage({super.key});

  @override
  ConsumerState<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends ConsumerState<ContactUsPage> {
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 70),
                SizedBox(
                  width: device.screenWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: device.screenWidth,
                        height: 250,
                        alignment: Alignment.bottomCenter,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(Assets.imagesContact),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          color: Colors.black.withOpacity(.7),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),
                          child: Text(
                            'Contact Us',
                            style: GoogleFonts.openSans(
                              fontSize: device.screenWidth * .05,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      SizedBox(
                        width: device.screenWidth > 900 &&
                                device.screenWidth < 1200
                            ? device.screenWidth * .75
                            : device.screenWidth > 1200
                                ? device.screenWidth * .5
                                : device.screenWidth * .9,
                        child: Text(
                          'If you are a prospective teacher with aspirations of teaching in America, a school district looking for a new perspective in the classroom, or if you are just curious about what we do, please do not hesitate to get in touch with us. We are happy to answer your questions.',
                          style: GoogleFonts.openSans(),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Container(
                          width: device.screenWidth > 900 &&
                                  device.screenWidth < 1200
                              ? device.screenWidth * .75
                              : device.screenWidth > 1200
                                  ? device.screenWidth * .5
                                  : device.screenWidth * .9,
                          color: Colors.grey.withOpacity(.2),
                          padding: const EdgeInsets.symmetric(
                              vertical: 40, horizontal: 20),
                          child: Column(
                            children: [
                              ListTile(
                                title: Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: Text(
                                    'Name',
                                    style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                subtitle: device.screenWidth > 670
                                    ? Row(
                                        children: [
                                          Expanded(
                                            child: CustomTextFields(
                                              hintText: 'Enter First Name',
                                              onSaved: (name) {},
                                              validator: (name) {
                                                if (name!.isEmpty) {
                                                  return 'Please enter your name';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: CustomTextFields(
                                              hintText: 'Enter Last Name',
                                              onSaved: (name) {},
                                              validator: (name) {
                                                if (name!.isEmpty) {
                                                  return 'Please enter your name';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ],
                                      )
                                    : Column(
                                        children: [
                                          CustomTextFields(
                                            hintText: 'Enter First Name',
                                            onSaved: (name) {},
                                            validator: (name) {
                                              if (name!.isEmpty) {
                                                return 'Please enter your name';
                                              }
                                              return null;
                                            },
                                          ),
                                          const SizedBox(height: 10),
                                          CustomTextFields(
                                            hintText: 'Enter Last Name',
                                            onSaved: (name) {},
                                            validator: (name) {
                                              if (name!.isEmpty) {
                                                return 'Please enter your name';
                                              }
                                              return null;
                                            },
                                          ),
                                        ],
                                      ),
                              ),
                              const SizedBox(height: 20),
                              ListTile(
                                title: Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: Text(
                                    'Email',
                                    style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                subtitle: CustomTextFields(
                                  hintText: 'Enter Email',
                                  onSaved: (name) {},
                                  validator: (name) {
                                    if (name!.isEmpty ||
                                        !RegExp(emailReg).hasMatch(name)) {
                                      return 'Please enter a valid email';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                              ListTile(
                                  title: Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: Text('Subject',
                                        style: GoogleFonts.openSans(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  subtitle: CustomDropDown(
                                      hintText: 'Select Subject',
                                      onChanged: (p0) {},
                                      items: [
                                        "I represent a South Carolina school district and I am interested in hosting a PACT teacher.",
                                        "I have applied to become a PACT teacher and I have a question about my application.",
                                        "I have a general question about PACT.",
                                      ]
                                          .map((e) => DropdownMenuItem(
                                              value: e, child: Text(e)))
                                          .toList())),
                              const SizedBox(height: 20),
                              ListTile(
                                title: Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: Text(
                                    'Message',
                                    style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                subtitle: CustomTextFields(
                                  hintText: 'Enter Message',
                                  maxLines: 6,
                                  onSaved: (name) {},
                                  validator: (name) {
                                    if (name!.isEmpty) {
                                      return 'Please enter your message';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                              CustomButton(
                                text: 'Submit Message',
                                onPressed: () {},
                                color: primaryColor,
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                const ActionsPart(),
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
