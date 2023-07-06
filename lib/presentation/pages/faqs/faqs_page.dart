import 'package:auto_animated/auto_animated.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:part_website/generated/assets.dart';
import 'package:part_website/global/enum.dart';
import 'package:part_website/global/widget/custom_button.dart';
import 'package:part_website/utils/site_colors.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import '../../../config/routes/router.dart';
import '../../../global/functions.dart';
import '../../../services/state/navigation_state.dart';
import '../home/components/actions.dart';
import '../home/components/custom_app_bar.dart';
import '../home/sections/footer_section.dart';

@RoutePage()
class FAQSPage extends ConsumerStatefulWidget {
  const FAQSPage({super.key});

  @override
  ConsumerState<FAQSPage> createState() => _FAQSPageState();
}

class _FAQSPageState extends ConsumerState<FAQSPage> {
  final ScrollController _scrollController = ScrollController();

  List<Map<String, dynamic>> mdFiles = [
    {
      'md': Assets.docsProcess,
      'key': GlobalKey(),
    },
    {
      'md': Assets.docsEligeble,
      'key': GlobalKey(),
    },
    {
      'md': Assets.docsTeaching,
      'key': GlobalKey(),
    },
    {
      'md': Assets.docsFinance,
      'key': GlobalKey(),
    },
    {
      'md': Assets.docsVisa,
      'key': GlobalKey(),
    },
    {
      'md': Assets.docsDriving,
      'key': GlobalKey(),
    },
  ];
  List<Map<String, dynamic>> titles = [
    {
      'title': 'Application Process',
      'icon': Assets.iconsProcess,
    },
    {
      'title': 'Eligibility',
      'icon': Assets.iconsEligible,
    },
    {
      'title': 'Teaching',
      'icon': Assets.iconsTraining,
    },
    {
      'title': 'Finance & Benefits',
      'icon': Assets.iconsBenefits,
    },
    {
      'title': 'Visa Sponsorship',
      'icon': Assets.iconsVisa,
    },
    {
      'title': 'Driving',
      'icon': Assets.iconsDriving,
    },
  ];

  void scrollToSection(GlobalKey sectionKey) {
    final RenderObject? renderObject =
        sectionKey.currentContext?.findRenderObject();
    if (renderObject is RenderBox) {
      final RenderAbstractViewport viewport =
          RenderAbstractViewport.of(renderObject);
      final RevealedOffset offsetToReveal =
          viewport.getOffsetToReveal(renderObject, 0.0);
      _scrollController.animateTo(
        offsetToReveal.offset - 50,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

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
    if (device.screenWidth < 1000) {
      return const SmallScreenFAQPage();
    } else {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            _scrollController.animateTo(
              0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          },
          child: const Icon(Icons.arrow_upward, color: primaryColor),
        ),
        body: Stack(
          children: [
            AnimateIfVisibleWrapper(
              controller: _scrollController,
              showItemInterval: const Duration(milliseconds: 200),
              child: SingleChildScrollView(
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
                            'Frequently Asked Questions',
                            style: GoogleFonts.openSans(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: device.screenWidth * 0.2,
                                margin:
                                    const EdgeInsets.symmetric(vertical: 40),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: primaryColor,
                                  ),
                                ),
                                child: Column(children: [
                                  Container(
                                    color: primaryColor,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    alignment: Alignment.center,
                                    child: Text('Contents',
                                        style: GoogleFonts.openSans(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        )),
                                  ),
                                  for (var i = 0; i < titles.length; i++)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: InkWell(
                                        onTap: () =>
                                            scrollToSection(mdFiles[i]['key']),
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: primaryColor,
                                              ),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 15),
                                            child: Row(
                                              children: [
                                                Image.asset(titles[i]['icon'],
                                                    width: 30, height: 30),
                                                const SizedBox(width: 10),
                                                Expanded(
                                                  child: Text(
                                                      titles[i]['title'],
                                                      style:
                                                          GoogleFonts.openSans(
                                                        fontSize:
                                                            device.screenWidth <
                                                                    1100
                                                                ? 14
                                                                : 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: primaryColor,
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                ]),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                  child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    for (var item in mdFiles)
                                      FAQItem(
                                        key: item['key'],
                                        mdFile: item['md'],
                                      ),
                                  ],
                                ),
                              )),
                            ],
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
            ),
            const Positioned(top: -5, left: -5, child: CustomAppBar()),
          ],
        ),
      );
    }
  }
}

