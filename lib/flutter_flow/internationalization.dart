import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // MainMenu
  {
    'my8n23fx': {
      'en': 'Pharmacy',
      'ar': 'صيدليه',
    },
    'ojttk4dh': {
      'en': 'Nursing',
      'ar': 'التمريض',
    },
    'k25z8jl2': {
      'en': 'Analysis',
      'ar': 'تحاليل',
    },
    'bfaapww4': {
      'en': 'ICU',
      'ar': 'العناية المركزة',
    },
    'k89m190z': {
      'en': 'Emergency',
      'ar': 'طوارئ',
    },
    'gh1wtxxb': {
      'en': 'Book a Surgery',
      'ar': 'احجز عملية جراحية',
    },
    'kqd951x9': {
      'en': 'Book a Doctor',
      'ar': 'حجز طبيب',
    },
    '8ubh5rpa': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // Settings
  {
    '0pyuwscn': {
      'en': 'Language',
      'ar': '',
    },
    's9wc3jln': {
      'en': 'Light Mode',
      'ar': 'وضع الضوء',
    },
    '9prn7svi': {
      'en': 'Dark Mode',
      'ar': 'الوضع المظلم',
    },
    's9ecxyar': {
      'en': 'Settings',
      'ar': '',
    },
    'pwnwx9cr': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
    },
  },
  // DoctorHub
  {
    'izdwn9sa': {
      'en': 'Our Doctors & Services',
      'ar': 'أطباؤنا وخدماتنا',
    },
    '37xfiee7': {
      'en': 'Gynocology',
      'ar': 'أمراض النساء',
    },
    '35ke4gq0': {
      'en': 'Kidneys',
      'ar': 'الكلى',
    },
    'u5lb9xgn': {
      'en': 'Psychology',
      'ar': 'علم النفس',
    },
    '6bkdp5up': {
      'en': 'Ophthalmia',
      'ar': 'الرمد',
    },
    '0qunf5yi': {
      'en': 'Dermatology',
      'ar': 'الأمراض الجلدية',
    },
    '68w4b7n5': {
      'en': 'Urology',
      'ar': 'المسالك البولية',
    },
    'qjbmirh3': {
      'en': 'Digestive',
      'ar': 'هضمي',
    },
    '48890yal': {
      'en': 'Male Diseases',
      'ar': 'أمراض الذكور',
    },
    'nb5fq8cw': {
      'en': 'Endocrine',
      'ar': 'الغدد الصماء',
    },
    '6fwau861': {
      'en': 'Chest',
      'ar': 'صدريه',
    },
    'vsb5utqg': {
      'en': 'Bone Surgery',
      'ar': 'جراحة العظام',
    },
    'ga7go073': {
      'en': 'Tumor Surgery',
      'ar': 'جراحة الأورام',
    },
    'fejb7n9e': {
      'en': 'Oncology',
      'ar': 'علم الأورام',
    },
    'rv14igkd': {
      'en': 'Children Surgery',
      'ar': 'جراحة الاطفال',
    },
    '2slui481': {
      'en': 'Plastic Surgery',
      'ar': 'جراحة تجميلية',
    },
    'c40tgmdf': {
      'en': 'Blood Vessels',
      'ar': 'الأوعية الدموية',
    },
    '22pvcy88': {
      'en': 'Maxillofacial',
      'ar': 'الوجه والفكين',
    },
    'q6pq0fms': {
      'en': 'Rheumatism',
      'ar': 'الروماتيزم',
    },
    'qgyjz0e0': {
      'en': 'Brain & Nerves',
      'ar': 'المخ والأعصاب',
    },
    '7u0tyny5': {
      'en': 'Blood Disease',
      'ar': 'أمراض الدم',
    },
    'ser71439': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // Gynocology
  {
    'mvgx6zsz': {
      'en': 'Gynocologists',
      'ar': 'أطباء أمراض النساء',
    },
    '9f8gzfd9': {
      'en': ' ',
      'ar': '',
    },
  },
  // Kidneys
  {
    '8sn8puxr': {
      'en': 'Kidneys Doctors',
      'ar': 'اطباء الكلى',
    },
    'llvngr5d': {
      'en': ' ',
      'ar': '',
    },
  },
  // TumorSurgery
  {
    '17qvr4pp': {
      'en': 'Tumor Doctors',
      'ar': 'أطباء الأورام',
    },
    'bunl9j05': {
      'en': ' ',
      'ar': '',
    },
  },
  // Oncology
  {
    'rc9nfg6d': {
      'en': 'Oncology Doctors',
      'ar': 'أطباء جراحه الأورام',
    },
    'b95x59bn': {
      'en': ' ',
      'ar': '',
    },
  },
  // ChildrenSurgery
  {
    '16ztdqt8': {
      'en': 'Child Surgeons',
      'ar': 'جراحي الاطفال',
    },
    'v8wfm5h9': {
      'en': ' ',
      'ar': '',
    },
  },
  // PlasticSurgery
  {
    'tu1613bk': {
      'en': 'Plastic Surgeons',
      'ar': 'جراحي التجميل',
    },
    '8l4i5im6': {
      'en': ' ',
      'ar': '',
    },
  },
  // BloodVessels
  {
    'efv1v8wd': {
      'en': 'Blood Vessels Doctors',
      'ar': 'اطباء اوعية دموية',
    },
    'oshqbv3d': {
      'en': ' ',
      'ar': '',
    },
  },
  // Maxillofacial
  {
    '6k32d3i0': {
      'en': 'Maxillofacial Doctors',
      'ar': 'أطباء الوجه والفكين',
    },
    't29hn7g9': {
      'en': ' ',
      'ar': '',
    },
  },
  // Rheumatism
  {
    'ndl6giqn': {
      'en': 'Rheumatism Doctors',
      'ar': 'أطباء الروماتيزم',
    },
    'uaw96eyn': {
      'en': ' ',
      'ar': '',
    },
  },
  // BrainNerves
  {
    '84s4izee': {
      'en': 'Brain & Nerves Doctors',
      'ar': 'أطباء المخ و الأعصاب',
    },
    '8xjkixw0': {
      'en': ' ',
      'ar': '',
    },
  },
  // Psychology
  {
    '3nsv5rxq': {
      'en': 'Psychologists',
      'ar': 'أطباء نفسيين',
    },
    'skjfec6n': {
      'en': ' ',
      'ar': '',
    },
  },
  // Opthlamia
  {
    'ec3svssh': {
      'en': 'Opthlamia Doctors',
      'ar': 'أطباء الرمد',
    },
    'aewbnp4y': {
      'en': ' ',
      'ar': '',
    },
  },
  // Dermatology
  {
    '34b39ww5': {
      'en': 'Dermatologists',
      'ar': 'أطباء الجلد',
    },
    'j40d9r01': {
      'en': ' ',
      'ar': '',
    },
  },
  // Urology
  {
    'pvddue9b': {
      'en': 'Urologists',
      'ar': 'أطباء المسالك البولية',
    },
    'pgpffk2h': {
      'en': ' ',
      'ar': '',
    },
  },
  // Digestive
  {
    '2ih0p28n': {
      'en': 'Digestive System Doctors',
      'ar': 'أطباء الجهاز الهضمي',
    },
    '8qg7khfd': {
      'en': ' ',
      'ar': '',
    },
  },
  // MaleDiseases
  {
    'dsecgtog': {
      'en': 'Male Disease Doctors',
      'ar': 'أطباء أمراض الذكور',
    },
    '34etslc5': {
      'en': ' ',
      'ar': '',
    },
  },
  // Endocrine
  {
    '659pj0t3': {
      'en': 'Endocrine Doctors',
      'ar': 'أطباء الغدد الصماء',
    },
    'd3zulquh': {
      'en': ' ',
      'ar': '',
    },
  },
  // Pectoral
  {
    '8bzkdkhi': {
      'en': 'Chest Doctors',
      'ar': 'اطباء الصدر',
    },
    'aret8mcg': {
      'en': ' ',
      'ar': '',
    },
  },
  // BoneSurgery
  {
    'udpksoz8': {
      'en': 'Bone Surgeons',
      'ar': 'جراحي العظام',
    },
    'yfr53mws': {
      'en': ' ',
      'ar': '',
    },
  },
  // BloodDisease
  {
    'jck89i3e': {
      'en': 'Blood Disease Doctors',
      'ar': 'أطباء أمراض الدم',
    },
    '7cjvlhtj': {
      'en': ' ',
      'ar': '',
    },
  },
  // LanguageHub
  {
    '84wz9fmo': {
      'en': 'Language',
      'ar': 'لغة',
    },
    'v8v48nwa': {
      'en': 'English',
      'ar': 'إنجليزي',
    },
    'wipqqmov': {
      'en': 'عربي',
      'ar': 'عربي',
    },
    'wqbnm8jp': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
    },
  },
  // onboarding
  {
    'xh10m305': {
      'en': 'Looking for a Doctor with no hassle?',
      'ar': 'هل تبحث عن طبيب دون أي متاعب؟',
    },
    '1zdnpag1': {
      'en':
          'Then you came to the right place, with our wide selection of doctors, your health is our #1 Priority',
      'ar':
          'إذن أتيت إلى المكان الصحيح، مع مجموعة واسعة من الأطباء لدينا، صحتك هي أولويتنا الأولى',
    },
    'k6mw0x7q': {
      'en': 'Join',
      'ar': 'أنضم',
    },
    '129b0iby': {
      'en': 'Home',
      'ar': '',
    },
  },
  // NavBar1
  {
    '0c1p7dqy': {
      'en': 'Contact Us',
      'ar': 'اتصل بنا',
    },
    '6a5afou1': {
      'en': 'Settings',
      'ar': 'إعدادات',
    },
  },
  // Miscellaneous
  {
    'ytr88yhr': {
      'en': '',
      'ar': '',
    },
    'ta5kly1y': {
      'en': '',
      'ar': '',
    },
    'o5nn9l9p': {
      'en': '',
      'ar': '',
    },
    '0l0mx8py': {
      'en': '',
      'ar': '',
    },
    'p36fvdli': {
      'en': '',
      'ar': '',
    },
    '263n7io1': {
      'en': '',
      'ar': '',
    },
    'gaoiwhmm': {
      'en': '',
      'ar': '',
    },
    'uxs8u26u': {
      'en': '',
      'ar': '',
    },
    'bl0oi99u': {
      'en': '',
      'ar': '',
    },
    'j2behuxu': {
      'en': '',
      'ar': '',
    },
    'kegdjqup': {
      'en': '',
      'ar': '',
    },
    '5czp9gvs': {
      'en': '',
      'ar': '',
    },
    'ntludjxr': {
      'en': '',
      'ar': '',
    },
    'yoqnvphg': {
      'en': '',
      'ar': '',
    },
    'afdkbryv': {
      'en': '',
      'ar': '',
    },
    '2isijnya': {
      'en': '',
      'ar': '',
    },
    'mqkx0vjg': {
      'en': '',
      'ar': '',
    },
    'k57905os': {
      'en': '',
      'ar': '',
    },
    'p8v3wwph': {
      'en': '',
      'ar': '',
    },
    '9jfcb6fi': {
      'en': '',
      'ar': '',
    },
    '3ceg03t0': {
      'en': '',
      'ar': '',
    },
    'jgaq06o5': {
      'en': '',
      'ar': '',
    },
    'ze923l0g': {
      'en': '',
      'ar': '',
    },
    'uka39ds6': {
      'en': '',
      'ar': '',
    },
    '0m4wd7nf': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
