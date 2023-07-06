import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:part_website/global/widget/custom_button.dart';
import 'package:part_website/global/widget/custom_drop_down.dart';
import 'package:part_website/global/widget/custom_input.dart';
import 'package:part_website/utils/site_colors.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import '../../../global/strings.dart';
import '../home/components/custom_app_bar.dart';
import '../home/sections/footer_section.dart';

@RoutePage()
class FormsPage extends ConsumerStatefulWidget {
  const FormsPage({super.key});

  @override
  ConsumerState<FormsPage> createState() => _FormsPageState();
}

class _FormsPageState extends ConsumerState<FormsPage> {
  int _index = 0;
  final _personalForm = GlobalKey<FormState>();
  final _educationForm = GlobalKey<FormState>();
  final _dobController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final device = ResponsiveBreakpoints.of(context);
    return Scaffold(
        body: Stack(children: [
      SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: device.isMobile ? 50 : 70,
            ),
            Container(
              width: device.screenWidth >= 650 && device.screenWidth <= 1100
                  ? device.screenWidth * 0.8
                  : device.screenWidth > 1100
                      ? device.screenWidth * 0.65
                      : device.screenWidth * .95,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Prospective Teacher Application',
                    style: GoogleFonts.openSans(
                        fontSize:
                            device.isMobile ? device.screenWidth * 0.05 : 45,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  color: Colors.grey[200],
                  child: IndexedStack(
                    index: _index,
                    children: [_buildPersonalInfo(), _buildEducation()],
                  ),
                )
              ]),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.grey[200],
              child: Column(children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'Thank You ',
                      style: GoogleFonts.openSans(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: primaryColor)),
                  TextSpan(
                      text:
                          'for your interest in applying for the PART Teacher Exchange Program. Please complete the form request to begin the application process.\n\n',
                      style: GoogleFonts.openSans(color: Colors.grey)),
                  TextSpan(
                      text:
                          'Once you have submitted this request, a PACT staff member will review it and send you further instructions. If you need to edit any information after you have submitted, please contact us at ',
                      style: GoogleFonts.openSans(color: Colors.grey)),
                  TextSpan(
                      text: 'PARTLLC2023@GMAIL.COM\n\n',
                      style: GoogleFonts.openSans(color: primaryColor)),
                  TextSpan(
                      text:
                          'Please enter biographical information as it appears on your passport.',
                      style: GoogleFonts.openSans(color: Colors.grey)),
                ]))
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            const FooterSection(),
          ],
        ),
      ),
      const Positioned(top: -5, left: -5, child: CustomAppBar()),
    ]));
  }

  Widget _buildPersonalInfo() {
    var device = ResponsiveBreakpoints.of(context);
    return Form(
      key: _personalForm,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'PERSONAL INFORMATION',
              style: GoogleFonts.openSans(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: primaryColor),
            ),
          ),
          ListTile(
            title: Text(
              'Prefix',
              style: GoogleFonts.openSans(
                  fontSize: device.isMobile ? 15 : 20, color: Colors.grey),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: CustomDropDown(
                      hintText: 'Prefix',
                      onChanged: (value) {},
                      validator: (prefix) {
                        if (prefix!.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                      items: ['Dr.', 'Mr.', 'Mrs.', 'Ms.']
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text(
              'Name',
              style: GoogleFonts.openSans(
                  fontSize: device.isMobile ? 15 : 20, color: Colors.grey),
            ),
            subtitle: device.screenWidth > 950
                ? Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomTextFields(
                            hintText: 'First Name',
                            validator: (first) {
                              if (first!.isEmpty) {
                                return 'Required';
                              }
                              return null;
                            },
                            onSaved: (first) {},
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CustomTextFields(
                            hintText: 'Middle Name',
                            onSaved: (middle) {},
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CustomTextFields(
                            hintText: 'Surname Name',
                            onSaved: (surname) {},
                          ),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        CustomTextFields(
                          hintText: 'First Name',
                          validator: (first) {
                            if (first!.isEmpty) {
                              return 'Required';
                            }
                            return null;
                          },
                          onSaved: (first) {},
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomTextFields(
                          hintText: 'Middle Name',
                          onSaved: (middle) {},
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomTextFields(
                          hintText: 'Surname Name',
                          onSaved: (surname) {},
                        ),
                      ],
                    ),
                  ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: device.screenWidth > 950 ? 700 : device.screenWidth,
            child: Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text('Suffix',
                        style: GoogleFonts.openSans(color: Colors.grey)),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CustomDropDown(
                        hintText: 'Suffix',
                        onChanged: (value) {},
                        items: ['Jr.', 'Sr.', 'I', 'II', 'III', 'IV', 'V', 'VI']
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text('Gender',
                        style: GoogleFonts.openSans(color: Colors.grey)),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CustomDropDown(
                        hintText: 'Gender',
                        validator: (gender) {
                          if (gender == null) {
                            return 'Required';
                          }
                          return null;
                        },
                        onChanged: (value) {},
                        items: ['Male', 'Female', 'Others']
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: device.screenWidth > 950 ? 600 : device.screenWidth,
            child: ListTile(
              title: Text(
                'Date of Birth (MM/DD/YYYY)',
                style: GoogleFonts.openSans(
                    fontSize: device.isMobile ? 15 : 20, color: Colors.grey),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CustomTextFields(
                  hintText: 'DD/MM/YYYY',
                  controller: _dobController,
                  suffixIcon: IconButton(
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime(DateTime.now().year - 18),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(DateTime.now().year - 18),
                      ).then((value) {
                        if (value != null) {
                          setState(() {
                            _dobController.text = DateFormat('MM/DD/YYYY')
                                .format(value)
                                .toString();
                          });
                        }
                      });
                    },
                    icon: const Icon(
                      Icons.calendar_today,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: device.screenWidth > 950 ? 600 : device.screenWidth,
            child: ListTile(
              title: Text(
                'Place of Birth',
                style: GoogleFonts.openSans(
                    fontSize: device.isMobile ? 15 : 20, color: Colors.grey),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CustomTextFields(
                  hintText: 'Place of Birth',
                  onSaved: (place) {},
                  validator: (place) {
                    if (place!.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          if (device.screenWidth > 950)
            SizedBox(
              width: device.screenWidth > 950 ? 600 : device.screenWidth,
              child: Row(
                children: [
                  Expanded(
                    child: ListTile(
                        title: Text('Country of Citizenship',
                            style: GoogleFonts.openSans(color: Colors.grey)),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: CustomDropDown(
                            hintText: 'Country of Citizenship',
                            validator: (country) {
                              if (country == null) {
                                return 'Required';
                              }
                              return null;
                            },
                            onChanged: (value) {},
                            items: countries
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    ))
                                .toList(),
                          ),
                        )),
                  ),
                  Expanded(
                    child: ListTile(
                        title: Text('Country of residence',
                            style: GoogleFonts.openSans(color: Colors.grey)),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: CustomDropDown(
                            hintText: 'Country of residence',
                            validator: (country) {
                              if (country == null) {
                                return 'Required';
                              }
                              return null;
                            },
                            onChanged: (value) {},
                            items: countries
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    ))
                                .toList(),
                          ),
                        )),
                  )
                ],
              ),
            ),
          if (device.screenWidth <= 950)
            Column(
              children: [
                ListTile(
                    title: Text('Country of Citizenship',
                        style: GoogleFonts.openSans(color: Colors.grey)),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CustomDropDown(
                        hintText: 'Country of Citizenship',
                        validator: (country) {
                          if (country == null) {
                            return 'Required';
                          }
                          return null;
                        },
                        onChanged: (value) {},
                        items: countries
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                    title: Text('Country of residence',
                        style: GoogleFonts.openSans(color: Colors.grey)),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CustomDropDown(
                        hintText: 'Country of residence',
                        validator: (country) {
                          if (country == null) {
                            return 'Required';
                          }
                          return null;
                        },
                        onChanged: (value) {},
                        items: countries
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                      ),
                    ))
              ],
            ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: device.screenWidth > 950 ? 600 : device.screenWidth,
            child: ListTile(
              title: Text(
                'Telephone Number',
                style: GoogleFonts.openSans(
                    fontSize: device.isMobile ? 15 : 20, color: Colors.grey),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    SizedBox(
                        width: 100,
                        child: CustomDropDown(
                            hintText: 'Code',
                            validator: (code) {
                              if (code == null) {
                                return 'Required';
                              }
                              return null;
                            },
                            onChanged: (code) {},
                            items: countryPhoneCodes
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    ))
                                .toList())),
                    Expanded(
                      child: CustomTextFields(
                        hintText: 'Telephone Number',
                        isDigitOnly: true,
                        keyboardType: TextInputType.number,
                        onSaved: (phone) {},
                        validator: (ssn) {
                          if (ssn!.isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: device.screenWidth > 950 ? 600 : device.screenWidth,
            child: ListTile(
              title: Text(
                'Email Address',
                style: GoogleFonts.openSans(
                    fontSize: device.isMobile ? 15 : 20, color: Colors.grey),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CustomTextFields(
                  hintText: 'Email Address',
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (email) {},
                  validator: (email) {
                    if (email!.isEmpty || !RegExp(emailReg).hasMatch(email)) {
                      return 'Valid email is Required';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: device.screenWidth > 950 ? 600 : device.screenWidth,
            child: ListTile(
              title: Text(
                'Mailing Address',
                style: GoogleFonts.openSans(
                    fontSize: device.isMobile ? 15 : 20, color: Colors.grey),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CustomTextFields(
                  hintText: 'Mailing Address',
                  keyboardType: TextInputType.text,
                  maxLines: 2,
                  onSaved: (email) {},
                  validator: (email) {
                    if (email!.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          //marital status
          SizedBox(
            width: device.screenWidth > 950 ? 600 : device.screenWidth,
            child: ListTile(
              title: Text(
                'Marital Status',
                style: GoogleFonts.openSans(
                    fontSize: device.isMobile ? 15 : 20, color: Colors.grey),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CustomDropDown(
                  hintText: 'Marital Status',
                  validator: (maritalStatus) {
                    if (maritalStatus == null) {
                      return 'Required';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                  items: ['Single', 'Married', 'Divorced', 'Widowed']
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          //next and previous buttons
          SizedBox(
            width: device.screenWidth > 950 ? 600 : device.screenWidth,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(flex: 2, child: Container()),
                  TextButton.icon(
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(10),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          side: const BorderSide(color: secondaryColor)),
                      onPressed: () {
                        setState(() {
                          _index = 1;
                        });
                      },
                      icon: Icon(
                        MdiIcons.chevronRight,
                        color: secondaryColor,
                      ),
                      label: Text(
                        'Next',
                        style: GoogleFonts.openSans(
                            fontSize: device.isMobile ? 15 : 20,
                            color: Colors.grey),
                      )),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget _buildEducation() {
    var device = ResponsiveBreakpoints.of(context);
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'EDUCATION AND EXPERIENCE',
              style: GoogleFonts.openSans(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: primaryColor),
            ),
          ),
          //name of school
          SizedBox(
            width: device.screenWidth > 950 ? 600 : device.screenWidth,
            child: ListTile(
              title: Text(
                'Name of School',
                style: GoogleFonts.openSans(
                    fontSize: device.isMobile ? 15 : 20, color: Colors.grey),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CustomTextFields(
                  hintText: 'Name of School attended',
                  keyboardType: TextInputType.text,
                  onSaved: (school) {},
                  validator: (school) {
                    if (school!.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          //country of school
          SizedBox(
            width: device.screenWidth > 950 ? 300 : device.screenWidth,
            child: ListTile(
              title: Text(
                'Country of School',
                style: GoogleFonts.openSans(
                    fontSize: device.isMobile ? 15 : 20, color: Colors.grey),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CustomDropDown(
                  hintText: 'Country of School',
                  validator: (country) {
                    if (country == null) {
                      return 'Required';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                  items: countries
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          //Degree
          SizedBox(
            width: device.screenWidth > 950 ? 600 : device.screenWidth,
            child: ListTile(
              title: Text(
                'Degree',
                style: GoogleFonts.openSans(
                    fontSize: device.isMobile ? 15 : 20, color: Colors.grey),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CustomDropDown(
                  hintText: 'Degree',
                  validator: (degree) {
                    if (degree == null) {
                      return 'Required';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                  items: [
                    'High School Diploma',
                    'Associate Degree',
                    'Bachelor Degree',
                    'Master Degree',
                    'Doctorate Degree'
                  ]
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // Specialization
          SizedBox(
            width: device.screenWidth > 950 ? 600 : device.screenWidth,
            child: ListTile(
              title: Text(
                'Specialization',
                style: GoogleFonts.openSans(
                    fontSize: device.isMobile ? 15 : 20, color: Colors.grey),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CustomTextFields(
                  hintText: 'Specialization',
                  keyboardType: TextInputType.text,
                  onSaved: (specialization) {},
                  validator: (specialization) {
                    if (specialization!.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          //start and completion year
          SizedBox(
              width: device.screenWidth > 950 ? 600 : device.screenWidth,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //start year
                    Expanded(
                        child: ListTile(
                            title: Text(
                              'Year Started',
                              style: GoogleFonts.openSans(
                                  fontSize: device.isMobile ? 15 : 20,
                                  color: Colors.grey),
                            ),
                            subtitle: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: CustomDropDown(
                                  hintText: 'Year Started',
                                  validator: (startYear) {
                                    if (startYear == null) {
                                      return 'Required';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {},
                                  items: [
                                    '2021',
                                    '2020',
                                    '2019',
                                    '2018',
                                    '2017',
                                    '2016',
                                    '2015',
                                    '2014',
                                    '2013',
                                    '2012',
                                    '2011',
                                    '2010',
                                    '2009',
                                    '2008',
                                    '2007',
                                    '2006',
                                    '2005',
                                    '2004',
                                    '2003',
                                    '2002',
                                    '2001',
                                    '2000',
                                    '1999',
                                    '1998',
                                    '1997',
                                    '1996',
                                    '1995',
                                    '1994',
                                    '1993',
                                    '1992',
                                    '1991',
                                    '1990',
                                    '1989',
                                    '1988',
                                    '1987',
                                    '1986',
                                    '1985',
                                    '1984',
                                    '1983',
                                    '1982',
                                    '1981',
                                    '1980',
                                    '1979',
                                    '1978',
                                    '1977',
                                    '1976',
                                    '1975',
                                    '1974',
                                    '1973',
                                    '1972',
                                    '1971',
                                    '1970',
                                    '1969',
                                    '1968',
                                    '1967',
                                    '1966',
                                    '1965',
                                    '1964',
                                    '1963',
                                    '1962',
                                    '1961',
                                    '1960',
                                    '1959',
                                    '1958',
                                    '1957',
                                    '1956',
                                    '1955',
                                    '1954',
                                    '1953',
                                    '1952',
                                    '1951',
                                    '1950',
                                    '1949',
                                  ]
                                      .map((e) => DropdownMenuItem(
                                            value: e,
                                            child: Text(e),
                                          ))
                                      .toList(),
                                )))),
                    //completion year
                    Expanded(
                        child: ListTile(
                            title: Text(
                              'Year of Completion',
                              style: GoogleFonts.openSans(
                                  fontSize: device.isMobile ? 15 : 20,
                                  color: Colors.grey),
                            ),
                            subtitle: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: CustomDropDown(
                                  hintText: 'Year of Completion',
                                  validator: (startYear) {
                                    if (startYear == null) {
                                      return 'Required';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {},
                                  items: [
                                    '2021',
                                    '2020',
                                    '2019',
                                    '2018',
                                    '2017',
                                    '2016',
                                    '2015',
                                    '2014',
                                    '2013',
                                    '2012',
                                    '2011',
                                    '2010',
                                    '2009',
                                    '2008',
                                    '2007',
                                    '2006',
                                    '2005',
                                    '2004',
                                    '2003',
                                    '2002',
                                    '2001',
                                    '2000',
                                    '1999',
                                    '1998',
                                    '1997',
                                    '1996',
                                    '1995',
                                    '1994',
                                    '1993',
                                    '1992',
                                    '1991',
                                    '1990',
                                    '1989',
                                    '1988',
                                    '1987',
                                    '1986',
                                    '1985',
                                    '1984',
                                    '1983',
                                    '1982',
                                    '1981',
                                    '1980',
                                    '1979',
                                    '1978',
                                    '1977',
                                    '1976',
                                    '1975',
                                    '1974',
                                    '1973',
                                    '1972',
                                    '1971',
                                    '1970',
                                    '1969',
                                    '1968',
                                    '1967',
                                    '1966',
                                    '1965',
                                    '1964',
                                    '1963',
                                    '1962',
                                    '1961',
                                    '1960',
                                    '1959',
                                    '1958',
                                    '1957',
                                    '1956',
                                    '1955',
                                    '1954',
                                    '1953',
                                    '1952',
                                    '1951',
                                    '1950',
                                    '1949',
                                  ]
                                      .map((e) => DropdownMenuItem(
                                            value: e,
                                            child: Text(e),
                                          ))
                                      .toList(),
                                )))),
                  ])),
          //submit button and Previous button
          const SizedBox(
            height: 35,
          ),
          SizedBox(
            width: device.screenWidth > 950 ? 600 : device.screenWidth,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //previous button
                  TextButton.icon(
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(10),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          side: const BorderSide(color: secondaryColor)),
                      onPressed: () {
                        setState(() {
                          _index = 0;
                        });
                      },
                      icon: Icon(
                        MdiIcons.chevronLeft,
                        color: secondaryColor,
                      ),
                      label: Text(
                        'Previous',
                        style: GoogleFonts.openSans(
                            fontSize: device.isMobile ? 15 : 20,
                            color: Colors.grey),
                      )),
                  //submit button
                  CustomButton(
                    text: 'Submit Request',
                    icon: MdiIcons.send,
                    color: secondaryColor,
                    onPressed: () {
                      if (_educationForm.currentState!.validate()) {
                        _educationForm.currentState!.save();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ]);
  }
}