class SmallScreenFAQPage extends ConsumerStatefulWidget {
  const SmallScreenFAQPage({super.key});

  @override
  ConsumerState<SmallScreenFAQPage> createState() => _SmallScreenFAQPageState();
}

class _SmallScreenFAQPageState extends ConsumerState<SmallScreenFAQPage> {
  List<Map<String, dynamic>> mdFiles = [
    {
      'md': Assets.docsProcess,
      'key': GlobalKey(),
    },
    {
      'md': Assets.docsEligeble,
      'key': GlobalKey(),
    },
    {
      'md': Assets.docsTeaching,
      'key': GlobalKey(),
    },
    {
      'md': Assets.docsFinance,
      'key': GlobalKey(),
    },
    {
      'md': Assets.docsVisa,
      'key': GlobalKey(),
    },
    {
      'md': Assets.docsDriving,
      'key': GlobalKey(),
    },
  ];
  List<Map<String, dynamic>> titles = [
    {
      'title': 'Application Process',
      'icon': Assets.iconsProcess,
    },
    {
      'title': 'Eligibility',
      'icon': Assets.iconsEligible,
    },
    {
      'title': 'Teaching',
      'icon': Assets.iconsTraining,
    },
    {
      'title': 'Finance & Benefits',
      'icon': Assets.iconsBenefits,
    },
    {
      'title': 'Visa Sponsorship',
      'icon': Assets.iconsVisa,
    },
    {
      'title': 'Driving',
      'icon': Assets.iconsDriving,
    },
  ];
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _key = GlobalKey();
  void scrollToSection(GlobalKey sectionKey) {
    final RenderObject? renderObject =
        sectionKey.currentContext?.findRenderObject();
    if (renderObject is RenderBox) {
      final RenderAbstractViewport viewport =
          RenderAbstractViewport.of(renderObject);
      final RevealedOffset offsetToReveal =
          viewport.getOffsetToReveal(renderObject, 0.0);
      _scrollController.animateTo(
        offsetToReveal.offset - 50,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

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
    final device = ResponsiveBreakpoints.of(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            isExtended: true,
            backgroundColor: Colors.white,
            onPressed: () {
              scrollToSection(_key);
            },
            child: const Icon(
              Icons.arrow_upward,
              color: primaryColor,
            )),
        body: Stack(children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                SizedBox(
                  key: _key,
                  height: device.isMobile ? 50 : 70,
                ),
                Container(
                  width: device.screenWidth,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: primaryColor,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        color: primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.center,
                        child: Text('Contents',
                            style: GoogleFonts.openSans(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                      ),
                      Wrap(
                        children: [
                          for (var i = 0; i < titles.length; i++)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: InkWell(
                                onTap: () => scrollToSection(mdFiles[i]['key']),
                                child: SizedBox(
                                  width: device.isMobile
                                      ? device.screenWidth * 0.9
                                      : 220,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Row(
                                      children: [
                                        Image.asset(titles[i]['icon'],
                                            width: 30, height: 30),
                                        const SizedBox(width: 10),
                                        Text(titles[i]['title'],
                                            style: GoogleFonts.openSans(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: primaryColor,
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                for (var item in mdFiles)
                  FAQItem(
                    key: item['key'],
                    mdFile: item['md'],
                  ),
                const ActionsPart(),
                SizedBox(
                  width: device.screenWidth,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 15),
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
        ]));
  }
}

class FAQItem extends StatelessWidget {
  const FAQItem({super.key, required this.mdFile});
  final String mdFile;

  @override
  Widget build(BuildContext context) {
    var device = ResponsiveBreakpoints.of(context);
    return Container(
      width: device.screenWidth,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: FutureBuilder(
          future: rootBundle.loadString(mdFile),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
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
                      color: Colors.black,
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
    );
  }
}
