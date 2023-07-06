import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:part_website/global/strings.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import '../../../../utils/site_colors.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    var device = ResponsiveBreakpoints.of(context);
    return Container(
      width: device.screenWidth,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(children: [
        Text(
          'PALMETTO AGENCY FOR RECRUITING TEACHERS - PART',
          style: GoogleFonts.openSans(
              fontSize: device.screenWidth * .025,
              fontWeight: FontWeight.bold,
              color: primaryColor),
        ),
        const SizedBox(height: 20),
        Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: infoList
                .map((e) => InfoItem(
                    title: e['title'],
                    description: e['description'],
                    image: e['image'],
                    list: e['list']))
                .toList())
      ]),
    );
  }
}

class InfoItem extends StatefulWidget {
  const InfoItem(
      {super.key,
      required this.title,
      required this.description,
      required this.image,
      required this.list});
  final String title;
  final String description;
  final String image;
  final List list;

  @override
  State<InfoItem> createState() => _InfoItemState();
}

class _InfoItemState extends State<InfoItem> {
  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
    var device = ResponsiveBreakpoints.of(context);
    return InkWell(
        onTap: () {},
        onHover: (value) {
          setState(() {
            _isHover = value;
          });
        },
        child: Container(
          width: device.screenWidth >= 800
              ? device.screenWidth * .4
              : device.screenWidth * .9,
          padding: const EdgeInsets.all(10),
          color: _isHover ? secondaryColor.withOpacity(.4) : Colors.transparent,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(widget.image, height: 150),
                const SizedBox(height: 10),
                Text(widget.title,
                    style: GoogleFonts.openSans(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: primaryColor)),
                const SizedBox(height: 10),
                if (widget.list.isNotEmpty)
                  ListTile(
                    title: Text(
                      widget.description,
                      style: GoogleFonts.openSans(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: widget.list
                            .map((e) => Row(
                                  children: [
                                    const Icon(
                                      Icons.check,
                                      color: primaryColor,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 5),
                                    Expanded(
                                      child: Text(
                                        e,
                                        style: GoogleFonts.openSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ))
                            .toList()),
                  ),
                if (widget.list.isEmpty)
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: widget.description,
                        style: GoogleFonts.openSans(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        )),
                    TextSpan(
                        text: '... Read More',
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        style: GoogleFonts.openSans(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: primaryColor))
                  ])),
                const SizedBox(height: 10),
              ]),
        ));
  }
}
