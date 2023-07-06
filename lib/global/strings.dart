import 'package:part_website/generated/assets.dart';

const String emailReg =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
final List<Map<String, dynamic>> infoList = [
  {
    'image': Assets.imagesBenefit,
    'title': 'BENEFITS',
    'description': '',
    'list': [
      "Expand your horizons by teaching abroad and learning new perspectives",
      "No cost for visa sponsorship",
      "Earn a salary equivalent to that of a similarly-situated American educator",
      "Gain professional development opportunities through PART’s free professional development both before your arrival and throughout your time in the U.S., as well as through your school and district",
      "Pre-departure and post-arrival orientation and relocation support",
      "Comprehensive health insurance that meets Department of State requirements",
      "Sponsorship for qualified dependents under the J-2 visa at no cost",
      "Embark on the journey of a lifetime and return home to pass your learnings along to your students, friends, and family",
    ]
  },
  {
    'image': Assets.imagesQualifications,
    'title': 'QUALIFICATIONS',
    'description': 'Teacher must:',
    'list': [
      "Demonstrate an active interest in cultural exchange and an understanding of the cultural exchange program",
      "Have the equivalent of a 4-year U.S. Bachelor’s in Education, as evaluated by a NACES-member organization",
      "Have at least 2 years of full-time, K-12 lead classroom teacher experience",
      "Meet the qualifications to be certified as a teacher in the U.S. state in which they will be teaching",
      "Be currently working as a teacher",
      "Be of good reputation and character",
      "Be fluent in English",
      "Be able to meet the requirements for obtaining a J-1 visa",
    ]
  },
  {
    'image': Assets.imagesSubject,
    'title': 'SUBJECT AREAS',
    'description':
        'PART engages with K-12 educators in a variety of backgrounds, including:',
    'list': [
      "Special Education",
      "Math",
      "Science (general science, biology, chemistry, physics, etc.)",
      "Elementary",
      "Reading/Literacy",
      "English Language Arts",
      "ESOL",
      "World Languages (Spanish, French, etc.)",
      "Social Studies",
      "And more",
    ]
  },
  {
    'image': Assets.imagesCost,
    'title': 'EXPECTED COST',
    'description':
        'PART does NOT charge teachers any fees for sponsorship and does not work with any third parties who charge fees to prospective Exchange Visitors. However, there are other expenses that may apply to you for joining the program for teachers to be aware of and prepare for (all costs listed as U.S. dollars).',
    'list': []
  }
];

