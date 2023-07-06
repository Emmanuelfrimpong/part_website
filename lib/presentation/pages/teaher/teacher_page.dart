import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:part_website/presentation/pages/teaher/sections/qualification.dart';
import 'package:part_website/presentation/pages/teaher/sections/subject_section.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import '../../../generated/assets.dart';
import '../../../services/state/navigation_state.dart';
import '../../../utils/site_colors.dart';
import '../home/components/custom_app_bar.dart';
import '../home/sections/footer_section.dart';
import 'sections/benefits.dart';
import 'sections/cost_section.dart';
import 'sections/init_section.dart';

@RoutePage()
class TeacherPage extends ConsumerStatefulWidget {
  const TeacherPage({super.key});

  @override
  ConsumerState<TeacherPage> createState() => _TeacherPageState();
}

class _TeacherPageState extends ConsumerState<TeacherPage> {
  final ScrollController _scrollController = ScrollController();

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

  List<Map<String, dynamic>> titles = [
    {
      'title': 'The Benefits',
      'icon': Assets.iconsBenefits,
    },
    {
      'title': 'Qualifications',
      'icon': Assets.iconsQualification,
    },
    {
      'title': 'Subject Areas',
      'icon': Assets.iconsSubject,
    },
    {
      'title': 'Expected Cost',
      'icon': Assets.iconsCost,
    },
  ];

  List<Map<String, dynamic>> data = [
    {
      'widget': BenefitsSection(),
      'key': GlobalKey(),
    },
    {
      'widget': QualificationSection(),
      'key': GlobalKey(),
    },
    {
      'widget': SubjectSection(),
      'key': GlobalKey(),
    },
    {
      'widget': CostSection(),
      'key': GlobalKey(),
    },
  ];
  final GlobalKey _initKey = GlobalKey();
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () => scrollToSection(_initKey),
        child: const Icon(Icons.arrow_upward, color: primaryColor),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const SizedBox(height: 100),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: device.screenWidth * 0.2,
                        margin: const EdgeInsets.symmetric(vertical: 40),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: primaryColor,
                          ),
                        ),
                        child: Column(children: [
                          Container(
                            color: primaryColor,
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            alignment: Alignment.center,
                            child: Text('Sections',
                                style: GoogleFonts.openSans(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )),
                          ),
                          for (var i = 0; i < titles.length; i++)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: InkWell(
                                onTap: () => scrollToSection(data[i]['key']),
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
                                          child: Text(titles[i]['title'],
                                              style: GoogleFonts.openSans(
                                                fontSize:
                                                    device.screenWidth < 1100
                                                        ? 14
                                                        : 16,
                                                fontWeight: FontWeight.bold,
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
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InitSection(
                              key: _initKey,
                            ),
                            for (var item in data)
                              SizedBox(
                                key: item['key'],
                                child: item['widget'],
                              )
                          ],
                        ),
                      )),
                    ],
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