final List<String> countries = [
  'Afghanistan',
  'Albania',
  'Algeria',
  'Andorra',
  'Angola',
  'Antigua and Barbuda',
  'Argentina',
  'Armenia',
  'Australia',
  'Austria',
  'Azerbaijan',
  'Bahamas',
  'Bahrain',
  'Bangladesh',
  'Barbados',
  'Belarus',
  'Belgium',
  'Belize',
  'Benin',
  'Bhutan',
  'Bolivia',
  'Bosnia and Herzegovina',
  'Botswana',
  'Brazil',
  'Brunei',
  'Bulgaria',
  'Burkina Faso',
  'Burundi',
  'Cabo Verde',
  'Cambodia',
  'Cameroon',
  'Canada',
  'Central African Republic',
  'Chad',
  'Chile',
  'China',
  'Colombia',
  'Comoros',
  'Congo',
  'Costa Rica',
  'Croatia',
  'Cuba',
  'Cyprus',
  'Czechia',
  'Denmark',
  'Djibouti',
  'Dominica',
  'Dominican Republic',
  'East Timor',
  'Ecuador',
  'Egypt',
  'El Salvador',
  'Equatorial Guinea',
  'Eritrea',
  'Estonia',
  'Eswatini',
  'Ethiopia',
  'Fiji',
  'Finland',
  'France',
  'Gabon',
  'Gambia',
  'Georgia',
  'Germany',
  'Ghana',
  'Greece',
  'Grenada',
  'Guatemala',
  'Guinea',
  'Guinea-Bissau',
  'Guyana',
  'Haiti',
  'Honduras',
  'Hungary',
  'Iceland',
  'India',
  'Indonesia',
  'Iran',
  'Iraq',
  'Ireland',
  'Israel',
  'Italy',
  'Jamaica',
  'Japan',
  'Jordan',
  'Kazakhstan',
  'Kenya',
  'Kiribati',
  'Korea, North',
  'Korea, South',
  'Kosovo',
  'Kuwait',
  'Kyrgyzstan',
  'Laos',
  'Latvia',
  'Lebanon',
  'Lesotho',
  'Liberia',
  'Libya',
  'Liechtenstein',
  'Lithuania',
  'Luxembourg',
  'Madagascar',
  'Malawi',
  'Malaysia',
  'Maldives',
  'Mali',
  'Malta',
  'Marshall Islands',
  'Mauritania',
  'Mauritius',
  'Mexico',
  'Micronesia',
  'Moldova',
  'Monaco',
  'Mongolia',
  'Montenegro',
  'Morocco',
  'Mozambique',
  'Myanmar',
  'Namibia',
  'Nauru',
  'Nepal',
  'Netherlands',
  'New Zealand',
  'Nicaragua',
  'Niger',
  'Nigeria',
  'North Macedonia',
  'Norway',
  'Oman',
  'Pakistan',
  'Palau',
  'Panama',
  'Papua New Guinea',
  'Paraguay',
  'Peru',
  'Philippines',
  'Poland',
  'Portugal',
  'Qatar',
  'Romania',
  'Russia',
  'Rwanda',
  'Saint Kitts and Nevis',
  'Saint Lucia',
  'Saint Vincent and the Grenadines',
  'Samoa',
  'San Marino',
  'Sao Tome and Principe',
  'Saudi Arabia',
  'Senegal',
  'Serbia',
  'Seychelles',
  'Sierra Leone',
  'Singapore',
  'Slovakia',
  'Slovenia',
  'Solomon Islands',
  'Somalia',
  'South Africa',
  'South Sudan',
  'Spain',
  'Sri Lanka',
  'Sudan',
  'Suriname',
  'Sweden',
  'Switzerland',
  'Syria',
  'Taiwan',
  'Tajikistan',
  'Tanzania',
  'Thailand',
  'Togo',
  'Tonga',
  'Trinidad and Tobago',
  'Tunisia',
  'Turkey',
  'Turkmenistan',
  'Tuvalu',
  'Uganda',
  'Ukraine',
  'United Arab Emirates',
  'United Kingdom',
  'United States',
  'Uruguay',
  'Uzbekistan',
  'Vanuatu',
  'Vatican City',
  'Venezuela',
  'Vietnam',
  'Yemen',
  'Zambia',
  'Zimbabwe',
];
final List<String> countryPhoneCodes = [
  '+93', // Afghanistan
  '+355', // Albania
  '+213', // Algeria
  '+376', // Andorra
  '+244', // Angola
  '+1 268', // Antigua and Barbuda
  '+54', // Argentina
  '+374', // Armenia
  '+61', // Australia
  '+43', // Austria
  '+994', // Azerbaijan
  '+1 242', // Bahamas
  '+973', // Bahrain
  '+880', // Bangladesh
  '+1 246', // Barbados
  '+375', // Belarus
  '+32', // Belgium
  '+501', // Belize
  '+229', // Benin
  '+975', // Bhutan
  '+591', // Bolivia
  '+387', // Bosnia and Herzegovina
  '+267', // Botswana
  '+55', // Brazil
  '+673', // Brunei
  '+359', // Bulgaria
  '+226', // Burkina Faso
  '+257', // Burundi
  '+855', // Cambodia
  '+237', // Cameroon
  '+1', // Canada
  '+238', // Cape Verde
  '+236', // Central African Republic
  '+235', // Chad
  '+56', // Chile
  '+86', // China
  '+57', // Colombia
  '+269', // Comoros
  '+242', // Congo
  '+506', // Costa Rica
  '+225', // Côte d'Ivoire
  '+385', // Croatia
  '+53', // Cuba
  '+357', // Cyprus
  '+420', // Czech Republic
  '+45', // Denmark
  '+253', // Djibouti
  '+1 767', // Dominica
  '+1 809', // Dominican Republic
  '+593', // Ecuador
  '+20', // Egypt
  '+503', // El Salvador
  '+240', // Equatorial Guinea
  '+291', // Eritrea
  '+372', // Estonia
  '+251', // Ethiopia
  '+679', // Fiji
  '+358', // Finland
  '+33', // France
  '+241', // Gabon
  '+220', // Gambia
  '+995', // Georgia
  '+49', // Germany
  '+233', // Ghana
  '+30', // Greece
  '+1 473', // Grenada
  '+502', // Guatemala
  '+224', // Guinea
  '+245', // Guinea-Bissau
  '+592', // Guyana
  '+509', // Haiti
  '+504', // Honduras
  '+852', // Hong Kong
  '+36', // Hungary
  '+354', // Iceland
  '+91', // India
  '+62', // Indonesia
  '+98', // Iran
  '+964', // Iraq
  '+353', // Ireland
  '+972', // Israel
  '+39', // Italy
  '+1 876', // Jamaica
  '+81', // Japan
  '+962', // Jordan
  '+7', // Kazakhstan
  '+254', // Kenya
  '+686', // Kiribati
  '+965', // Kuwait
  '+996', // Kyrgyzstan
  '+856', // Laos
  '+371', // Latvia
  '+961', // Lebanon
  '+266', // Lesotho
  '+231', // Liberia
];
