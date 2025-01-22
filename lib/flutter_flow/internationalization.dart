import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fr', 'es'];

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
    String? frText = '',
    String? esText = '',
  }) =>
      [enText, frText, esText][languageIndex] ?? '';

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

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

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

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // WelcomePage
  {
    '915w775m': {
      'en': 'Welcome to',
      'es': '',
      'fr': '',
    },
    'e0mj12ro': {
      'en': 'QUITA',
      'es': '',
      'fr': '',
    },
    'viavbdr5': {
      'en': 'Meet, Have Fun & Stay Informed.',
      'es': '',
      'fr': '',
    },
    'xujlv7ej': {
      'en': 'Sign Up',
      'es': '',
      'fr': '',
    },
    'h4mvfg2d': {
      'en': 'Already have an account?',
      'es': '',
      'fr': '',
    },
    'g5jm7udd': {
      'en': 'Log In',
      'es': '',
      'fr': '',
    },
    'ehwr8g0l': {
      'en': 'WELCOME PAGE',
      'es': '',
      'fr': '',
    },
  },
  // individualchatprofil
  {
    'ibl6y9ce': {
      'en': 'Sofia Rodriguez',
      'es': '',
      'fr': '',
    },
    '4v1fx5er': {
      'en': '@sofia_creates',
      'es': '',
      'fr': '',
    },
    '8egdieyt': {
      'en': '1.2K',
      'es': '',
      'fr': '',
    },
    '54x7b8po': {
      'en': 'Followers',
      'es': '',
      'fr': '',
    },
    'u099uvms': {
      'en': '3.5K',
      'es': '',
      'fr': '',
    },
    '1ozmi072': {
      'en': 'Following',
      'es': '',
      'fr': '',
    },
    'hqyn3koy': {
      'en': '28',
      'es': '',
      'fr': '',
    },
    'hh59oozi': {
      'en': 'Posts',
      'es': '',
      'fr': '',
    },
    '6gshjymb': {
      'en': 'About Me',
      'es': '',
      'fr': '',
    },
    'f4816uzk': {
      'en':
          'Creative soul with a passion for photography and design. Always seeking new inspirations and connections. Let\'s create something beautiful together!',
      'es': '',
      'fr': '',
    },
    'jedo52b8': {
      'en': 'Chat',
      'es': '',
      'fr': '',
    },
    'dzcvscuv': {
      'en': 'Creativity',
      'es': '',
      'fr': '',
    },
    '2tja627d': {
      'en': 'Promote',
      'es': '',
      'fr': '',
    },
  },
  // auth_2_Create
  {
    'usad1njk': {
      'en': 'flow.io',
      'es': '',
      'fr': '',
    },
    '8l1u05y6': {
      'en': 'Get Started',
      'es': '',
      'fr': '',
    },
    'f5x1lqa8': {
      'en': 'Create an account by using the form below.',
      'es': '',
      'fr': '',
    },
    '43cs4s4t': {
      'en': 'Email',
      'es': '',
      'fr': '',
    },
    'd5u2fsn0': {
      'en': 'Password',
      'es': '',
      'fr': '',
    },
    'fc62i8vh': {
      'en': 'Create Account',
      'es': '',
      'fr': '',
    },
    'lir41aih': {
      'en': 'Or sign up with',
      'es': '',
      'fr': '',
    },
    'z75w1snl': {
      'en': 'Continue with Google',
      'es': '',
      'fr': '',
    },
    'e29jufhh': {
      'en': 'Continue with Apple',
      'es': '',
      'fr': '',
    },
    'wv61ar1n': {
      'en': 'Already have an account? ',
      'es': '',
      'fr': '',
    },
    'u2evtsm0': {
      'en': 'Sign in here',
      'es': '',
      'fr': '',
    },
    '23bhzl53': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // auth_2_Login
  {
    'ei4zkuwo': {
      'en': 'flow.io',
      'es': '',
      'fr': '',
    },
    'y2mng95f': {
      'en': 'Welcome Back',
      'es': '',
      'fr': '',
    },
    '4embsnv1': {
      'en': 'Fill out the information below in order to access your account.',
      'es': '',
      'fr': '',
    },
    '0fvys9fz': {
      'en': 'Email',
      'es': '',
      'fr': '',
    },
    'm6ayji5e': {
      'en': 'Password',
      'es': '',
      'fr': '',
    },
    'hd3ch3xv': {
      'en': 'Sign In',
      'es': '',
      'fr': '',
    },
    '96s99dec': {
      'en': 'Or sign in with',
      'es': '',
      'fr': '',
    },
    'l0w0v4na': {
      'en': 'Continue with Google',
      'es': '',
      'fr': '',
    },
    'w7tfxime': {
      'en': 'Continue with Apple',
      'es': '',
      'fr': '',
    },
    'pc05f24v': {
      'en': 'Don\'t have an account?  ',
      'es': '',
      'fr': '',
    },
    'r7fqmcwb': {
      'en': 'Create Account',
      'es': '',
      'fr': '',
    },
    'qukedv7l': {
      'en': 'Forgot password?',
      'es': '',
      'fr': '',
    },
    '27cpvz6z': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // auth_2_ForgotPassword
  {
    '73k0khzu': {
      'en': 'flow.io',
      'es': '',
      'fr': '',
    },
    'x2ck6j0e': {
      'en': 'Forgot Password',
      'es': '',
      'fr': '',
    },
    'xpeqq1yn': {
      'en':
          'Please fill out your email belo in order to recieve a reset password link.',
      'es': '',
      'fr': '',
    },
    '7wmjd9jv': {
      'en': 'Email',
      'es': '',
      'fr': '',
    },
    'wruo1s57': {
      'en': 'Send Reset Link',
      'es': '',
      'fr': '',
    },
    '1d5acovv': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // auth_2_createProfile
  {
    '9js0som8': {
      'en': 'flow.io',
      'es': '',
      'fr': '',
    },
    'ezj5i2gr': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // auth_2_Profile
  {
    '2ytw871b': {
      'en': 'Your Account',
      'es': '',
      'fr': '',
    },
    'c9lbdu5p': {
      'en': 'Edit Profile',
      'es': '',
      'fr': '',
    },
    'cfh7ds4r': {
      'en': 'App Settings',
      'es': '',
      'fr': '',
    },
    'ep6qzscf': {
      'en': 'Support',
      'es': '',
      'fr': '',
    },
    'vhry9216': {
      'en': 'Terms of Service',
      'es': '',
      'fr': '',
    },
    'osjwa1pi': {
      'en': 'Log Out',
      'es': '',
      'fr': '',
    },
    'nchfk1ww': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // auth_2_EditProfile
  {
    'y29mnpk9': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // signupuserpluscompany
  {
    'kygtkrav': {
      'en': 'Create an Account',
      'es': '',
      'fr': '',
    },
    'ymochtj3': {
      'en': 'Choose how you\'d like to sign up',
      'es': '',
      'fr': '',
    },
    '0bq7uk1l': {
      'en': 'Sign Up As',
      'es': '',
      'fr': '',
    },
    'kljwhbod': {
      'en': 'Individual Guest',
      'es': '',
      'fr': '',
    },
    'jkmjozrn': {
      'en': 'Business Owner',
      'es': '',
      'fr': '',
    },
    '402753kt': {
      'en': 'Or sign up with',
      'es': '',
      'fr': '',
    },
    'k70odmkb': {
      'en': 'Continue with Google',
      'es': '',
      'fr': '',
    },
    '1tybcueh': {
      'en': 'Continue with Apple',
      'es': '',
      'fr': '',
    },
    'iye621dw': {
      'en': 'Already have an account? ',
      'es': '',
      'fr': '',
    },
    'cwtqnbth': {
      'en': 'Log In',
      'es': '',
      'fr': '',
    },
  },
  // createprofiluser
  {
    '8h2nolk0': {
      'en': 'Create Your Profile',
      'es': '',
      'fr': '',
    },
    '4ipb7d53': {
      'en':
          'Please fill in the following information to complete your registration.',
      'es': '',
      'fr': '',
    },
    'o2ikywd6': {
      'en': 'Personal Information',
      'es': '',
      'fr': '',
    },
    'n5f8f5hn': {
      'en': 'Username',
      'es': '',
      'fr': '',
    },
    'hq628u1d': {
      'en': 'First Name',
      'es': '',
      'fr': '',
    },
    '0geel60a': {
      'en': 'Last Name',
      'es': '',
      'fr': '',
    },
    'nb91woy4': {
      'en': 'Select gender',
      'es': '',
      'fr': '',
    },
    'j2sab1wh': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'w0b16ifd': {
      'en': 'King',
      'es': '',
      'fr': '',
    },
    'vvcpzqv7': {
      'en': 'Queen',
      'es': '',
      'fr': '',
    },
    'gxrxzk0c': {
      'en': 'Other',
      'es': '',
      'fr': '',
    },
    'qxthgdnx': {
      'en': 'Prefer not to say',
      'es': '',
      'fr': '',
    },
    'j4831sav': {
      'en': 'Upload Profile Picture',
      'es': '',
      'fr': '',
    },
    '1duz6rgd': {
      'en': 'Upload 2 mandatory photos (face profile and full-body)',
      'es': '',
      'fr': '',
    },
    '7yt3bbmw': {
      'en': 'Select nationality',
      'es': '',
      'fr': '',
    },
    '84y1285y': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'i6nz6iuv': {
      'en': 'King',
      'es': '',
      'fr': '',
    },
    'q4glan7v': {
      'en': 'Queen',
      'es': '',
      'fr': '',
    },
    '6trk0nsg': {
      'en': 'Other',
      'es': '',
      'fr': '',
    },
    'csrp4c8j': {
      'en': 'Prefer not to say',
      'es': '',
      'fr': '',
    },
    '64v0kh7c': {
      'en': 'Mix nationality',
      'es': '',
      'fr': '',
    },
    'azf5v9e1': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'pmkj7vzi': {
      'en': 'Yes',
      'es': '',
      'fr': '',
    },
    'c2ktlemh': {
      'en': 'No',
      'es': '',
      'fr': '',
    },
    'uryql39u': {
      'en': 'Enter your birthday',
      'es': '',
      'fr': '',
    },
    'hgec1hvj': {
      'en': 'Day',
      'es': '',
      'fr': '',
    },
    'mvs5wy1f': {
      'en': 'Month',
      'es': '',
      'fr': '',
    },
    '3vw9ts2p': {
      'en': 'Year',
      'es': '',
      'fr': '',
    },
    '3tibldli': {
      'en': 'Select height',
      'es': '',
      'fr': '',
    },
    'avbnp9oe': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'cqord9lw': {
      'en': 'King',
      'es': '',
      'fr': '',
    },
    '8i4dz9qd': {
      'en': 'Queen',
      'es': '',
      'fr': '',
    },
    '6loo26oa': {
      'en': 'Other',
      'es': '',
      'fr': '',
    },
    'mipfs8iz': {
      'en': 'Prefer not to say',
      'es': '',
      'fr': '',
    },
    '8sk3z314': {
      'en': 'Select weight',
      'es': '',
      'fr': '',
    },
    'e8bnz6oi': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'pfvzbnq5': {
      'en': 'King',
      'es': '',
      'fr': '',
    },
    'jwd22kek': {
      'en': 'Queen',
      'es': '',
      'fr': '',
    },
    'pih1e18q': {
      'en': 'Other',
      'es': '',
      'fr': '',
    },
    '5wvrwpde': {
      'en': 'Prefer not to say',
      'es': '',
      'fr': '',
    },
    '159d1vdi': {
      'en': 'Ethnicity',
      'es': '',
      'fr': '',
    },
    'ehaizci4': {
      'en': 'Select eye color',
      'es': '',
      'fr': '',
    },
    'b5d2zxzt': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'lnabwm3q': {
      'en': 'Brown',
      'es': '',
      'fr': '',
    },
    'kxraz5hz': {
      'en': 'Blue',
      'es': '',
      'fr': '',
    },
    'oywckh7i': {
      'en': 'Green',
      'es': '',
      'fr': '',
    },
    'v0wagyta': {
      'en': 'Hazel',
      'es': '',
      'fr': '',
    },
    'xwh3kyz2': {
      'en': 'Gray',
      'es': '',
      'fr': '',
    },
    'imevre3b': {
      'en': 'Other',
      'es': '',
      'fr': '',
    },
    'hiyzyqys': {
      'en': 'Select hair color',
      'es': '',
      'fr': '',
    },
    'g9889f4g': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'xo8hs7lu': {
      'en': 'Black',
      'es': '',
      'fr': '',
    },
    'ko4i1z0w': {
      'en': 'Brown',
      'es': '',
      'fr': '',
    },
    'ny519m4w': {
      'en': 'Blonde',
      'es': '',
      'fr': '',
    },
    '8fj6u13y': {
      'en': 'Red',
      'es': '',
      'fr': '',
    },
    'z68uth82': {
      'en': 'Gray',
      'es': '',
      'fr': '',
    },
    'qmhij9qn': {
      'en': 'Other',
      'es': '',
      'fr': '',
    },
    'h4q6heuy': {
      'en': 'Select hair style',
      'es': '',
      'fr': '',
    },
    'ug04celf': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'vtg4ze39': {
      'en': 'Shaved',
      'es': '',
      'fr': '',
    },
    'spnogfz6': {
      'en': 'Straight',
      'es': '',
      'fr': '',
    },
    '7vpjm7ud': {
      'en': 'Curly',
      'es': '',
      'fr': '',
    },
    'd88zwwrv': {
      'en': 'Wavy',
      'es': '',
      'fr': '',
    },
    'zqbsjryn': {
      'en': 'Other',
      'es': '',
      'fr': '',
    },
    '7a72w2uv': {
      'en': 'Select planet',
      'es': '',
      'fr': '',
    },
    'm3v7iqnw': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'hfmfgedf': {
      'en': 'Mercury',
      'es': '',
      'fr': '',
    },
    '4og0c44t': {
      'en': 'Venus',
      'es': '',
      'fr': '',
    },
    '4jysbwhr': {
      'en': 'Earth',
      'es': '',
      'fr': '',
    },
    'exjnnby4': {
      'en': 'Mars',
      'es': '',
      'fr': '',
    },
    '0k54z3zu': {
      'en': 'Jupiter',
      'es': '',
      'fr': '',
    },
    'vy9e6eks': {
      'en': 'Saturn',
      'es': '',
      'fr': '',
    },
    'ee8azvrz': {
      'en': 'Uranus',
      'es': '',
      'fr': '',
    },
    'o2hto838': {
      'en': 'Neptune',
      'es': '',
      'fr': '',
    },
    'jbco27cm': {
      'en': 'Moon',
      'es': '',
      'fr': '',
    },
    'd2d5odmd': {
      'en': 'Select Country',
      'es': '',
      'fr': '',
    },
    'f462ca85': {
      'en': 'Address (Optional)',
      'es': '',
      'fr': '',
    },
    'sxutkay9': {
      'en': 'Select language',
      'es': '',
      'fr': '',
    },
    '24dnpgwq': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'n6l12v9c': {
      'en': 'English',
      'es': '',
      'fr': '',
    },
    'o17ael4s': {
      'en': 'Spanish',
      'es': '',
      'fr': '',
    },
    'jf1gz4v5': {
      'en': 'French',
      'es': '',
      'fr': '',
    },
    'nw00zeqg': {
      'en': 'German',
      'es': '',
      'fr': '',
    },
    '6qi8dw2s': {
      'en': 'Chinese',
      'es': '',
      'fr': '',
    },
    'rjdlfd4w': {
      'en': 'Arabic',
      'es': '',
      'fr': '',
    },
    'aoedn9n1': {
      'en': 'Other',
      'es': '',
      'fr': '',
    },
    'cnmd7ll5': {
      'en': 'Select religion',
      'es': '',
      'fr': '',
    },
    'k4d3c9fc': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    '2kfp8582': {
      'en': 'N/A',
      'es': '',
      'fr': '',
    },
    'nlzg3l7z': {
      'en': 'Atheist',
      'es': '',
      'fr': '',
    },
    'l05v9ywj': {
      'en': 'Buddhist',
      'es': '',
      'fr': '',
    },
    'elgmqcy0': {
      'en': 'Christian',
      'es': '',
      'fr': '',
    },
    '8i7otpve': {
      'en': 'Hindu',
      'es': '',
      'fr': '',
    },
    '931im43h': {
      'en': 'Jewish',
      'es': '',
      'fr': '',
    },
    'qw1mklf6': {
      'en': 'Muslim',
      'es': '',
      'fr': '',
    },
    '5k08brks': {
      'en': 'Other',
      'es': '',
      'fr': '',
    },
    'ti5zs6ya': {
      'en': 'Glasses',
      'es': '',
      'fr': '',
    },
    'njwsvxev': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    '4n6u34xn': {
      'en': 'Yes',
      'es': '',
      'fr': '',
    },
    '1nhsvnr0': {
      'en': 'No',
      'es': '',
      'fr': '',
    },
    'jcd60mvf': {
      'en': 'Beard',
      'es': '',
      'fr': '',
    },
    'ny20f48g': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'ie1h64jm': {
      'en': 'Yes',
      'es': '',
      'fr': '',
    },
    'dv5hqthk': {
      'en': 'No',
      'es': '',
      'fr': '',
    },
    'qn118qlx': {
      'en': 'Mustache',
      'es': '',
      'fr': '',
    },
    'haqa84ln': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'up6jx4ak': {
      'en': 'Yes',
      'es': '',
      'fr': '',
    },
    '1ulyz8hs': {
      'en': 'No',
      'es': '',
      'fr': '',
    },
    '18fy2qp2': {
      'en': 'Lip thickness',
      'es': '',
      'fr': '',
    },
    'u9bxkqt9': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'jtkqu1jy': {
      'en': 'Small',
      'es': '',
      'fr': '',
    },
    'tzdiwdbp': {
      'en': 'Medium',
      'es': '',
      'fr': '',
    },
    '5mg61j7e': {
      'en': 'Large',
      'es': '',
      'fr': '',
    },
    'brri9909': {
      'en': 'Enhanced',
      'es': '',
      'fr': '',
    },
    'xan0jj1t': {
      'en': 'Body Type',
      'es': '',
      'fr': '',
    },
    'mxkkoky7': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'qqqmw1c9': {
      'en': 'Natural',
      'es': '',
      'fr': '',
    },
    '37vb2m1e': {
      'en': 'Enhanced',
      'es': '',
      'fr': '',
    },
    '7yed775a': {
      'en': 'Disability',
      'es': '',
      'fr': '',
    },
    'zz8y58kj': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    '895p9lbx': {
      'en': 'Wheelchair',
      'es': '',
      'fr': '',
    },
    'khd6ygd2': {
      'en': 'Deaf',
      'es': '',
      'fr': '',
    },
    'p4adzc9f': {
      'en': 'Mute',
      'es': '',
      'fr': '',
    },
    'd8iwxxij': {
      'en': 'Blind',
      'es': '',
      'fr': '',
    },
    '9ggdfdsu': {
      'en': 'Other',
      'es': '',
      'fr': '',
    },
    '6pdzztu7': {
      'en': 'None',
      'es': '',
      'fr': '',
    },
    'kjjw8tcu': {
      'en': 'Select clothing style',
      'es': '',
      'fr': '',
    },
    'j4fv7xy8': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    '57o1ya9r': {
      'en': 'Wheelchair',
      'es': '',
      'fr': '',
    },
    'at5uhueh': {
      'en': 'Deaf',
      'es': '',
      'fr': '',
    },
    'ms29kc4h': {
      'en': 'Mute',
      'es': '',
      'fr': '',
    },
    'hqftafcj': {
      'en': 'Blind',
      'es': '',
      'fr': '',
    },
    'cuu7kuu3': {
      'en': 'Other',
      'es': '',
      'fr': '',
    },
    'i1xqoocc': {
      'en': 'None',
      'es': '',
      'fr': '',
    },
    '3i6hrt9l': {
      'en': 'Select personal values',
      'es': '',
      'fr': '',
    },
    '76gzslg6': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'pzlr4fev': {
      'en': 'Wheelchair',
      'es': '',
      'fr': '',
    },
    '89sq2bhz': {
      'en': 'Deaf',
      'es': '',
      'fr': '',
    },
    'qtjit617': {
      'en': 'Mute',
      'es': '',
      'fr': '',
    },
    't45zsgza': {
      'en': 'Blind',
      'es': '',
      'fr': '',
    },
    '7blhdavk': {
      'en': 'Other',
      'es': '',
      'fr': '',
    },
    'zeafz73t': {
      'en': 'None',
      'es': '',
      'fr': '',
    },
    'c76n881k': {
      'en': 'Activities and promotion',
      'es': '',
      'fr': '',
    },
    'ad93o7f7': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    '5t311093': {
      'en': 'Wheelchair',
      'es': '',
      'fr': '',
    },
    'tnx7lm2a': {
      'en': 'Deaf',
      'es': '',
      'fr': '',
    },
    'dyq7aev2': {
      'en': 'Mute',
      'es': '',
      'fr': '',
    },
    '1299rohe': {
      'en': 'Blind',
      'es': '',
      'fr': '',
    },
    'jtmuyh3i': {
      'en': 'Other',
      'es': '',
      'fr': '',
    },
    'zojee40f': {
      'en': 'None',
      'es': '',
      'fr': '',
    },
    'r8mw835n': {
      'en': 'Social Media Link 1 (Optional)',
      'es': '',
      'fr': '',
    },
    '10h53h4v': {
      'en': 'Social Media Link 2 (Optional)',
      'es': '',
      'fr': '',
    },
    'eftp2o8u': {
      'en': 'Description (Optional)',
      'es': '',
      'fr': '',
    },
    'i7h5azar': {
      'en': 'Private Profile',
      'es': '',
      'fr': '',
    },
    'ypymill5': {
      'en': 'Hide All Friends',
      'es': '',
      'fr': '',
    },
    '4yicejuz': {
      'en': 'Select sign',
      'es': '',
      'fr': '',
    },
    'hb5vkwg3': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    '5wxy44bt': {
      'en': 'Aries',
      'es': '',
      'fr': '',
    },
    '7meqqa8d': {
      'en': 'Taurus',
      'es': '',
      'fr': '',
    },
    'la05fwhc': {
      'en': 'Gemini',
      'es': '',
      'fr': '',
    },
    'l18cdp76': {
      'en': 'Cancer',
      'es': '',
      'fr': '',
    },
    '1x6vscla': {
      'en': 'Leo',
      'es': '',
      'fr': '',
    },
    'ohs4uvbk': {
      'en': 'Virgo',
      'es': '',
      'fr': '',
    },
    'feqrnepu': {
      'en': 'Libra',
      'es': '',
      'fr': '',
    },
    'nuwwh4ba': {
      'en': 'Scorpio',
      'es': '',
      'fr': '',
    },
    '0mjvexwg': {
      'en': 'Sagittarius',
      'es': '',
      'fr': '',
    },
    'e6r4q6n8': {
      'en': 'Capricorn',
      'es': '',
      'fr': '',
    },
    'n1bzir90': {
      'en': 'Aquarius',
      'es': '',
      'fr': '',
    },
    '45wa50r0': {
      'en': 'Pisces',
      'es': '',
      'fr': '',
    },
    '88wtcthb': {
      'en': 'Select relation',
      'es': '',
      'fr': '',
    },
    'qt8wpr36': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'h0qruje8': {
      'en': 'Single',
      'es': '',
      'fr': '',
    },
    '4y0wuhst': {
      'en': 'In a relationship',
      'es': '',
      'fr': '',
    },
    '9w76kclu': {
      'en': 'Married',
      'es': '',
      'fr': '',
    },
    'j0cn7udk': {
      'en': 'Divorced',
      'es': '',
      'fr': '',
    },
    't13lj6n1': {
      'en': 'Widowed',
      'es': '',
      'fr': '',
    },
    '9ygmh515': {
      'en': 'It\'s Complicated',
      'es': '',
      'fr': '',
    },
    'ep43pdjx': {
      'en': 'Select status',
      'es': '',
      'fr': '',
    },
    'v4v3jrxn': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'unw366bt': {
      'en': 'Has Children ',
      'es': '',
      'fr': '',
    },
    's8zxxjjz': {
      'en': 'No Children',
      'es': '',
      'fr': '',
    },
    'v3qeyjhk': {
      'en': 'Wants Children',
      'es': '',
      'fr': '',
    },
    'udw5cc5a': {
      'en': 'Prefer not to say',
      'es': '',
      'fr': '',
    },
    'jj6uhzsa': {
      'en': 'Driver\'s License',
      'es': '',
      'fr': '',
    },
    '4adsll4n': {
      'en': 'Select occupation',
      'es': '',
      'fr': '',
    },
    'gt5e5m8u': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'yahgzg38': {
      'en': 'Worker',
      'es': '',
      'fr': '',
    },
    'j9w5yd1t': {
      'en': 'Student',
      'es': '',
      'fr': '',
    },
    'xjoqzq0o': {
      'en': 'Retired',
      'es': '',
      'fr': '',
    },
    'fnweu033': {
      'en': 'Unemployed',
      'es': '',
      'fr': '',
    },
    'c5jio1ya': {
      'en': 'Other',
      'es': '',
      'fr': '',
    },
    'ik60avf3': {
      'en': 'Select tattoo',
      'es': '',
      'fr': '',
    },
    'd4nliy1m': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'rrng7yso': {
      'en': 'Yes',
      'es': '',
      'fr': '',
    },
    'fm90wmh6': {
      'en': 'No',
      'es': '',
      'fr': '',
    },
    'n6v13vz4': {
      'en': 'Section to promote songs and music styles',
      'es': '',
      'fr': '',
    },
    'tpmtn2d0': {
      'en': 'Select music type',
      'es': '',
      'fr': '',
    },
    'd2thuk72': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    '5a6kmos4': {
      'en': 'Yes',
      'es': '',
      'fr': '',
    },
    '03sk3dgj': {
      'en': 'No',
      'es': '',
      'fr': '',
    },
    'agx3es4h': {
      'en': 'Section to promote dance styles',
      'es': '',
      'fr': '',
    },
    'lisoatc9': {
      'en': 'Select dance type',
      'es': '',
      'fr': '',
    },
    'pwierktd': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'kgx9ezyi': {
      'en': 'Yes',
      'es': '',
      'fr': '',
    },
    '3npsp57y': {
      'en': 'No',
      'es': '',
      'fr': '',
    },
    'pxo5d7s9': {
      'en': 'Username is required',
      'es': '',
      'fr': '',
    },
    'ya10l2zp': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    '6aql9gvt': {
      'en': 'First name is required',
      'es': '',
      'fr': '',
    },
    'ft14erkh': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'k352kgow': {
      'en': 'Last name is required',
      'es': '',
      'fr': '',
    },
    'ga4ow3sy': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'm6grou32': {
      'en': 'Nationality is required',
      'es': '',
      'fr': '',
    },
    'iccr5lmp': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'd6707ib7': {
      'en': 'required',
      'es': '',
      'fr': '',
    },
    'az7ggx2p': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'dap9ggn8': {
      'en': 'required',
      'es': '',
      'fr': '',
    },
    'blhka0cj': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'qqhio50h': {
      'en': 'required',
      'es': '',
      'fr': '',
    },
    'v3oe2w6u': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    '8j1b802s': {
      'en': 'Height is required',
      'es': '',
      'fr': '',
    },
    '57ogxdc2': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'czrxyrxf': {
      'en': 'Weight is required',
      'es': '',
      'fr': '',
    },
    '4nae61fc': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'rwmzn273': {
      'en': 'Ethnicity is required',
      'es': '',
      'fr': '',
    },
    'te6fnl2x': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'd4xua7bz': {
      'en': 'Address is required',
      'es': '',
      'fr': '',
    },
    'b0j58cmj': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'd3yh9k4q': {
      'en': 'Field is required',
      'es': '',
      'fr': '',
    },
    '42nk61q4': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'z10nu90i': {
      'en': 'Field is required',
      'es': '',
      'fr': '',
    },
    '2i2h1cis': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    '6by9ofew': {
      'en': 'Field is required',
      'es': '',
      'fr': '',
    },
    'wy1wxb19': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'hi8b6l1w': {
      'en': 'Agree',
      'es': '',
      'fr': '',
    },
    '21in6rcb': {
      'en': ' terms of use',
      'es': '',
      'fr': '',
    },
    'sdaqmyxm': {
      'en': 'Create Profile',
      'es': '',
      'fr': '',
    },
  },
  // intrologovideo
  {
    '44q3wmr6': {
      'en': 'Upload Intro Video',
      'es': '',
      'fr': '',
    },
    'dy17m32q': {
      'en': 'Company Logo Intro',
      'es': '',
      'fr': '',
    },
    'io9219ap': {
      'en': 'Tap to upload video',
      'es': '',
      'fr': '',
    },
    '5ofjemrd': {
      'en': 'Upload Video',
      'es': '',
      'fr': '',
    },
    '3pc13gnr': {
      'en': 'Record Video',
      'es': '',
      'fr': '',
    },
    'v8jdv2rk': {
      'en': 'Video Requirements',
      'es': '',
      'fr': '',
    },
    'ewl2mm8c': {
      'en': 'Duration: 5-15 seconds',
      'es': '',
      'fr': '',
    },
    's1fwpqen': {
      'en': 'Resolution: 1080p or higher',
      'es': '',
      'fr': '',
    },
    'esli2zxa': {
      'en': 'Aspect Ratio: 16:9',
      'es': '',
      'fr': '',
    },
    'qg4xhr2z': {
      'en': 'Format: MP4 or MOV',
      'es': '',
      'fr': '',
    },
    'x3i6h7zd': {
      'en': 'Video Preview',
      'es': '',
      'fr': '',
    },
    'fjjhvion': {
      'en': 'intro_video.mp4',
      'es': '',
      'fr': '',
    },
    'agjjejgk': {
      'en': '00:12',
      'es': '',
      'fr': '',
    },
    '3f7mfyx1': {
      'en': 'Save and Continue',
      'es': '',
      'fr': '',
    },
  },
  // welcomeuserprofil
  {
    'yp4g45h1': {
      'en': 'Welcome, User',
      'es': '',
      'fr': '',
    },
    'r6rhb4wz': {
      'en': 'Explore, Connect, Create',
      'es': '',
      'fr': '',
    },
    'n7o0dfau': {
      'en': 'Find Friends',
      'es': '',
      'fr': '',
    },
    'rrrkugvz': {
      'en': 'Search for friends, companies, or activities',
      'es': '',
      'fr': '',
    },
    '4z1r7tqw': {
      'en': 'Friends',
      'es': '',
      'fr': '',
    },
    'rtnc2g3y': {
      'en': 'Companies',
      'es': '',
      'fr': '',
    },
    'l4n9dtof': {
      'en': 'Activities',
      'es': '',
      'fr': '',
    },
    'ezjmqt45': {
      'en': 'Chat',
      'es': '',
      'fr': '',
    },
    'wfczknjl': {
      'en': 'Recent Conversations',
      'es': '',
      'fr': '',
    },
    'o0hict00': {
      'en': 'See All',
      'es': '',
      'fr': '',
    },
    'qhmn5a8l': {
      'en': 'JD',
      'es': '',
      'fr': '',
    },
    'ejkafhys': {
      'en': 'John Doe',
      'es': '',
      'fr': '',
    },
    'c24hngat': {
      'en': 'Hey, are you up for soccer tonight?',
      'es': '',
      'fr': '',
    },
    'dx5rfmbl': {
      'en': 'JS',
      'es': '',
      'fr': '',
    },
    'gyqkjuwo': {
      'en': 'Jane Smith',
      'es': '',
      'fr': '',
    },
    'l5aux54p': {
      'en': 'Thanks for organizing the event!',
      'es': '',
      'fr': '',
    },
    'ebdy0h6o': {
      'en': 'Activity Search',
      'es': '',
      'fr': '',
    },
    'l5lvyi5q': {
      'en': 'Select Date',
      'es': '',
      'fr': '',
    },
    'nzbd9ixg': {
      'en': 'Location',
      'es': '',
      'fr': '',
    },
    'bei744qh': {
      'en': 'Activity Type',
      'es': '',
      'fr': '',
    },
    '01z14yg0': {
      'en': 'Search Activities',
      'es': '',
      'fr': '',
    },
    'loghmzfb': {
      'en': 'Create Activity',
      'es': '',
      'fr': '',
    },
    '2ll34jet': {
      'en': 'Activity Name',
      'es': '',
      'fr': '',
    },
    'bdiuj8z3': {
      'en': 'Description',
      'es': '',
      'fr': '',
    },
    'nilrugg8': {
      'en': 'Date',
      'es': '',
      'fr': '',
    },
    '3mouvctg': {
      'en': 'Time',
      'es': '',
      'fr': '',
    },
    '9nuqtt5w': {
      'en': 'Location',
      'es': '',
      'fr': '',
    },
    'it0wk0cy': {
      'en': 'Free',
      'es': '',
      'fr': '',
    },
    'b6bc30aj': {
      'en': 'Paid',
      'es': '',
      'fr': '',
    },
    'kzqb7rbh': {
      'en': 'Create Activity',
      'es': '',
      'fr': '',
    },
    '3sw5j7g5': {
      'en': 'Create Advertisement',
      'es': '',
      'fr': '',
    },
    '35tdw9yr': {
      'en': 'Ad Title',
      'es': '',
      'fr': '',
    },
    'x6y1t9p8': {
      'en': 'Ad Description',
      'es': '',
      'fr': '',
    },
    'sjuqhcpa': {
      'en': 'Upload Photo or Video',
      'es': '',
      'fr': '',
    },
    'x7zwmdb8': {
      'en': 'Global',
      'es': '',
      'fr': '',
    },
    '29mfwfl8': {
      'en': 'Regional',
      'es': '',
      'fr': '',
    },
    'qjba631u': {
      'en': 'Create Advertisement',
      'es': '',
      'fr': '',
    },
    '5am5flvr': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
    'p7b66l3l': {
      'en': 'Chat',
      'es': '',
      'fr': '',
    },
    'x6wuzdjj': {
      'en': 'Create',
      'es': '',
      'fr': '',
    },
    'wmvjqaaf': {
      'en': 'Promote',
      'es': '',
      'fr': '',
    },
  },
  // createbusinessprofil
  {
    'qw7nsurt': {
      'en': 'Create Business Profile',
      'es': '',
      'fr': '',
    },
    'cyo687fm': {
      'en': 'Let\'s set up your company\'s presence',
      'es': '',
      'fr': '',
    },
    '7jr4fse7': {
      'en': 'Company Name',
      'es': '',
      'fr': '',
    },
    'np0fmnem': {
      'en': 'Company Username',
      'es': '',
      'fr': '',
    },
    'eljb16u1': {
      'en': 'Upload Profile Picture',
      'es': '',
      'fr': '',
    },
    'ylsljijy': {
      'en': 'Planet',
      'es': '',
      'fr': '',
    },
    '8as5e81h': {
      'en': 'Select planet',
      'es': '',
      'fr': '',
    },
    'mu0x19ey': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'altfoifu': {
      'en': 'Earth',
      'es': '',
      'fr': '',
    },
    '3nim9qwx': {
      'en': 'Mercury',
      'es': '',
      'fr': '',
    },
    '0z9pry37': {
      'en': 'Venus',
      'es': '',
      'fr': '',
    },
    '769la5gn': {
      'en': 'Mars',
      'es': '',
      'fr': '',
    },
    'tlvgwg18': {
      'en': 'Jupiter',
      'es': '',
      'fr': '',
    },
    'c6ezo44w': {
      'en': 'Saturn',
      'es': '',
      'fr': '',
    },
    'ywszie52': {
      'en': 'Uranus',
      'es': '',
      'fr': '',
    },
    'u52fyapi': {
      'en': 'Neptune',
      'es': '',
      'fr': '',
    },
    'dqkxzx7a': {
      'en': 'Moon',
      'es': '',
      'fr': '',
    },
    'ilanowwa': {
      'en': 'Select Country',
      'es': '',
      'fr': '',
    },
    '9bh2himk': {
      'en': 'Select Region',
      'es': '',
      'fr': '',
    },
    '1vei4s1o': {
      'en': 'Select City',
      'es': '',
      'fr': '',
    },
    '7fra993l': {
      'en': 'Business No. (e.g 123456789)',
      'es': '',
      'fr': '',
    },
    'fjzvqbf2': {
      'en': 'Exact Business Address (Optional)',
      'es': '',
      'fr': '',
    },
    '0zl7zf3v': {
      'en': 'Upload Business Documents',
      'es': '',
      'fr': '',
    },
    '2ks1wta5': {
      'en':
          'Please upload documents proving the existence and validity of your company. These will only be visible to the QUE LO QUE team for verification.',
      'es': '',
      'fr': '',
    },
    '5i7a1glz': {
      'en': 'Upload Documents',
      'es': '',
      'fr': '',
    },
    'vvu7cdmz': {
      'en': 'Document Uploaded',
      'es': '',
      'fr': '',
    },
    'nmwyojt4': {
      'en': 'Upload Profile Media',
      'es': '',
      'fr': '',
    },
    '6lx46qb8': {
      'en': 'Upload 1-10 photos or videos for your company profile',
      'es': '',
      'fr': '',
    },
    '6ptnk3y1': {
      'en': 'Create Profile',
      'es': '',
      'fr': '',
    },
    'zg7dily8': {
      'en':
          'By creating a profile, you agree to our Terms of Service and Privacy Policy',
      'es': '',
      'fr': '',
    },
    'x8y1ti1w': {
      'en': 'company name is required',
      'es': '',
      'fr': '',
    },
    'tgzsvix1': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    '7yhfeipk': {
      'en': 'username is required',
      'es': '',
      'fr': '',
    },
    '9oodqa2j': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'yuezruah': {
      'en': 'business number is required',
      'es': '',
      'fr': '',
    },
    'jbom7mwb': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'vtu55625': {
      'en': 'Field is required',
      'es': '',
      'fr': '',
    },
    'gd42zypx': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
  },
  // userfindfriends
  {
    '17wdr0z5': {
      'en': 'Find Friends',
      'es': '',
      'fr': '',
    },
    '6uxvgcjy': {
      'en': 'Discover new connections',
      'es': '',
      'fr': '',
    },
    'bsh16wxg': {
      'en': 'Search friends, companies, or activities...',
      'es': '',
      'fr': '',
    },
    '6jni1228': {
      'en': 'Filter Options',
      'es': '',
      'fr': '',
    },
    '7cqk082d': {
      'en': 'Male',
      'es': '',
      'fr': '',
    },
    'i3nbyucv': {
      'en': 'Female',
      'es': '',
      'fr': '',
    },
    'dlv18azm': {
      'en': 'Any',
      'es': '',
      'fr': '',
    },
    'b1sdnoyt': {
      'en': 'Alien',
      'es': '',
      'fr': '',
    },
    'hgj1pajn': {
      'en': 'Robot',
      'es': '',
      'fr': '',
    },
    'qkch9ll7': {
      'en': 'Location',
      'es': '',
      'fr': '',
    },
    '0s0dd2eu': {
      'en': 'Age Range',
      'es': '',
      'fr': '',
    },
    'a3oofrpf': {
      'en': '18 - 200',
      'es': '',
      'fr': '',
    },
    'er64sj48': {
      'en': 'Nationality',
      'es': '',
      'fr': '',
    },
    'bqwzovtm': {
      'en': 'Height',
      'es': '',
      'fr': '',
    },
    'lbltudpg': {
      'en': 'Weight',
      'es': '',
      'fr': '',
    },
    'g5set84p': {
      'en': 'Ethnicity',
      'es': '',
      'fr': '',
    },
    'wbcyauot': {
      'en': 'Eye Color',
      'es': '',
      'fr': '',
    },
    'auqb8cie': {
      'en': 'Hair Color',
      'es': '',
      'fr': '',
    },
    'pxu2rpw9': {
      'en': 'Language',
      'es': '',
      'fr': '',
    },
    'rayi3zsh': {
      'en': 'Religion',
      'es': '',
      'fr': '',
    },
    'i2z8414p': {
      'en': 'Astrological Sign',
      'es': '',
      'fr': '',
    },
    '8olccwij': {
      'en': 'Apply Filters',
      'es': '',
      'fr': '',
    },
    '6y6hdyll': {
      'en': 'Suggested Profiles',
      'es': '',
      'fr': '',
    },
    'fw23x06n': {
      'en': 'John Doe',
      'es': '',
      'fr': '',
    },
    'egukgn75': {
      'en': 'New York, USA • 28 years',
      'es': '',
      'fr': '',
    },
    'j3i9gku6': {
      'en': 'Jane Smith',
      'es': '',
      'fr': '',
    },
    'mojl2s3u': {
      'en': 'London, UK • 32 years',
      'es': '',
      'fr': '',
    },
    '7l77tcjx': {
      'en': 'TechCorp Inc.',
      'es': '',
      'fr': '',
    },
    '7zl285ud': {
      'en': 'Technology Company',
      'es': '',
      'fr': '',
    },
  },
  // welcomeuserprofil3
  {
    '9s37h4cf': {
      'en': 'Welcome, User',
      'es': '',
      'fr': '',
    },
    'tx56d1jf': {
      'en': '1,234',
      'es': '',
      'fr': '',
    },
    '7s5as73a': {
      'en': 'Followers',
      'es': '',
      'fr': '',
    },
    'uicocerz': {
      'en': '567',
      'es': '',
      'fr': '',
    },
    'g3raa628': {
      'en': 'Following',
      'es': '',
      'fr': '',
    },
    '10g3plsg': {
      'en': 'Notifications',
      'es': '',
      'fr': '',
    },
    'u12gapnd': {
      'en': '3 new messages',
      'es': '',
      'fr': '',
    },
    'tcfi6rrj': {
      'en': '2 friend requests',
      'es': '',
      'fr': '',
    },
    'uvzoxlcr': {
      'en': '15 new likes',
      'es': '',
      'fr': '',
    },
    'y8gq19kj': {
      'en': 'Upcoming event: Movie Night',
      'es': '',
      'fr': '',
    },
  },
  // useractivitysearchpage
  {
    '1d83ziuw': {
      'en': 'Activity Search',
      'es': '',
      'fr': '',
    },
    'q8kxo0dg': {
      'en': 'Discover exciting events across the universe',
      'es': '',
      'fr': '',
    },
    'ag0tvaiw': {
      'en': 'Search Filters',
      'es': '',
      'fr': '',
    },
    '6y3bdzxr': {
      'en': 'Planet',
      'es': '',
      'fr': '',
    },
    'rutg2vtx': {
      'en': 'Earth',
      'es': '',
      'fr': '',
    },
    '8mhfzaw3': {
      'en': 'Country',
      'es': '',
      'fr': '',
    },
    '4912x95x': {
      'en': 'Select Country',
      'es': '',
      'fr': '',
    },
    '4jvdwaos': {
      'en': 'Region',
      'es': '',
      'fr': '',
    },
    '0onemjjo': {
      'en': 'Select Region',
      'es': '',
      'fr': '',
    },
    '9ttxqchn': {
      'en': 'City',
      'es': '',
      'fr': '',
    },
    'cyu9tij1': {
      'en': 'Select City',
      'es': '',
      'fr': '',
    },
    'jis4xsc5': {
      'en': 'Activity Type',
      'es': '',
      'fr': '',
    },
    'a8xh684l': {
      'en': 'Select Activity Type',
      'es': '',
      'fr': '',
    },
    '5vj78oen': {
      'en': 'Min Price',
      'es': '',
      'fr': '',
    },
    'xvcq7vps': {
      'en': '\$0',
      'es': '',
      'fr': '',
    },
    'u43hx18i': {
      'en': 'Max Price',
      'es': '',
      'fr': '',
    },
    'oc2dgkuj': {
      'en': 'No limit',
      'es': '',
      'fr': '',
    },
    'umczybam': {
      'en': 'Only Free Activities',
      'es': '',
      'fr': '',
    },
    'nsaqkwvv': {
      'en': 'Search Activities',
      'es': '',
      'fr': '',
    },
    'ruacnshj': {
      'en': 'Upcoming Activities',
      'es': '',
      'fr': '',
    },
    '49wgk5rf': {
      'en': 'Intergalactic Music Festival',
      'es': '',
      'fr': '',
    },
    '41a8ulzq': {
      'en': 'Mars, Olympus Mons',
      'es': '',
      'fr': '',
    },
    'u5zh8ljy': {
      'en': 'July 15, 2023',
      'es': '',
      'fr': '',
    },
    'u41db0f0': {
      'en': '150 Credits',
      'es': '',
      'fr': '',
    },
    's2ejfob7': {
      'en': 'Public',
      'es': '',
      'fr': '',
    },
    '4fgpbh75': {
      'en': 'Zero-G Baseball Tournament',
      'es': '',
      'fr': '',
    },
    'u1mhg8yt': {
      'en': 'Moon, Sea of Tranquility',
      'es': '',
      'fr': '',
    },
    'we8scf0u': {
      'en': 'August 5, 2023',
      'es': '',
      'fr': '',
    },
    '0he5blwm': {
      'en': 'Free',
      'es': '',
      'fr': '',
    },
    'a30i0jl7': {
      'en': 'Public',
      'es': '',
      'fr': '',
    },
    'bth5m79c': {
      'en': 'Random Suggestions',
      'es': '',
      'fr': '',
    },
    'bp3t5138': {
      'en': 'Venus Hot Air Balloon Ride',
      'es': '',
      'fr': '',
    },
    't9gahzg9': {
      'en': 'Jupiter Storm Chasing',
      'es': '',
      'fr': '',
    },
    'jsj9hlm1': {
      'en': 'Saturn Ring Surfing',
      'es': '',
      'fr': '',
    },
    '8ze1fhk8': {
      'en': 'Pluto Ice Skating',
      'es': '',
      'fr': '',
    },
    's1kdo3ln': {
      'en': 'Create New Activity',
      'es': '',
      'fr': '',
    },
  },
  // useractivitysearchpage2
  {
    '5ue0mtfg': {
      'en': 'Planet',
      'es': '',
      'fr': '',
    },
    'wk0ay4zt': {
      'en': 'Earth',
      'es': '',
      'fr': '',
    },
    'h5hxoygz': {
      'en': 'Country',
      'es': '',
      'fr': '',
    },
    'a3036v58': {
      'en': 'Select Country',
      'es': '',
      'fr': '',
    },
    'llxuwsd6': {
      'en': 'Region',
      'es': '',
      'fr': '',
    },
    '3td9bmuy': {
      'en': 'Select Region',
      'es': '',
      'fr': '',
    },
    '6ttns3u3': {
      'en': 'City',
      'es': '',
      'fr': '',
    },
    't9a3dzee': {
      'en': 'Select City',
      'es': '',
      'fr': '',
    },
    '9o92zjgu': {
      'en': 'Search Activities',
      'es': '',
      'fr': '',
    },
    'p8idnvws': {
      'en': 'Sports',
      'es': '',
      'fr': '',
    },
    '803v7ivn': {
      'en': 'Concerts',
      'es': '',
      'fr': '',
    },
    'sqafq8k8': {
      'en': 'Parks',
      'es': '',
      'fr': '',
    },
    'c8antrfj': {
      'en': 'Free',
      'es': '',
      'fr': '',
    },
    'fqdrz9jb': {
      'en': 'Paid',
      'es': '',
      'fr': '',
    },
    'kkekuaqr': {
      'en': 'Public',
      'es': '',
      'fr': '',
    },
    'uszjv5ax': {
      'en': 'Private',
      'es': '',
      'fr': '',
    },
    'vbatkucg': {
      'en': 'Search Results',
      'es': '',
      'fr': '',
    },
    '3fqafw6m': {
      'en': 'Soccer Match',
      'es': '',
      'fr': '',
    },
    '3i8wwwqi': {
      'en': 'Parc Jarry, Montreal',
      'es': '',
      'fr': '',
    },
    'z2ehsny4': {
      'en': 'Nov 30, 2024 • 2:00 PM',
      'es': '',
      'fr': '',
    },
    'cc4povop': {
      'en': 'Free',
      'es': '',
      'fr': '',
    },
    '0wc8jshz': {
      'en': 'Public',
      'es': '',
      'fr': '',
    },
    '5rawsoks': {
      'en': 'Join',
      'es': '',
      'fr': '',
    },
    '60kk8zu5': {
      'en': 'Art Exhibition',
      'es': '',
      'fr': '',
    },
    'fogz1rh6': {
      'en': 'Gallery XYZ, New York',
      'es': '',
      'fr': '',
    },
    '970sxwd9': {
      'en': 'Dec 15, 2024 • 10:00 AM',
      'es': '',
      'fr': '',
    },
    '9n4w8k9l': {
      'en': '\$15',
      'es': '',
      'fr': '',
    },
    '1wjns19b': {
      'en': 'Public',
      'es': '',
      'fr': '',
    },
    'cj5mrb5g': {
      'en': 'Join',
      'es': '',
      'fr': '',
    },
    'ct9v69i8': {
      'en': 'Random Suggestions',
      'es': '',
      'fr': '',
    },
    '6dy87olh': {
      'en': 'Beach Volleyball',
      'es': '',
      'fr': '',
    },
    'tsb4y98k': {
      'en': 'Copacabana, Rio',
      'es': '',
      'fr': '',
    },
    '52w3hyp1': {
      'en': 'Dec 5, 2024',
      'es': '',
      'fr': '',
    },
    '93i0r44s': {
      'en': 'Free',
      'es': '',
      'fr': '',
    },
    'wsgw7psb': {
      'en': 'Cooking Class',
      'es': '',
      'fr': '',
    },
    'tom0q634': {
      'en': 'Culinary Institute, Paris',
      'es': '',
      'fr': '',
    },
    '4aqb2m6n': {
      'en': 'Jan 10, 2025',
      'es': '',
      'fr': '',
    },
    '4xoigk3a': {
      'en': '\$50',
      'es': '',
      'fr': '',
    },
    'bpq3l85n': {
      'en': 'Stargazing',
      'es': '',
      'fr': '',
    },
    'vur547l5': {
      'en': 'Observatory, Hawaii',
      'es': '',
      'fr': '',
    },
    'bn6nznds': {
      'en': 'Feb 14, 2025',
      'es': '',
      'fr': '',
    },
    '90vn43ou': {
      'en': 'Public',
      'es': '',
      'fr': '',
    },
  },
  // usercreateactivitypage
  {
    'krr8bcob': {
      'en': 'Create Activity',
      'es': '',
      'fr': '',
    },
    'x55uf2eg': {
      'en': 'Organize your event and connect with others',
      'es': '',
      'fr': '',
    },
    'az5k6hbn': {
      'en': 'Basic Information',
      'es': '',
      'fr': '',
    },
    'zrgato6o': {
      'en': 'Earth',
      'es': '',
      'fr': '',
    },
    'k311gvgy': {
      'en': 'Mercury',
      'es': '',
      'fr': '',
    },
    'snmgognt': {
      'en': 'Venus',
      'es': '',
      'fr': '',
    },
    'epaelmvu': {
      'en': 'Mars',
      'es': '',
      'fr': '',
    },
    'nd1ekq7a': {
      'en': 'Jupiter',
      'es': '',
      'fr': '',
    },
    'mg2vagx8': {
      'en': 'Saturn',
      'es': '',
      'fr': '',
    },
    'z6705lqw': {
      'en': 'Uranus',
      'es': '',
      'fr': '',
    },
    'bvgr4qs7': {
      'en': 'Neptune',
      'es': '',
      'fr': '',
    },
    'btxm2r9o': {
      'en': 'Moon',
      'es': '',
      'fr': '',
    },
    '8pyrzva7': {
      'en': 'Select Country',
      'es': '',
      'fr': '',
    },
    '4hgbmxos': {
      'en': 'Select Region',
      'es': '',
      'fr': '',
    },
    '34kie6pz': {
      'en': 'Select City',
      'es': '',
      'fr': '',
    },
    'x5xfgbo5': {
      'en': 'Activity Address',
      'es': '',
      'fr': '',
    },
    '2lphx10a': {
      'en': 'Activity Details',
      'es': '',
      'fr': '',
    },
    '96g8mlx6': {
      'en': 'Date',
      'es': '',
      'fr': '',
    },
    '2kne2j18': {
      'en': 'Select Date',
      'es': '',
      'fr': '',
    },
    'pon2tmmt': {
      'en': 'Time',
      'es': '',
      'fr': '',
    },
    'jhhpirzk': {
      'en': 'Select Time',
      'es': '',
      'fr': '',
    },
    '63qyhyjq': {
      'en': 'Is this activity free?',
      'es': '',
      'fr': '',
    },
    '15g3pb3a': {
      'en': 'Select Activity Category',
      'es': '',
      'fr': '',
    },
    'lsnl7kw7': {
      'en': 'Public',
      'es': '',
      'fr': '',
    },
    'bnph47uy': {
      'en': 'Friends Only',
      'es': '',
      'fr': '',
    },
    'jk28f4xe': {
      'en': 'Private',
      'es': '',
      'fr': '',
    },
    '7i7wajw9': {
      'en': 'Number of Participants',
      'es': '',
      'fr': '',
    },
    'fnralnfz': {
      'en': 'Activity Description',
      'es': '',
      'fr': '',
    },
    'wqent52w': {
      'en': 'Description',
      'es': '',
      'fr': '',
    },
    'sn216cwj': {
      'en': 'Add Photo/Video',
      'es': '',
      'fr': '',
    },
    'po8fefym': {
      'en': 'Location Link (Optional)',
      'es': '',
      'fr': '',
    },
    '1af03b4e': {
      'en': 'Visibility Options',
      'es': '',
      'fr': '',
    },
    'r9cb15xc': {
      'en': 'Promote Activity',
      'es': '',
      'fr': '',
    },
    'kdj6hatc': {
      'en':
          'Promoting your activity will place it at the top of the list for increased visibility. Additional charges may apply.',
      'es': '',
      'fr': '',
    },
    '9508fugq': {
      'en': 'Create Activity',
      'es': '',
      'fr': '',
    },
  },
  // userchatpage
  {
    'fz9d3azv': {
      'en': 'Chat',
      'es': '',
      'fr': '',
    },
    'ao1ue5ny': {
      'en': 'Connect with friends and groups',
      'es': '',
      'fr': '',
    },
    'wl41483o': {
      'en': 'Search chats...',
      'es': '',
      'fr': '',
    },
    'rm5w9eu2': {
      'en': 'Stories',
      'es': '',
      'fr': '',
    },
    '9k94l8sy': {
      'en': 'Add Story',
      'es': '',
      'fr': '',
    },
    '8kn5vsh2': {
      'en': 'John',
      'es': '',
      'fr': '',
    },
    'k9tf5zhu': {
      'en': 'Emma',
      'es': '',
      'fr': '',
    },
    '781bxm9z': {
      'en': 'Alex',
      'es': '',
      'fr': '',
    },
    '6kygqigv': {
      'en': 'Sarah Johnson',
      'es': '',
      'fr': '',
    },
    '2y6gh91z': {
      'en': 'Hey, how\'s it going?',
      'es': '',
      'fr': '',
    },
    '36ujtq01': {
      'en': '2m ago',
      'es': '',
      'fr': '',
    },
    'zhzgv4c2': {
      'en': '2',
      'es': '',
      'fr': '',
    },
    'npg6o99f': {
      'en': 'Project Alpha Team',
      'es': '',
      'fr': '',
    },
    '812h3u41': {
      'en': 'Meeting at 3 PM today',
      'es': '',
      'fr': '',
    },
    '01wrw4h2': {
      'en': '1h ago',
      'es': '',
      'fr': '',
    },
    'jkmq6jpe': {
      'en': '5',
      'es': '',
      'fr': '',
    },
    'k3xi3t76': {
      'en': 'Mike Smith',
      'es': '',
      'fr': '',
    },
    'i6ulmg91': {
      'en': 'Voice message (0:30)',
      'es': '',
      'fr': '',
    },
    'wazivbjc': {
      'en': 'Yesterday',
      'es': '',
      'fr': '',
    },
    'suvnqegv': {
      'en': 'Chats',
      'es': '',
      'fr': '',
    },
    '6v293hvr': {
      'en': 'Groups',
      'es': '',
      'fr': '',
    },
    'o4rz0e71': {
      'en': 'Calls',
      'es': '',
      'fr': '',
    },
    'c6ccmjs5': {
      'en': 'Profile',
      'es': '',
      'fr': '',
    },
  },
  // usercreateadvertisepage
  {
    'xli7f1jy': {
      'en': 'Create Advertisement',
      'es': '',
      'fr': '',
    },
    'pv9kfzsm': {
      'en': 'Promote your event or content',
      'es': '',
      'fr': '',
    },
    'xq6mr83d': {
      'en': 'Advertisement Details',
      'es': '',
      'fr': '',
    },
    '6tw128v1': {
      'en': 'Content Type',
      'es': '',
      'fr': '',
    },
    '6dybm7wn': {
      'en': 'Flyer',
      'es': '',
      'fr': '',
    },
    'lo9g4d0f': {
      'en': 'Photo',
      'es': '',
      'fr': '',
    },
    'wxx8qii7': {
      'en': 'Video',
      'es': '',
      'fr': '',
    },
    'bj75yq20': {
      'en': 'Description',
      'es': '',
      'fr': '',
    },
    'kd23aiwd': {
      'en': 'Promotion Link',
      'es': '',
      'fr': '',
    },
    'jamq1nsz': {
      'en': 'Category',
      'es': '',
      'fr': '',
    },
    'necq40lc': {
      'en': 'Location Details',
      'es': '',
      'fr': '',
    },
    'qonsipgn': {
      'en': 'Planet',
      'es': '',
      'fr': '',
    },
    'qyelnr7p': {
      'en': 'Mercury',
      'es': '',
      'fr': '',
    },
    'w17x3r3l': {
      'en': 'Venus',
      'es': '',
      'fr': '',
    },
    '44dhob3n': {
      'en': 'Earth',
      'es': '',
      'fr': '',
    },
    'eg0mys8e': {
      'en': 'Mars',
      'es': '',
      'fr': '',
    },
    'kots93wy': {
      'en': 'Jupiter',
      'es': '',
      'fr': '',
    },
    'dqt5xw18': {
      'en': 'Saturn',
      'es': '',
      'fr': '',
    },
    '6w5kkg1y': {
      'en': 'Uranus',
      'es': '',
      'fr': '',
    },
    '0i57j9aq': {
      'en': 'Neptune',
      'es': '',
      'fr': '',
    },
    'ol8vcly1': {
      'en': 'Moon',
      'es': '',
      'fr': '',
    },
    '4ieya7xw': {
      'en': 'Select Country',
      'es': '',
      'fr': '',
    },
    '43rp8kcj': {
      'en': 'Select Region',
      'es': '',
      'fr': '',
    },
    'oxlrvexq': {
      'en': 'Select City',
      'es': '',
      'fr': '',
    },
    'z5wqkv8v': {
      'en': 'Promotion Options',
      'es': '',
      'fr': '',
    },
    'm2mm3iwe': {
      'en': 'Keep Ad Active',
      'es': '',
      'fr': '',
    },
    'dwfvq54f': {
      'en': 'Priority Placement',
      'es': '',
      'fr': '',
    },
    'ygn6y5vn': {
      'en': 'Duration: 7 days',
      'es': '',
      'fr': '',
    },
    '0a97x7zc': {
      'en': 'Create Advertisement',
      'es': '',
      'fr': '',
    },
    'pfz09tv0': {
      'en': 'Search Advertisements',
      'es': '',
      'fr': '',
    },
    'hkfrcn8q': {
      'en': 'Search by category, location...',
      'es': '',
      'fr': '',
    },
    '17d8k4qu': {
      'en': 'Featured Ads',
      'es': '',
      'fr': '',
    },
    '3w6s6f0d': {
      'en': 'Live Jazz Night',
      'es': '',
      'fr': '',
    },
    '9b36o3hh': {
      'en':
          'Join us for an unforgettable evening of smooth jazz and soulful melodies.',
      'es': '',
      'fr': '',
    },
    'ykfj5chu': {
      'en': 'New York, USA',
      'es': '',
      'fr': '',
    },
    'timkde75': {
      'en': 'Earth',
      'es': '',
      'fr': '',
    },
    'ru8h7xue': {
      'en': 'Modern Art Showcase',
      'es': '',
      'fr': '',
    },
    'f97ogv55': {
      'en': 'Experience the future of art in our cutting-edge exhibition.',
      'es': '',
      'fr': '',
    },
    'ms2ehl4n': {
      'en': 'Paris, France',
      'es': '',
      'fr': '',
    },
    'pl7g22qt': {
      'en': 'Earth',
      'es': '',
      'fr': '',
    },
    'yn3hssah': {
      'en': 'Worldwide Suggestions',
      'es': '',
      'fr': '',
    },
    't3g4v0c7': {
      'en': 'Virtual Reality Experience',
      'es': '',
      'fr': '',
    },
    'c4z18ku5': {
      'en': 'Immerse yourself in new worlds',
      'es': '',
      'fr': '',
    },
    'e2r816s8': {
      'en': 'Tokyo, Japan',
      'es': '',
      'fr': '',
    },
    '6dpjw6jl': {
      'en': 'Earth',
      'es': '',
      'fr': '',
    },
    'dtmxqn27': {
      'en': 'Mars Colony Tour',
      'es': '',
      'fr': '',
    },
    '3ce00oos': {
      'en': 'Experience life on the Red Planet',
      'es': '',
      'fr': '',
    },
    '1merifm0': {
      'en': 'Olympus Mons',
      'es': '',
      'fr': '',
    },
    'osk9fgrg': {
      'en': 'Mars',
      'es': '',
      'fr': '',
    },
  },
  // usecreateactivitycongratspage
  {
    'sxkb711c': {
      'en': 'Congratulations!',
      'es': '',
      'fr': '',
    },
    'agy3cvlj': {
      'en': 'Your activity has been created successfully!',
      'es': '',
      'fr': '',
    },
    'ssczcmcm': {
      'en': 'What\'s Next?',
      'es': '',
      'fr': '',
    },
    'wrngq12i': {
      'en': 'Invite friends to join your activity',
      'es': '',
      'fr': '',
    },
    'm00vwe97': {
      'en': 'Edit your activity details anytime',
      'es': '',
      'fr': '',
    },
    'll1rcca5': {
      'en': 'Receive updates about participants',
      'es': '',
      'fr': '',
    },
    'gsvzp6gt': {
      'en': 'Back to home',
      'es': '',
      'fr': '',
    },
  },
  // userpaymentpromotepage
  {
    'qe9ogf6e': {
      'en': 'Payment Amount',
      'es': '',
      'fr': '',
    },
    'ip6yyozn': {
      'en': '\$99.99',
      'es': '',
      'fr': '',
    },
    'xf90oa35': {
      'en': 'Monthly Subscription',
      'es': '',
      'fr': '',
    },
    'aqoneq5v': {
      'en': 'Payment Method',
      'es': '',
      'fr': '',
    },
    'bbbvflhe': {
      'en': 'Credit Card',
      'es': '',
      'fr': '',
    },
    'f16ags0s': {
      'en': 'Bank Transfer',
      'es': '',
      'fr': '',
    },
    'kdsxh2yg': {
      'en': 'PayPal',
      'es': '',
      'fr': '',
    },
    'tztf6tae': {
      'en': 'Card Details',
      'es': '',
      'fr': '',
    },
    '5qn27rf2': {
      'en': 'Card Number',
      'es': '',
      'fr': '',
    },
    'j00biujt': {
      'en': 'Expiry Date',
      'es': '',
      'fr': '',
    },
    '4y27ovdt': {
      'en': 'CVV',
      'es': '',
      'fr': '',
    },
    'y2n6dhj1': {
      'en': 'Cardholder Name',
      'es': '',
      'fr': '',
    },
    'gazybyap': {
      'en': 'Payment Summary',
      'es': '',
      'fr': '',
    },
    'w3693rxc': {
      'en': 'Subtotal',
      'es': '',
      'fr': '',
    },
    '5u32cneo': {
      'en': '\$99.99',
      'es': '',
      'fr': '',
    },
    'u451ugh1': {
      'en': 'Tax',
      'es': '',
      'fr': '',
    },
    'u2hp69os': {
      'en': '\$5.00',
      'es': '',
      'fr': '',
    },
    '9w7nh7kn': {
      'en': 'Total',
      'es': '',
      'fr': '',
    },
    'cs25lcpd': {
      'en': '\$104.99',
      'es': '',
      'fr': '',
    },
    'l60dbm9s': {
      'en': 'Complete Payment',
      'es': '',
      'fr': '',
    },
  },
  // usercreatepromotethankspage
  {
    'm6am6z1r': {
      'en': 'Thank You!',
      'es': '',
      'fr': '',
    },
    'ne9tl4wq': {
      'en': 'Your payment has been processed successfully.',
      'es': '',
      'fr': '',
    },
    'jmo186f9': {
      'en': 'Promotion Details',
      'es': '',
      'fr': '',
    },
    'pb20rnna': {
      'en': 'Your promotion will begin shortly. Here\'s what to expect:',
      'es': '',
      'fr': '',
    },
    'gc9y5yon': {
      'en': 'Increased visibility within minutes',
      'es': '',
      'fr': '',
    },
    '0dbl4zs5': {
      'en': 'Boost in engagement and reach',
      'es': '',
      'fr': '',
    },
    'vyje9tst': {
      'en': 'Real-time performance tracking',
      'es': '',
      'fr': '',
    },
    'eit603an': {
      'en': 'We\'ll notify you once your promotion is live!',
      'es': '',
      'fr': '',
    },
    'key6ewoa': {
      'en': 'View Dashboard',
      'es': '',
      'fr': '',
    },
    '2k2rp0s7': {
      'en': 'Need help? ',
      'es': '',
      'fr': '',
    },
    'h9ym28dl': {
      'en': 'Contact Support',
      'es': '',
      'fr': '',
    },
  },
  // Welcomebusinessuser
  {
    'uc9giiqd': {
      'en': 'Welcome, Business Name',
      'es': '',
      'fr': '',
    },
    '6s5mdoan': {
      'en': 'Your business dashboard',
      'es': '',
      'fr': '',
    },
    '85qao0ax': {
      'en': 'Recent Messages',
      'es': '',
      'fr': '',
    },
    'vrhkz2li': {
      'en': 'John Doe',
      'es': '',
      'fr': '',
    },
    'p10t5ko6': {
      'en': 'New partnership opportunity',
      'es': '',
      'fr': '',
    },
    '90xy98jo': {
      'en': '2m ago',
      'es': '',
      'fr': '',
    },
    '673ohyb2': {
      'en': 'Sarah Smith',
      'es': '',
      'fr': '',
    },
    'z70ylq9e': {
      'en': 'Project update: Q3 goals',
      'es': '',
      'fr': '',
    },
    '8x0gzldh': {
      'en': '1h ago',
      'es': '',
      'fr': '',
    },
    'afuz2h51': {
      'en': 'Alerts',
      'es': '',
      'fr': '',
    },
    'jl6asrx0': {
      'en': 'New security update available',
      'es': '',
      'fr': '',
    },
    'c8axk2ur': {
      'en': 'Q2 Financial report approved',
      'es': '',
      'fr': '',
    },
    'a08zya7u': {
      'en': 'Upcoming Events',
      'es': '',
      'fr': '',
    },
    'iqkj3gl7': {
      'en': 'Team Building Workshop',
      'es': '',
      'fr': '',
    },
    'ljqf52fg': {
      'en': 'July 15, 2023 • 2:00 PM',
      'es': '',
      'fr': '',
    },
    'grq5v9s2': {
      'en': 'View',
      'es': '',
      'fr': '',
    },
    'ysmchwwu': {
      'en': 'Quarterly Board Meeting',
      'es': '',
      'fr': '',
    },
    'iui0jd9m': {
      'en': 'July 30, 2023 • 10:00 AM',
      'es': '',
      'fr': '',
    },
    'hmmohfxa': {
      'en': 'View',
      'es': '',
      'fr': '',
    },
    '7m429jzo': {
      'en': 'New Connections',
      'es': '',
      'fr': '',
    },
    'lmf1wz8o': {
      'en': 'Emily Johnson',
      'es': '',
      'fr': '',
    },
    'hd2totz5': {
      'en': 'Marketing Director at TechCorp',
      'es': '',
      'fr': '',
    },
    'v51y47cw': {
      'en': 'Connect',
      'es': '',
      'fr': '',
    },
    'rb47b3oe': {
      'en': 'Michael Brown',
      'es': '',
      'fr': '',
    },
    'gv7emige': {
      'en': 'CEO at InnovateCo',
      'es': '',
      'fr': '',
    },
    'brzga14g': {
      'en': 'Connect',
      'es': '',
      'fr': '',
    },
    '74z1w2ru': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
    '0ggvoi17': {
      'en': 'Chat',
      'es': '',
      'fr': '',
    },
    'qww536se': {
      'en': 'Network',
      'es': '',
      'fr': '',
    },
    '0rmpfypf': {
      'en': 'Activities',
      'es': '',
      'fr': '',
    },
    '9u7y0t17': {
      'en': 'Explore',
      'es': '',
      'fr': '',
    },
  },
  // Welcomebusinesspage2
  {
    's90pkfi2': {
      'en': 'TechInnovate Solutions',
      'es': '',
      'fr': '',
    },
    'b6504bfy': {
      'en': '@techinnovate',
      'es': '',
      'fr': '',
    },
    'kc4u945w': {
      'en': '256',
      'es': '',
      'fr': '',
    },
    '0whp7ax6': {
      'en': 'Following',
      'es': '',
      'fr': '',
    },
    'q496k4td': {
      'en': '1.2K',
      'es': '',
      'fr': '',
    },
    'pzs4z7eu': {
      'en': 'Followers',
      'es': '',
      'fr': '',
    },
    'cq6ko41p': {
      'en': 'Welcome back, TechInnovate!',
      'es': '',
      'fr': '',
    },
    '9v9ue0n7': {
      'en': 'Upcoming Event',
      'es': '',
      'fr': '',
    },
    'n6a5noxx': {
      'en': 'Tech Expo 2023',
      'es': '',
      'fr': '',
    },
    'k3p2vf8r': {
      'en':
          'Join us at the annual Tech Expo on July 15th, 2023. Showcase your latest innovations!',
      'es': '',
      'fr': '',
    },
    'mg6o1u2n': {
      'en': 'New Messages',
      'es': '',
      'fr': '',
    },
    'wef8b1ae': {
      'en': '3 new messages from potential clients',
      'es': '',
      'fr': '',
    },
    'g8sqrwjg': {
      'en': 'Check your inbox to respond promptly.',
      'es': '',
      'fr': '',
    },
    'xnz8otd2': {
      'en': 'New Follower',
      'es': '',
      'fr': '',
    },
    'ay2spiqm': {
      'en': 'InnovateTech Corp is now following you',
      'es': '',
      'fr': '',
    },
    'l0l1kvu4': {
      'en': 'Expand your network and explore collaboration opportunities.',
      'es': '',
      'fr': '',
    },
  },
  // creatabusinessactivitypage
  {
    '13vhjjto': {
      'en': 'Adventure Seekers Inc.',
      'es': '',
      'fr': '',
    },
    '9tz24irt': {
      'en': 'Reliability Rating: 5 stars',
      'es': '',
      'fr': '',
    },
    'zx0latbb': {
      'en': 'Create New Activity',
      'es': '',
      'fr': '',
    },
    '6s8qdqr6': {
      'en': 'Planet',
      'es': '',
      'fr': '',
    },
    '5sten2rs': {
      'en': 'Earth',
      'es': '',
      'fr': '',
    },
    'g3z1h5pt': {
      'en': 'Country',
      'es': '',
      'fr': '',
    },
    'gohh8ul6': {
      'en': 'Select Country',
      'es': '',
      'fr': '',
    },
    'vmqo2zs5': {
      'en': 'Province/State',
      'es': '',
      'fr': '',
    },
    'ak3n2xz9': {
      'en': 'Select Province',
      'es': '',
      'fr': '',
    },
    'mv7qb1pi': {
      'en': 'City/Village',
      'es': '',
      'fr': '',
    },
    'hyo1lhv9': {
      'en': 'Select City',
      'es': '',
      'fr': '',
    },
    '5v7u78ax': {
      'en': 'Address',
      'es': '',
      'fr': '',
    },
    'ryp8ji8z': {
      'en': 'Date',
      'es': '',
      'fr': '',
    },
    'haxp4f35': {
      'en': 'Select Date',
      'es': '',
      'fr': '',
    },
    '34mqd2lj': {
      'en': 'Time',
      'es': '',
      'fr': '',
    },
    '0k9r86gi': {
      'en': 'Select Time',
      'es': '',
      'fr': '',
    },
    '4wdtg5xb': {
      'en': 'Activity Type',
      'es': '',
      'fr': '',
    },
    '38y1wifm': {
      'en': 'Free',
      'es': '',
      'fr': '',
    },
    'a4k9hwcj': {
      'en': 'Paid',
      'es': '',
      'fr': '',
    },
    '245tvjke': {
      'en': 'Activity Category',
      'es': '',
      'fr': '',
    },
    'vvagdpf0': {
      'en': 'Select Category',
      'es': '',
      'fr': '',
    },
    '0js1f7wr': {
      'en': 'Visibility',
      'es': '',
      'fr': '',
    },
    'lzlwdeab': {
      'en': 'Public',
      'es': '',
      'fr': '',
    },
    'sanfil2a': {
      'en': 'Participant Limit',
      'es': '',
      'fr': '',
    },
    '2s8exo0v': {
      'en': '10',
      'es': '',
      'fr': '',
    },
    'jh6yzorw': {
      'en': 'Invite Friends',
      'es': '',
      'fr': '',
    },
    'rw80sjxb': {
      'en': 'Description',
      'es': '',
      'fr': '',
    },
    'b4231cew': {
      'en': 'Add Photo',
      'es': '',
      'fr': '',
    },
    'fp3zvkpu': {
      'en': 'Add Video',
      'es': '',
      'fr': '',
    },
    'r3a1vm5m': {
      'en': 'Add Location',
      'es': '',
      'fr': '',
    },
    'cjs121dn': {
      'en': 'Enable Double Confirmation',
      'es': '',
      'fr': '',
    },
    'b1nwyfoz': {
      'en': 'Create Activity',
      'es': '',
      'fr': '',
    },
    'j8gcn98z': {
      'en': 'Promote Activity',
      'es': '',
      'fr': '',
    },
    'er4tiq2x': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
    'y9997fo1': {
      'en': 'Chat',
      'es': '',
      'fr': '',
    },
    'sdgmwduu': {
      'en': 'Search',
      'es': '',
      'fr': '',
    },
    'r4r4gdrt': {
      'en': 'Create',
      'es': '',
      'fr': '',
    },
    '2sc4tmxt': {
      'en': 'Promote',
      'es': '',
      'fr': '',
    },
  },
  // businesschatpage
  {
    '1qchux6g': {
      'en': 'Chat',
      'es': '',
      'fr': '',
    },
    'rp3dm7tp': {
      'en': 'Connect with friends and colleagues',
      'es': '',
      'fr': '',
    },
    '1gv013zw': {
      'en': 'Search friends or conversations...',
      'es': '',
      'fr': '',
    },
    '6smm476r': {
      'en': 'Friend Requests',
      'es': '',
      'fr': '',
    },
    'q49rnbpt': {
      'en': 'John Doe',
      'es': '',
      'fr': '',
    },
    '28xprkw2': {
      'en': 'Wants to connect',
      'es': '',
      'fr': '',
    },
    'stoqd9de': {
      'en': 'Accept',
      'es': '',
      'fr': '',
    },
    '3x6z2z47': {
      'en': 'Decline',
      'es': '',
      'fr': '',
    },
    'pi3horbt': {
      'en': 'Recent Chats',
      'es': '',
      'fr': '',
    },
    'vi1gqa2w': {
      'en': 'Alice Smith',
      'es': '',
      'fr': '',
    },
    '4qx0arbp': {
      'en': 'Hey, how\'s it going?',
      'es': '',
      'fr': '',
    },
    '9oxjjj38': {
      'en': '2m ago',
      'es': '',
      'fr': '',
    },
    'trnmwcxx': {
      'en': '2',
      'es': '',
      'fr': '',
    },
    'o7lxazm0': {
      'en': 'Marketing Team',
      'es': '',
      'fr': '',
    },
    'cvu23yo7': {
      'en': 'Sarah: Meeting at 3 PM',
      'es': '',
      'fr': '',
    },
    'bhjlhoik': {
      'en': '1h ago',
      'es': '',
      'fr': '',
    },
    'h2ykahnf': {
      'en': 'Stories',
      'es': '',
      'fr': '',
    },
    '060l3vyg': {
      'en': 'Add Story',
      'es': '',
      'fr': '',
    },
    'ckso334s': {
      'en': 'Your Story',
      'es': '',
      'fr': '',
    },
    'xe89hhb4': {
      'en': 'Emma',
      'es': '',
      'fr': '',
    },
    'a7c6reu5': {
      'en': 'Mike',
      'es': '',
      'fr': '',
    },
    '6165zjee': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
    'qq1rqozs': {
      'en': 'Chat',
      'es': '',
      'fr': '',
    },
    'hf77gggn': {
      'en': 'Search',
      'es': '',
      'fr': '',
    },
    '3buns0iz': {
      'en': 'Create',
      'es': '',
      'fr': '',
    },
    'fkmaznuz': {
      'en': 'Promote',
      'es': '',
      'fr': '',
    },
  },
  // userfindfriendsCopy
  {
    'txzh8gqo': {
      'en': 'Find Friends',
      'es': '',
      'fr': '',
    },
    'x7ykkub3': {
      'en': 'Discover new connections',
      'es': '',
      'fr': '',
    },
    '0lrcfssf': {
      'en': 'Search friends, companies, or activities...',
      'es': '',
      'fr': '',
    },
    'duwqjiv5': {
      'en': 'Filter Options',
      'es': '',
      'fr': '',
    },
    'l5g67kv1': {
      'en': 'Male',
      'es': '',
      'fr': '',
    },
    '3kopb5n4': {
      'en': 'Female',
      'es': '',
      'fr': '',
    },
    '0x32su20': {
      'en': 'Any',
      'es': '',
      'fr': '',
    },
    '6f6ff996': {
      'en': 'Location',
      'es': '',
      'fr': '',
    },
    'tnit0a8b': {
      'en': 'Age Range',
      'es': '',
      'fr': '',
    },
    'ohbtxjs1': {
      'en': '18 - 200',
      'es': '',
      'fr': '',
    },
    'cs2md3k9': {
      'en': 'Nationality',
      'es': '',
      'fr': '',
    },
    '5gkn9r8e': {
      'en': 'Height',
      'es': '',
      'fr': '',
    },
    'n5rla67z': {
      'en': 'Weight',
      'es': '',
      'fr': '',
    },
    '1psf5z0a': {
      'en': 'Ethnicity',
      'es': '',
      'fr': '',
    },
    'l5dm6qba': {
      'en': 'Eye Color',
      'es': '',
      'fr': '',
    },
    'yslfs9rb': {
      'en': 'Hair Color',
      'es': '',
      'fr': '',
    },
    'e0vvanc8': {
      'en': 'Language',
      'es': '',
      'fr': '',
    },
    '2c7g0g5v': {
      'en': 'Religion',
      'es': '',
      'fr': '',
    },
    'ipahdsyx': {
      'en': 'Astrological Sign',
      'es': '',
      'fr': '',
    },
    'hh3byyvx': {
      'en': 'Apply Filters',
      'es': '',
      'fr': '',
    },
    'ic5988pu': {
      'en': 'Suggested Profiles',
      'es': '',
      'fr': '',
    },
    'zrecwma4': {
      'en': 'John Doe',
      'es': '',
      'fr': '',
    },
    'd8ht3dmf': {
      'en': 'New York, USA • 28 years',
      'es': '',
      'fr': '',
    },
    '17br273v': {
      'en': 'Jane Smith',
      'es': '',
      'fr': '',
    },
    'fidddkrl': {
      'en': 'London, UK • 32 years',
      'es': '',
      'fr': '',
    },
    'c3vcg93o': {
      'en': 'TechCorp Inc.',
      'es': '',
      'fr': '',
    },
    'lp7opmdn': {
      'en': 'Technology Company',
      'es': '',
      'fr': '',
    },
  },
  // usercreateadvertisepageCopy
  {
    'xlst6xq1': {
      'en': 'Create Advertisement',
      'es': '',
      'fr': '',
    },
    '5mffxn7u': {
      'en': 'Promote your event or content',
      'es': '',
      'fr': '',
    },
    'hnx1jyeh': {
      'en': 'Advertisement Details',
      'es': '',
      'fr': '',
    },
    '1bgwr38e': {
      'en': 'Content Type',
      'es': '',
      'fr': '',
    },
    'i6ueeva1': {
      'en': 'Flyer',
      'es': '',
      'fr': '',
    },
    'x87b5913': {
      'en': 'Photo',
      'es': '',
      'fr': '',
    },
    'ylcxiea3': {
      'en': 'Video',
      'es': '',
      'fr': '',
    },
    's6qfs0dy': {
      'en': 'Description',
      'es': '',
      'fr': '',
    },
    'slfszzdj': {
      'en': 'Promotion Link',
      'es': '',
      'fr': '',
    },
    '4f8yei3d': {
      'en': 'Category',
      'es': '',
      'fr': '',
    },
    'hbtn5aih': {
      'en': 'Location Details',
      'es': '',
      'fr': '',
    },
    'o9yxfn7z': {
      'en': 'Planet',
      'es': '',
      'fr': '',
    },
    '9z63t2ul': {
      'en': 'Mercury',
      'es': '',
      'fr': '',
    },
    'k97zqdqr': {
      'en': 'Venus',
      'es': '',
      'fr': '',
    },
    'xbvxjn5i': {
      'en': 'Earth',
      'es': '',
      'fr': '',
    },
    'a98dtcxa': {
      'en': 'Mars',
      'es': '',
      'fr': '',
    },
    'nx8tlteo': {
      'en': 'Jupiter',
      'es': '',
      'fr': '',
    },
    'ex3rcs5c': {
      'en': 'Saturn',
      'es': '',
      'fr': '',
    },
    'jgyumyxg': {
      'en': 'Uranus',
      'es': '',
      'fr': '',
    },
    '9wyly6gl': {
      'en': 'Neptune',
      'es': '',
      'fr': '',
    },
    '70mxfdsi': {
      'en': 'Moon',
      'es': '',
      'fr': '',
    },
    '0nq5am5z': {
      'en': 'Select Country',
      'es': '',
      'fr': '',
    },
    'rvond24r': {
      'en': 'Select Region',
      'es': '',
      'fr': '',
    },
    'gxpgsduw': {
      'en': 'Select City',
      'es': '',
      'fr': '',
    },
    'e7tvv5da': {
      'en': 'Promotion Options',
      'es': '',
      'fr': '',
    },
    '5do9cbpb': {
      'en': 'Keep Ad Active',
      'es': '',
      'fr': '',
    },
    'tn9gmvgj': {
      'en': 'Priority Placement',
      'es': '',
      'fr': '',
    },
    'j2oj4j6y': {
      'en': 'Duration: 7 days',
      'es': '',
      'fr': '',
    },
    'utu0zpm9': {
      'en': 'Create Advertisement',
      'es': '',
      'fr': '',
    },
    'i6iiqcmz': {
      'en': 'Search Advertisements',
      'es': '',
      'fr': '',
    },
    'zb3nazoc': {
      'en': 'Search by category, location...',
      'es': '',
      'fr': '',
    },
    'k55ct7ra': {
      'en': 'Featured Ads',
      'es': '',
      'fr': '',
    },
    'n1fo8yag': {
      'en': 'Live Jazz Night',
      'es': '',
      'fr': '',
    },
    '7pdsjyl4': {
      'en':
          'Join us for an unforgettable evening of smooth jazz and soulful melodies.',
      'es': '',
      'fr': '',
    },
    'ho730cge': {
      'en': 'New York, USA',
      'es': '',
      'fr': '',
    },
    'hxmjpwmj': {
      'en': 'Earth',
      'es': '',
      'fr': '',
    },
    'ovwvuvhl': {
      'en': 'Modern Art Showcase',
      'es': '',
      'fr': '',
    },
    'sa48zvl2': {
      'en': 'Experience the future of art in our cutting-edge exhibition.',
      'es': '',
      'fr': '',
    },
    'vdan6so8': {
      'en': 'Paris, France',
      'es': '',
      'fr': '',
    },
    'w0e0g8lz': {
      'en': 'Earth',
      'es': '',
      'fr': '',
    },
    'uebuzq3i': {
      'en': 'Worldwide Suggestions',
      'es': '',
      'fr': '',
    },
    '08le5nen': {
      'en': 'Virtual Reality Experience',
      'es': '',
      'fr': '',
    },
    'we7ruib4': {
      'en': 'Immerse yourself in new worlds',
      'es': '',
      'fr': '',
    },
    '9bn16u45': {
      'en': 'Tokyo, Japan',
      'es': '',
      'fr': '',
    },
    'q9gt1rb7': {
      'en': 'Earth',
      'es': '',
      'fr': '',
    },
    'fqldc0um': {
      'en': 'Mars Colony Tour',
      'es': '',
      'fr': '',
    },
    'tsehmpde': {
      'en': 'Experience life on the Red Planet',
      'es': '',
      'fr': '',
    },
    'jrxi8jt3': {
      'en': 'Olympus Mons',
      'es': '',
      'fr': '',
    },
    'araz4p8n': {
      'en': 'Mars',
      'es': '',
      'fr': '',
    },
  },
  // usercreatepromotethankspageCopy
  {
    'onq5wzf2': {
      'en': 'Thank You!',
      'es': '',
      'fr': '',
    },
    'dqnho5ky': {
      'en': 'Your payment has been processed successfully.',
      'es': '',
      'fr': '',
    },
    'cbsh1xvh': {
      'en': 'Promotion Details',
      'es': '',
      'fr': '',
    },
    'pekglcdn': {
      'en': 'Your promotion will begin shortly. Here\'s what to expect:',
      'es': '',
      'fr': '',
    },
    'ool7sx44': {
      'en': 'Increased visibility within minutes',
      'es': '',
      'fr': '',
    },
    'oqxztjc1': {
      'en': 'Boost in engagement and reach',
      'es': '',
      'fr': '',
    },
    'xihhvype': {
      'en': 'Real-time performance tracking',
      'es': '',
      'fr': '',
    },
    't3z2ng5y': {
      'en': 'We\'ll notify you once your promotion is live!',
      'es': '',
      'fr': '',
    },
    '31yfi7hq': {
      'en': 'View Dashboard',
      'es': '',
      'fr': '',
    },
    'zkip10yg': {
      'en': 'Need help? ',
      'es': '',
      'fr': '',
    },
    'v8f69nkx': {
      'en': 'Contact Support',
      'es': '',
      'fr': '',
    },
  },
  // usecreateactivitycongratspageCopy
  {
    'cw24bqn7': {
      'en': 'Congratulations!',
      'es': '',
      'fr': '',
    },
    '7j5ehgbt': {
      'en': 'Your activity has been created successfully!',
      'es': '',
      'fr': '',
    },
    'ne23kaqe': {
      'en': 'What\'s Next?',
      'es': '',
      'fr': '',
    },
    'l6828wlr': {
      'en': 'Invite friends to join your activity',
      'es': '',
      'fr': '',
    },
    'wgymj2dm': {
      'en': 'Edit your activity details anytime',
      'es': '',
      'fr': '',
    },
    'gv421cg6': {
      'en': 'Receive updates about participants',
      'es': '',
      'fr': '',
    },
    '61p8kpac': {
      'en': 'Redirecting to home page...',
      'es': '',
      'fr': '',
    },
  },
  // Settingsbusinesspage
  {
    'cj295m03': {
      'en': 'Edit Profile',
      'es': '',
      'fr': '',
    },
    'i8f51a9v': {
      'en': 'Account Settings',
      'es': '',
      'fr': '',
    },
    'i09xbabq': {
      'en': 'Change Password',
      'es': '',
      'fr': '',
    },
    'ranq5ujl': {
      'en': 'Notification Preferences',
      'es': '',
      'fr': '',
    },
    'xrr48004': {
      'en': 'Language',
      'es': '',
      'fr': '',
    },
    'czqvns29': {
      'en': 'Business Settings',
      'es': '',
      'fr': '',
    },
    'voccon9z': {
      'en': 'Business Information',
      'es': '',
      'fr': '',
    },
    'avamy83k': {
      'en': 'Payment Methods',
      'es': '',
      'fr': '',
    },
    'f9dd77bj': {
      'en': 'Manage Team',
      'es': '',
      'fr': '',
    },
    'skstuwg2': {
      'en': 'Privacy & Security',
      'es': '',
      'fr': '',
    },
    't14mol3o': {
      'en': 'Blocked Users',
      'es': '',
      'fr': '',
    },
    'tbgxjjzl': {
      'en': 'Privacy Settings',
      'es': '',
      'fr': '',
    },
    'bgsp9iqa': {
      'en': 'Two-Factor Authentication',
      'es': '',
      'fr': '',
    },
    '9dmlnpws': {
      'en': 'Support',
      'es': '',
      'fr': '',
    },
    '9epiht9c': {
      'en': 'Help Center',
      'es': '',
      'fr': '',
    },
    '3nfiu127': {
      'en': 'Contact Support',
      'es': '',
      'fr': '',
    },
    'buifpgsi': {
      'en': 'Send Feedback',
      'es': '',
      'fr': '',
    },
    's2swr6wy': {
      'en': 'Account Actions',
      'es': '',
      'fr': '',
    },
    'wlbj8v8p': {
      'en': 'Log Out',
      'es': '',
      'fr': '',
    },
    '19glv2cx': {
      'en': 'Delete Account',
      'es': '',
      'fr': '',
    },
    'h92vu2qt': {
      'en': 'App Version 1.0.0',
      'es': '',
      'fr': '',
    },
    'b39strv8': {
      'en': 'Settings',
      'es': '',
      'fr': '',
    },
  },
  // usersettingspage
  {
    'jlkpeehu': {
      'en': 'Settings',
      'es': '',
      'fr': '',
    },
    'rv0o6qhl': {
      'en': 'Edit Profile',
      'es': '',
      'fr': '',
    },
    'bw8jlin5': {
      'en': 'Account',
      'es': '',
      'fr': '',
    },
    'n9y2cuq9': {
      'en': 'Change Password',
      'es': '',
      'fr': '',
    },
    'g4e9izd0': {
      'en': 'Friends',
      'es': '',
      'fr': '',
    },
    '97iea56n': {
      'en': 'Manage Friends',
      'es': '',
      'fr': '',
    },
    'ytway4g9': {
      'en': 'Blocked Users',
      'es': '',
      'fr': '',
    },
    'smb4jjlf': {
      'en': 'Support',
      'es': '',
      'fr': '',
    },
    '5mjmuryg': {
      'en': 'Contact Support',
      'es': '',
      'fr': '',
    },
    'z3t6jb01': {
      'en': 'FAQs',
      'es': '',
      'fr': '',
    },
    '9iqc7lfx': {
      'en': 'Terms of Service',
      'es': '',
      'fr': '',
    },
    'gfo0gpdi': {
      'en': 'Privacy Policy',
      'es': '',
      'fr': '',
    },
    '2o4yg2dd': {
      'en': 'App Settings',
      'es': '',
      'fr': '',
    },
    'znh29pth': {
      'en': 'Language',
      'es': '',
      'fr': '',
    },
    'n4uumwoh': {
      'en': 'Log Out',
      'es': '',
      'fr': '',
    },
    'kdnnutvv': {
      'en': 'Delete Account',
      'es': '',
      'fr': '',
    },
  },
  // userDashboard
  {
    'o2xyxawr': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // businessDashboard
  {
    'duewvx40': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // businessActivityCongrats
  {
    'uv2vz6h8': {
      'en': 'Congratulations!',
      'es': '',
      'fr': '',
    },
    '9h9csgs0': {
      'en': 'Your activity has been created successfully!',
      'es': '',
      'fr': '',
    },
    'ce6rnqk4': {
      'en': 'What\'s Next?',
      'es': '',
      'fr': '',
    },
    'vmj3tg8b': {
      'en': 'Invite friends to join your activity',
      'es': '',
      'fr': '',
    },
    'usf2qtm1': {
      'en': 'Edit your activity details anytime',
      'es': '',
      'fr': '',
    },
    'znweg1ty': {
      'en': 'Receive updates about participants',
      'es': '',
      'fr': '',
    },
    'g96i3tkt': {
      'en': 'Redirecting to home page...',
      'es': '',
      'fr': '',
    },
    'cerj4bsh': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // businessPromoteThankPage
  {
    'ourxx2xp': {
      'en': 'Thank You!',
      'es': '',
      'fr': '',
    },
    'pxe1p0tc': {
      'en': 'Your payment has been processed successfully.',
      'es': '',
      'fr': '',
    },
    'anjf61hh': {
      'en': 'Promotion Details',
      'es': '',
      'fr': '',
    },
    '2sgx220q': {
      'en': 'Your promotion will begin shortly. Here\'s what to expect:',
      'es': '',
      'fr': '',
    },
    'd5sdkjpv': {
      'en': 'Increased visibility within minutes',
      'es': '',
      'fr': '',
    },
    'vgx5tlyl': {
      'en': 'Boost in engagement and reach',
      'es': '',
      'fr': '',
    },
    '72q915dc': {
      'en': 'Real-time performance tracking',
      'es': '',
      'fr': '',
    },
    'qvg6hqi7': {
      'en': 'We\'ll notify you once your promotion is live!',
      'es': '',
      'fr': '',
    },
    'kzm4wnjj': {
      'en': 'View Dashboard',
      'es': '',
      'fr': '',
    },
    'lwmlq2hs': {
      'en': 'Need help? ',
      'es': '',
      'fr': '',
    },
    '5n6dd8fi': {
      'en': 'Contact Support',
      'es': '',
      'fr': '',
    },
    'v0auln8a': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // businessaymentpromotepage
  {
    '62fudswc': {
      'en': 'Payment Amount',
      'es': '',
      'fr': '',
    },
    '0zuc2w29': {
      'en': '\$99.99',
      'es': '',
      'fr': '',
    },
    'n0c4it8w': {
      'en': 'Monthly Subscription',
      'es': '',
      'fr': '',
    },
    'cfqyw3sc': {
      'en': 'Payment Method',
      'es': '',
      'fr': '',
    },
    'h67dq0pb': {
      'en': 'Credit Card',
      'es': '',
      'fr': '',
    },
    'n1xwvhy0': {
      'en': 'Bank Transfer',
      'es': '',
      'fr': '',
    },
    '6hhm77aa': {
      'en': 'PayPal',
      'es': '',
      'fr': '',
    },
    'dsnth40o': {
      'en': 'Card Details',
      'es': '',
      'fr': '',
    },
    'gs27eax1': {
      'en': 'Card Number',
      'es': '',
      'fr': '',
    },
    '4uarf6df': {
      'en': 'Expiry Date',
      'es': '',
      'fr': '',
    },
    'spoi3dpf': {
      'en': 'CVV',
      'es': '',
      'fr': '',
    },
    '5hyw46bn': {
      'en': 'Cardholder Name',
      'es': '',
      'fr': '',
    },
    'cg3gsebc': {
      'en': 'Payment Summary',
      'es': '',
      'fr': '',
    },
    'ig152r8l': {
      'en': 'Subtotal',
      'es': '',
      'fr': '',
    },
    'fgbex9nx': {
      'en': '\$99.99',
      'es': '',
      'fr': '',
    },
    '071xqfd9': {
      'en': 'Tax',
      'es': '',
      'fr': '',
    },
    'hibgrf82': {
      'en': '\$5.00',
      'es': '',
      'fr': '',
    },
    'ifjujna3': {
      'en': 'Total',
      'es': '',
      'fr': '',
    },
    'drgyfnkl': {
      'en': '\$104.99',
      'es': '',
      'fr': '',
    },
    't6dssg7v': {
      'en': 'Complete Payment',
      'es': '',
      'fr': '',
    },
  },
  // WelcomeVideoView
  {
    '7sgjuje4': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // createAccountView
  {
    'ejvbi3kl': {
      'en': 'Create an Account',
      'es': '',
      'fr': '',
    },
    'e1ce2da4': {
      'en': 'Enter details below to sign up',
      'es': '',
      'fr': '',
    },
    '8fjrf7sa': {
      'en': 'Email',
      'es': '',
      'fr': '',
    },
    '78k236t0': {
      'en': 'Password',
      'es': '',
      'fr': '',
    },
    'v9p3s3rz': {
      'en': 'Confirm Password',
      'es': '',
      'fr': '',
    },
    '5rtspgwj': {
      'en': 'Sign Up',
      'es': '',
      'fr': '',
    },
    'fmzk9hr0': {
      'en': 'Or sign up with',
      'es': '',
      'fr': '',
    },
    'dm312a9z': {
      'en': 'Continue with Google',
      'es': '',
      'fr': '',
    },
    'rnjaml8l': {
      'en': 'Continue with Apple',
      'es': '',
      'fr': '',
    },
    'yzvm4dqr': {
      'en': 'Already have an account? ',
      'es': '',
      'fr': '',
    },
    'qlotvi9c': {
      'en': 'Log In',
      'es': '',
      'fr': '',
    },
    '5ya02ic4': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // loginView
  {
    'cy3rg0ep': {
      'en': 'Welcome Back',
      'es': '',
      'fr': '',
    },
    'yttz1as8': {
      'en': 'Fill out the information below in order to access your account.',
      'es': '',
      'fr': '',
    },
    'kf8xqy2k': {
      'en': 'Email',
      'es': '',
      'fr': '',
    },
    'o9i66ceu': {
      'en': 'Password',
      'es': '',
      'fr': '',
    },
    '4ykwuhy6': {
      'en': 'Sign In',
      'es': '',
      'fr': '',
    },
    'mky4z7gx': {
      'en': 'Or sign in with',
      'es': '',
      'fr': '',
    },
    'iyetpk8e': {
      'en': 'Continue with Google',
      'es': '',
      'fr': '',
    },
    'lb8txsiv': {
      'en': 'Continue with Apple',
      'es': '',
      'fr': '',
    },
    'gyrsz13v': {
      'en': 'Don\'t have an account?  ',
      'es': '',
      'fr': '',
    },
    'vfjtjuxc': {
      'en': 'Sign Up here',
      'es': '',
      'fr': '',
    },
    '6ba7o5wq': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // signupSelectionView
  {
    'yz4rxkbl': {
      'en': 'Create an Account',
      'es': '',
      'fr': '',
    },
    't91t3snc': {
      'en': 'Choose how you\'d like to sign up',
      'es': '',
      'fr': '',
    },
    'w6qmxahn': {
      'en': 'Sign Up As',
      'es': '',
      'fr': '',
    },
    'eqoxigra': {
      'en': 'Individual Guest',
      'es': '',
      'fr': '',
    },
    'qs0iprin': {
      'en': 'Business Owner',
      'es': '',
      'fr': '',
    },
    'e85497jj': {
      'en': 'Already have an account? ',
      'es': '',
      'fr': '',
    },
    '4h1vounk': {
      'en': 'Log In',
      'es': '',
      'fr': '',
    },
    '531nqddq': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // AuthCheckView
  {
    '2ulinylv': {
      'en': 'Loading ....',
      'es': '',
      'fr': '',
    },
    'uakapsl3': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // ChatDetailView
  {
    'zf3tmpi3': {
      'en': 'Group Chat',
      'es': '',
      'fr': '',
    },
    'typo1mj0': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // chat_2_main
  {
    '2xxuxxu4': {
      'en': 'Below are your chats and group chats',
      'es': '',
      'fr': '',
    },
    'z4r2vyer': {
      'en': 'Daniel',
      'es': '',
      'fr': '',
    },
    'znuc17cx': {
      'en': 'My Chats',
      'es': '',
      'fr': '',
    },
    'ihctaxfc': {
      'en': '__',
      'es': '',
      'fr': '',
    },
  },
  // ChatInviteUsers
  {
    '5bc7s2mf': {
      'en': 'Invite Friends',
      'es': '',
      'fr': '',
    },
    '4l8ygd8w': {
      'en': 'Select users from below to start a chat.',
      'es': '',
      'fr': '',
    },
    'kbvrs9d3': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // image_Details
  {
    'tv16y7ky': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // ChangePassword
  {
    'jl6ycqn9': {
      'en': 'Update Password',
      'es': '',
      'fr': '',
    },
    'xcthxota': {
      'en': 'Ready to Change Password? Just Fill Out the Fields!',
      'es': '',
      'fr': '',
    },
    'hqruba2c': {
      'en': 'Enter new password',
      'es': '',
      'fr': '',
    },
    'w898cwwe': {
      'en': 'Confirm new password',
      'es': '',
      'fr': '',
    },
    'h2veenet': {
      'en': 'Update',
      'es': '',
      'fr': '',
    },
    'u5c8223m': {
      'en': 'new password is required',
      'es': '',
      'fr': '',
    },
    'm18epsgl': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'oz6h1m5u': {
      'en': 'confirm password is required',
      'es': '',
      'fr': '',
    },
    'cag0eiz8': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    's7tcnx23': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // FriendsView
  {
    'clrnldhw': {
      'en': 'Friends',
      'es': '',
      'fr': '',
    },
    'x0ozsw2v': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // BlockUsersView
  {
    'f7akob5a': {
      'en': 'Blocked Users',
      'es': '',
      'fr': '',
    },
    'yfu1k9em': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // ContactSupport
  {
    'kt5w9caf': {
      'en': 'Contact Support',
      'es': '',
      'fr': '',
    },
    '8r45tl1z': {
      'en':
          'Need assistance? Our support team is here to help with any questions or issues you may have. Reach out to us using the options below.',
      'es': '',
      'fr': '',
    },
    'etb1kmmu': {
      'en': 'Email Support:',
      'es': '',
      'fr': '',
    },
    'ct2pxnn2': {
      'en': ' quitappinfo@gmail.com ',
      'es': '',
      'fr': '',
    },
    'y0l2q2n6': {
      'en': 'Call Support:',
      'es': '',
      'fr': '',
    },
    'qgs7g9wd': {
      'en': '+1 (514) 619-2522',
      'es': '',
      'fr': '',
    },
    't9dy0fpu': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // EditUserProfile
  {
    '36t572jt': {
      'en': 'Edit Your Profile',
      'es': '',
      'fr': '',
    },
    'ra1kuext': {
      'en':
          'Kindly provide the required details to update your profile information.',
      'es': '',
      'fr': '',
    },
    '5uack36k': {
      'en': 'Personal Information',
      'es': '',
      'fr': '',
    },
    '76apaou7': {
      'en': 'Username',
      'es': '',
      'fr': '',
    },
    'wwjd5kxj': {
      'en': 'First Name',
      'es': '',
      'fr': '',
    },
    'uqyrwkob': {
      'en': 'Last Name',
      'es': '',
      'fr': '',
    },
    'czgpw09d': {
      'en': 'Select gender',
      'es': '',
      'fr': '',
    },
    'f5ezie00': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    's66i2esx': {
      'en': 'Male',
      'es': '',
      'fr': '',
    },
    'seqpvu1m': {
      'en': 'Female',
      'es': '',
      'fr': '',
    },
    '2cnutboa': {
      'en': 'Other',
      'es': '',
      'fr': '',
    },
    '1qb2ejww': {
      'en': 'Prefer not to say',
      'es': '',
      'fr': '',
    },
    'tgrppinb': {
      'en': 'Upload Profile Picture',
      'es': '',
      'fr': '',
    },
    'mgsf5x6h': {
      'en': 'Nationality',
      'es': '',
      'fr': '',
    },
    'fpj3bvcz': {
      'en': 'Enter your birthday',
      'es': '',
      'fr': '',
    },
    'ryzmft7s': {
      'en': 'Day',
      'es': '',
      'fr': '',
    },
    'f0wquphi': {
      'en': 'Month',
      'es': '',
      'fr': '',
    },
    'hwasdcd9': {
      'en': 'Year',
      'es': '',
      'fr': '',
    },
    'dg4fv9ne': {
      'en': 'Height',
      'es': '',
      'fr': '',
    },
    'cze7jard': {
      'en': 'Weight',
      'es': '',
      'fr': '',
    },
    '7a9ptnq6': {
      'en': 'Ethnicity',
      'es': '',
      'fr': '',
    },
    'k2bl9ock': {
      'en': 'Select eye color',
      'es': '',
      'fr': '',
    },
    '0gu1n89h': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'gknguig9': {
      'en': 'Brown',
      'es': '',
      'fr': '',
    },
    'pxd9pvb0': {
      'en': 'Blue',
      'es': '',
      'fr': '',
    },
    '6rca0704': {
      'en': 'Green',
      'es': '',
      'fr': '',
    },
    'z9zdnay8': {
      'en': 'Hazel',
      'es': '',
      'fr': '',
    },
    's8oac6yp': {
      'en': 'Gray',
      'es': '',
      'fr': '',
    },
    'z14bkdw9': {
      'en': 'Other',
      'es': '',
      'fr': '',
    },
    'afvnvqfl': {
      'en': 'Select hair color',
      'es': '',
      'fr': '',
    },
    'uuoxc9bc': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'hksgfeqe': {
      'en': 'Black',
      'es': '',
      'fr': '',
    },
    'pykv2kuz': {
      'en': 'Brown',
      'es': '',
      'fr': '',
    },
    'k51yqgeg': {
      'en': 'Blonde',
      'es': '',
      'fr': '',
    },
    'rukgp54r': {
      'en': 'Red',
      'es': '',
      'fr': '',
    },
    'k66hwokv': {
      'en': 'Gray',
      'es': '',
      'fr': '',
    },
    'm0v88yg0': {
      'en': 'Other',
      'es': '',
      'fr': '',
    },
    '9jv4x3b2': {
      'en': 'Select hair style',
      'es': '',
      'fr': '',
    },
    'y21hsacv': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'bf9tun6i': {
      'en': 'Bald',
      'es': '',
      'fr': '',
    },
    'llbx8hxf': {
      'en': 'Straight',
      'es': '',
      'fr': '',
    },
    'bv8g3wof': {
      'en': 'Curly',
      'es': '',
      'fr': '',
    },
    'wdh7oybr': {
      'en': 'Wavy',
      'es': '',
      'fr': '',
    },
    'dydbtk04': {
      'en': 'Other',
      'es': '',
      'fr': '',
    },
    '32avdcb7': {
      'en': 'Select planet',
      'es': '',
      'fr': '',
    },
    'ec7ry6py': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'sbjbwfau': {
      'en': 'Mercury',
      'es': '',
      'fr': '',
    },
    'hmhqat7z': {
      'en': 'Venus',
      'es': '',
      'fr': '',
    },
    'rceflkl0': {
      'en': 'Earth',
      'es': '',
      'fr': '',
    },
    'nyc160tb': {
      'en': 'Mars',
      'es': '',
      'fr': '',
    },
    'ui8vg47g': {
      'en': 'Jupiter',
      'es': '',
      'fr': '',
    },
    '9ezxt03n': {
      'en': 'Saturn',
      'es': '',
      'fr': '',
    },
    'pev3zddt': {
      'en': 'Uranus',
      'es': '',
      'fr': '',
    },
    'cnpcrdoh': {
      'en': 'Neptune',
      'es': '',
      'fr': '',
    },
    'f9phb2an': {
      'en': 'Moon',
      'es': '',
      'fr': '',
    },
    'xqg0mmij': {
      'en': 'Select Country',
      'es': '',
      'fr': '',
    },
    'k075jqes': {
      'en': 'Address (Optional)',
      'es': '',
      'fr': '',
    },
    'vvnpk7et': {
      'en': 'Select language',
      'es': '',
      'fr': '',
    },
    'nhbnyyhf': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'ukjd7p2v': {
      'en': 'English',
      'es': '',
      'fr': '',
    },
    'ruhm2o4h': {
      'en': 'Spanish',
      'es': '',
      'fr': '',
    },
    'higtcyrp': {
      'en': 'French',
      'es': '',
      'fr': '',
    },
    '9l14untp': {
      'en': 'German',
      'es': '',
      'fr': '',
    },
    'nb1uu2wd': {
      'en': 'Chinese',
      'es': '',
      'fr': '',
    },
    'xm01kwk7': {
      'en': 'Arabic',
      'es': '',
      'fr': '',
    },
    'kh0xeosj': {
      'en': 'Other',
      'es': '',
      'fr': '',
    },
    'byjrqd16': {
      'en': 'Select religion',
      'es': '',
      'fr': '',
    },
    'u1ra0u6l': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'pcq7hch0': {
      'en': 'N/A',
      'es': '',
      'fr': '',
    },
    'kwu89kmz': {
      'en': 'Atheist',
      'es': '',
      'fr': '',
    },
    'prnowxt9': {
      'en': 'Buddhist',
      'es': '',
      'fr': '',
    },
    'shucgokc': {
      'en': 'Christian',
      'es': '',
      'fr': '',
    },
    'e1ctcrei': {
      'en': 'Hindu',
      'es': '',
      'fr': '',
    },
    'donqc9z0': {
      'en': 'Jewish',
      'es': '',
      'fr': '',
    },
    '9j6zg0on': {
      'en': 'Muslim',
      'es': '',
      'fr': '',
    },
    'dpkqiboj': {
      'en': 'Other',
      'es': '',
      'fr': '',
    },
    'acehmbv8': {
      'en': 'Social Media Link 1 (Optional)',
      'es': '',
      'fr': '',
    },
    'v62cffh3': {
      'en': 'Social Media Link 2 (Optional)',
      'es': '',
      'fr': '',
    },
    'bnnwgxc7': {
      'en': 'Description (Optional)',
      'es': '',
      'fr': '',
    },
    'dk3elusg': {
      'en': 'Private Profile',
      'es': '',
      'fr': '',
    },
    '4bom8772': {
      'en': 'Hide All Friends',
      'es': '',
      'fr': '',
    },
    'dhr6owbh': {
      'en': 'Select sign',
      'es': '',
      'fr': '',
    },
    '01q8swug': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'vtr13us0': {
      'en': 'Aries',
      'es': '',
      'fr': '',
    },
    'jh98kl55': {
      'en': 'Taurus',
      'es': '',
      'fr': '',
    },
    '8ima60st': {
      'en': 'Gemini',
      'es': '',
      'fr': '',
    },
    'v6fbn111': {
      'en': 'Cancer',
      'es': '',
      'fr': '',
    },
    'zwb5bq2j': {
      'en': 'Leo',
      'es': '',
      'fr': '',
    },
    '5cde7h9p': {
      'en': 'Virgo',
      'es': '',
      'fr': '',
    },
    '617cet5l': {
      'en': 'Libra',
      'es': '',
      'fr': '',
    },
    '70xgtklm': {
      'en': 'Scorpio',
      'es': '',
      'fr': '',
    },
    'e7wkrqpq': {
      'en': 'Sagittarius',
      'es': '',
      'fr': '',
    },
    'iqa839ij': {
      'en': 'Capricorn',
      'es': '',
      'fr': '',
    },
    'tnf7rm8n': {
      'en': 'Aquarius',
      'es': '',
      'fr': '',
    },
    'enscw5j9': {
      'en': 'Pisces',
      'es': '',
      'fr': '',
    },
    'h9fwo7jf': {
      'en': 'Select relation',
      'es': '',
      'fr': '',
    },
    'ynobl86l': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'u1tyuh7e': {
      'en': 'Single',
      'es': '',
      'fr': '',
    },
    's4xsbf4e': {
      'en': 'In a relationship',
      'es': '',
      'fr': '',
    },
    'keohngun': {
      'en': 'Married',
      'es': '',
      'fr': '',
    },
    'b36z4cgq': {
      'en': 'Divorced',
      'es': '',
      'fr': '',
    },
    'vot6rllc': {
      'en': 'Widowed',
      'es': '',
      'fr': '',
    },
    'wxj3wj2d': {
      'en': 'It\'s Complicated',
      'es': '',
      'fr': '',
    },
    '5gxv7q3y': {
      'en': 'Select status',
      'es': '',
      'fr': '',
    },
    'kkirwuxy': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'ocuuqmv4': {
      'en': 'Has Children ',
      'es': '',
      'fr': '',
    },
    'i9xf1r38': {
      'en': 'No Children',
      'es': '',
      'fr': '',
    },
    'by0sftin': {
      'en': 'Wants Children',
      'es': '',
      'fr': '',
    },
    'scnae992': {
      'en': 'Prefer not to say',
      'es': '',
      'fr': '',
    },
    '112magjh': {
      'en': 'Driver\'s License',
      'es': '',
      'fr': '',
    },
    '4q83jb99': {
      'en': 'Select occupation',
      'es': '',
      'fr': '',
    },
    'e24dgx7y': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    '00pe7y1z': {
      'en': 'Worker',
      'es': '',
      'fr': '',
    },
    'tj788xlq': {
      'en': 'Student',
      'es': '',
      'fr': '',
    },
    'icr58svf': {
      'en': 'Retired',
      'es': '',
      'fr': '',
    },
    'f45b2ypl': {
      'en': 'Unemployed',
      'es': '',
      'fr': '',
    },
    'obsg18q0': {
      'en': 'Other',
      'es': '',
      'fr': '',
    },
    'df6ym9d6': {
      'en': 'Select tattoo',
      'es': '',
      'fr': '',
    },
    'pea3y4xc': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    '805tyct0': {
      'en': 'Tattooed',
      'es': '',
      'fr': '',
    },
    's0mjux9z': {
      'en': 'Not Tattooed',
      'es': '',
      'fr': '',
    },
    '27bvba41': {
      'en': 'Prefer not to say',
      'es': '',
      'fr': '',
    },
    'x0fkbzte': {
      'en': 'Username is required',
      'es': '',
      'fr': '',
    },
    'fztgi6k7': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    '1f2ukhfz': {
      'en': 'First name is required',
      'es': '',
      'fr': '',
    },
    '1bzg11hl': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    '8mg8f8oo': {
      'en': 'Last name is required',
      'es': '',
      'fr': '',
    },
    'rpsoftvb': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'rzh6fzmi': {
      'en': 'Nationality is required',
      'es': '',
      'fr': '',
    },
    'jzp2qpc2': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'fr3vpizi': {
      'en': 'required',
      'es': '',
      'fr': '',
    },
    'hja2tmix': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    's62zg3y0': {
      'en': 'required',
      'es': '',
      'fr': '',
    },
    '4ur7aat2': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'qxji54ti': {
      'en': 'required',
      'es': '',
      'fr': '',
    },
    'o0ml6wtz': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'v7s7xqxd': {
      'en': 'Height is required',
      'es': '',
      'fr': '',
    },
    'rj6xxlq7': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'pfuy3xu3': {
      'en': 'Weight is required',
      'es': '',
      'fr': '',
    },
    'f73gotw8': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'dhs3rnho': {
      'en': 'Ethnicity is required',
      'es': '',
      'fr': '',
    },
    '953rmgfw': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    '3ywbu3fd': {
      'en': 'Address is required',
      'es': '',
      'fr': '',
    },
    '9cc9w4o9': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'qmxrpqjn': {
      'en': 'Field is required',
      'es': '',
      'fr': '',
    },
    'lipo76cf': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'qpo4qzc6': {
      'en': 'Field is required',
      'es': '',
      'fr': '',
    },
    '9df2vc0l': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'zw4r49jt': {
      'en': 'Field is required',
      'es': '',
      'fr': '',
    },
    'z825viic': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'rb21lcdp': {
      'en': 'Update Profile',
      'es': '',
      'fr': '',
    },
    'kiwvrh7j': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // termsOfUse
  {
    'ne5q2v0f': {
      'en': 'Terms Of Use',
      'es': '',
      'fr': '',
    },
    '86ugvo4p': {
      'en':
          'By accepting our terms, you agree to maintain mutual respect with all other users on the platform.',
      'es': '',
      'fr': '',
    },
    'c2pqcq11': {
      'en': '1',
      'es': '',
      'fr': '',
    },
    'zw32vark': {
      'en':
          'You must respect every individual, regardless of their differences.',
      'es': '',
      'fr': '',
    },
    '4uem16vv': {
      'en': '2',
      'es': '',
      'fr': '',
    },
    '039yx1un': {
      'en':
          'Any disrespectful behavior toward another user, as well as the \n\ndissemination of pornographic, violent, or illegal content, will result in permanent exclusion from the\n\nplatform.',
      'es': '',
      'fr': '',
    },
    '7p0cnm90': {
      'en': '3',
      'es': '',
      'fr': '',
    },
    't9vkx5lv': {
      'en': 'Peace and respect are the pillars of our online community.',
      'es': '',
      'fr': '',
    },
    'cjl7f41l': {
      'en': '4',
      'es': '',
      'fr': '',
    },
    'oq28y9bg': {
      'en':
          'We advise caution when interacting with users who have not provided a complete profile picture, \n\nincluding their face and full body, as required.',
      'es': '',
      'fr': '',
    },
    '09heixgl': {
      'en': '5',
      'es': '',
      'fr': '',
    },
    '83m124we': {
      'en':
          'We disclaim any responsibility for events or meetings organized between users. \n\nOur role is limited to facilitating connections between users through our app, proposing activities created by our clients, and providing up-to-date information on ongoing events organized by our members.',
      'es': '',
      'fr': '',
    },
    '0p6b1x5v': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // createprofiluserCopy
  {
    'fnwhb6sx': {
      'en': 'Create Your Profile',
      'es': '',
      'fr': '',
    },
    'rjvz91am': {
      'en':
          'Please fill in the following information to complete your registration.',
      'es': '',
      'fr': '',
    },
    '025ms2sh': {
      'en': 'Personal Information',
      'es': '',
      'fr': '',
    },
    '007j7xgd': {
      'en': 'Username',
      'es': '',
      'fr': '',
    },
    '5uce28x7': {
      'en': 'First Name',
      'es': '',
      'fr': '',
    },
    'ohc672jo': {
      'en': 'Last Name',
      'es': '',
      'fr': '',
    },
    'yjtoehgn': {
      'en': 'Select gender',
      'es': '',
      'fr': '',
    },
    'eq3xdth0': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    '4yycu37x': {
      'en': 'King',
      'es': '',
      'fr': '',
    },
    'u9el02qz': {
      'en': 'Queen',
      'es': '',
      'fr': '',
    },
    'w6xt4glx': {
      'en': 'Other',
      'es': '',
      'fr': '',
    },
    'bbsbxk56': {
      'en': 'Prefer not to say',
      'es': '',
      'fr': '',
    },
    'vnhey5n2': {
      'en': 'Upload Profile Picture',
      'es': '',
      'fr': '',
    },
    'wipoew4k': {
      'en': 'Upload 2 mandatory photos (face profile and full-body)',
      'es': '',
      'fr': '',
    },
    'ftsdt0jt': {
      'en': 'Select nationality',
      'es': '',
      'fr': '',
    },
    'g6jhder8': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    '0s7hge98': {
      'en': 'King',
      'es': '',
      'fr': '',
    },
    '9l578ygj': {
      'en': 'Queen',
      'es': '',
      'fr': '',
    },
    '5m37832r': {
      'en': 'Other',
      'es': '',
      'fr': '',
    },
    'dzpy9s5l': {
      'en': 'Prefer not to say',
      'es': '',
      'fr': '',
    },
    'vu8bnzi4': {
      'en': 'Mix nationality',
      'es': '',
      'fr': '',
    },
    '7bnamjao': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'y2oy4tpx': {
      'en': 'Yes',
      'es': '',
      'fr': '',
    },
    'l274l8po': {
      'en': 'No',
      'es': '',
      'fr': '',
    },
    'j1216xf1': {
      'en': 'Enter your birthday',
      'es': '',
      'fr': '',
    },
    'u44gsyus': {
      'en': 'Day',
      'es': '',
      'fr': '',
    },
    'wzhc4nkx': {
      'en': 'Month',
      'es': '',
      'fr': '',
    },
    'dt23wfwl': {
      'en': 'Year',
      'es': '',
      'fr': '',
    },
    'xnxj7zoz': {
      'en': 'Select height',
      'es': '',
      'fr': '',
    },
    'sjnijqru': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'yeitm6pu': {
      'en': 'King',
      'es': '',
      'fr': '',
    },
    'zbevtpl1': {
      'en': 'Queen',
      'es': '',
      'fr': '',
    },
    '1lptklwm': {
      'en': 'Other',
      'es': '',
      'fr': '',
    },
    'y6b9lzb0': {
      'en': 'Prefer not to say',
      'es': '',
      'fr': '',
    },
    'br9234ab': {
      'en': 'Select weight',
      'es': '',
      'fr': '',
    },
    'pz7ccsit': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    '5yiqjw7p': {
      'en': 'King',
      'es': '',
      'fr': '',
    },
    '4ap6lgkq': {
      'en': 'Queen',
      'es': '',
      'fr': '',
    },
    'sg1fpprs': {
      'en': 'Other',
      'es': '',
      'fr': '',
    },
    'gsu2rq3g': {
      'en': 'Prefer not to say',
      'es': '',
      'fr': '',
    },
    '0xeev0ll': {
      'en': 'Ethnicity',
      'es': '',
      'fr': '',
    },
    'ks33i5ar': {
      'en': 'Select eye color',
      'es': '',
      'fr': '',
    },
    'mhqi2vq3': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'fu60snkf': {
      'en': 'Brown',
      'es': '',
      'fr': '',
    },
    'ogb8z3f2': {
      'en': 'Blue',
      'es': '',
      'fr': '',
    },
    'pbii8u7j': {
      'en': 'Green',
      'es': '',
      'fr': '',
    },
    '3ai8fb25': {
      'en': 'Hazel',
      'es': '',
      'fr': '',
    },
    'e4tlhy2y': {
      'en': 'Gray',
      'es': '',
      'fr': '',
    },
    'zvcxylav': {
      'en': 'Other',
      'es': '',
      'fr': '',
    },
    '4x42sx77': {
      'en': 'Select hair color',
      'es': '',
      'fr': '',
    },
    '5z2xrf0f': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'm29983bh': {
      'en': 'Black',
      'es': '',
      'fr': '',
    },
    'cixgrhx4': {
      'en': 'Brown',
      'es': '',
      'fr': '',
    },
    'gityfssc': {
      'en': 'Blonde',
      'es': '',
      'fr': '',
    },
    '88ps85eg': {
      'en': 'Red',
      'es': '',
      'fr': '',
    },
    'z0lwtlfd': {
      'en': 'Gray',
      'es': '',
      'fr': '',
    },
    't11uad2h': {
      'en': 'Other',
      'es': '',
      'fr': '',
    },
    'dsc9bpyy': {
      'en': 'Select hair style',
      'es': '',
      'fr': '',
    },
    'hpl5wl21': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    '52l4aefe': {
      'en': 'Shaved',
      'es': '',
      'fr': '',
    },
    'cqgh4h5s': {
      'en': 'Straight',
      'es': '',
      'fr': '',
    },
    'mv2joij6': {
      'en': 'Curly',
      'es': '',
      'fr': '',
    },
    'nqgk9kum': {
      'en': 'Wavy',
      'es': '',
      'fr': '',
    },
    'af9zsc7e': {
      'en': 'Other',
      'es': '',
      'fr': '',
    },
    'o95qbidu': {
      'en': 'Select planet',
      'es': '',
      'fr': '',
    },
    'ybvutnf8': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'zepymcs0': {
      'en': 'Mercury',
      'es': '',
      'fr': '',
    },
    'nroj01cp': {
      'en': 'Venus',
      'es': '',
      'fr': '',
    },
    'agswijxm': {
      'en': 'Earth',
      'es': '',
      'fr': '',
    },
    'pmpichfe': {
      'en': 'Mars',
      'es': '',
      'fr': '',
    },
    'q9bpqomw': {
      'en': 'Jupiter',
      'es': '',
      'fr': '',
    },
    'zs8sfs01': {
      'en': 'Saturn',
      'es': '',
      'fr': '',
    },
    'u0pjs5hg': {
      'en': 'Uranus',
      'es': '',
      'fr': '',
    },
    '8deuwheu': {
      'en': 'Neptune',
      'es': '',
      'fr': '',
    },
    '3vcjfbz7': {
      'en': 'Moon',
      'es': '',
      'fr': '',
    },
    'ypc7okl1': {
      'en': 'Select Country',
      'es': '',
      'fr': '',
    },
    'h0uz30h8': {
      'en': 'Address (Optional)',
      'es': '',
      'fr': '',
    },
    'tfyi15rg': {
      'en': 'Select language',
      'es': '',
      'fr': '',
    },
    '2dav89mt': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'ebs8hsew': {
      'en': 'English',
      'es': '',
      'fr': '',
    },
    'jxnb9855': {
      'en': 'Spanish',
      'es': '',
      'fr': '',
    },
    'os4ye4pn': {
      'en': 'French',
      'es': '',
      'fr': '',
    },
    'b6npc4ij': {
      'en': 'German',
      'es': '',
      'fr': '',
    },
    'o8ci0uq4': {
      'en': 'Chinese',
      'es': '',
      'fr': '',
    },
    'do2ulkqg': {
      'en': 'Arabic',
      'es': '',
      'fr': '',
    },
    'red2ux49': {
      'en': 'Other',
      'es': '',
      'fr': '',
    },
    'hewrfkch': {
      'en': 'Select religion',
      'es': '',
      'fr': '',
    },
    '7q3kilur': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'v8fcanto': {
      'en': 'N/A',
      'es': '',
      'fr': '',
    },
    'igcpqrf7': {
      'en': 'Atheist',
      'es': '',
      'fr': '',
    },
    '2xig7ma3': {
      'en': 'Buddhist',
      'es': '',
      'fr': '',
    },
    'db0bt9dj': {
      'en': 'Christian',
      'es': '',
      'fr': '',
    },
    '1dx6vpop': {
      'en': 'Hindu',
      'es': '',
      'fr': '',
    },
    'm47rfrh8': {
      'en': 'Jewish',
      'es': '',
      'fr': '',
    },
    'sptbi9qd': {
      'en': 'Muslim',
      'es': '',
      'fr': '',
    },
    '6hwnylz6': {
      'en': 'Other',
      'es': '',
      'fr': '',
    },
    '5o52uooz': {
      'en': 'Social Media Link 1 (Optional)',
      'es': '',
      'fr': '',
    },
    '1oy958yb': {
      'en': 'Social Media Link 2 (Optional)',
      'es': '',
      'fr': '',
    },
    'z9vvj4gc': {
      'en': 'Description (Optional)',
      'es': '',
      'fr': '',
    },
    'on6v800n': {
      'en': 'Private Profile',
      'es': '',
      'fr': '',
    },
    'rwccvcjo': {
      'en': 'Hide All Friends',
      'es': '',
      'fr': '',
    },
    'vjl6i9n3': {
      'en': 'Select sign',
      'es': '',
      'fr': '',
    },
    '2zdldsif': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'q55jarzv': {
      'en': 'Aries',
      'es': '',
      'fr': '',
    },
    '8c83js0u': {
      'en': 'Taurus',
      'es': '',
      'fr': '',
    },
    '4ijgve9z': {
      'en': 'Gemini',
      'es': '',
      'fr': '',
    },
    '4qkp5cz2': {
      'en': 'Cancer',
      'es': '',
      'fr': '',
    },
    '3hzr39dk': {
      'en': 'Leo',
      'es': '',
      'fr': '',
    },
    'pz2k83qa': {
      'en': 'Virgo',
      'es': '',
      'fr': '',
    },
    'qtkb0k5u': {
      'en': 'Libra',
      'es': '',
      'fr': '',
    },
    '6rmu3a38': {
      'en': 'Scorpio',
      'es': '',
      'fr': '',
    },
    'xd9xfqaa': {
      'en': 'Sagittarius',
      'es': '',
      'fr': '',
    },
    'dswryzf9': {
      'en': 'Capricorn',
      'es': '',
      'fr': '',
    },
    'xjzfmybs': {
      'en': 'Aquarius',
      'es': '',
      'fr': '',
    },
    '10oh6p2z': {
      'en': 'Pisces',
      'es': '',
      'fr': '',
    },
    '0xan7byx': {
      'en': 'Select relation',
      'es': '',
      'fr': '',
    },
    'g58rs5g7': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'y9oifc65': {
      'en': 'Single',
      'es': '',
      'fr': '',
    },
    '5h1tepeb': {
      'en': 'In a relationship',
      'es': '',
      'fr': '',
    },
    'jdsmcww9': {
      'en': 'Married',
      'es': '',
      'fr': '',
    },
    'b2bwfhw3': {
      'en': 'Divorced',
      'es': '',
      'fr': '',
    },
    'czrif9a0': {
      'en': 'Widowed',
      'es': '',
      'fr': '',
    },
    'te2oxv6p': {
      'en': 'It\'s Complicated',
      'es': '',
      'fr': '',
    },
    '9uxbmkhi': {
      'en': 'Select status',
      'es': '',
      'fr': '',
    },
    'dxxbj1v1': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    '8l3gfwre': {
      'en': 'Has Children ',
      'es': '',
      'fr': '',
    },
    'nwexl2ln': {
      'en': 'No Children',
      'es': '',
      'fr': '',
    },
    'tuzyr5hq': {
      'en': 'Wants Children',
      'es': '',
      'fr': '',
    },
    'be4qsph2': {
      'en': 'Prefer not to say',
      'es': '',
      'fr': '',
    },
    'on3e484a': {
      'en': 'Driver\'s License',
      'es': '',
      'fr': '',
    },
    'n2gday3v': {
      'en': 'Select occupation',
      'es': '',
      'fr': '',
    },
    'tp8k79ys': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'zrw905aj': {
      'en': 'Worker',
      'es': '',
      'fr': '',
    },
    'yeinarzf': {
      'en': 'Student',
      'es': '',
      'fr': '',
    },
    'ohtuhci6': {
      'en': 'Retired',
      'es': '',
      'fr': '',
    },
    'ab5h6hfn': {
      'en': 'Unemployed',
      'es': '',
      'fr': '',
    },
    'jb34jrpm': {
      'en': 'Other',
      'es': '',
      'fr': '',
    },
    'lgd6f4un': {
      'en': 'Select tattoo',
      'es': '',
      'fr': '',
    },
    '0ghhi6zy': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'rok6kg37': {
      'en': 'Yes',
      'es': '',
      'fr': '',
    },
    '8viuheuu': {
      'en': 'No',
      'es': '',
      'fr': '',
    },
    'sn1zz5u7': {
      'en': 'Username is required',
      'es': '',
      'fr': '',
    },
    'irpg46fa': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'wiy88vsf': {
      'en': 'First name is required',
      'es': '',
      'fr': '',
    },
    'hsiha4qs': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'twmenafy': {
      'en': 'Last name is required',
      'es': '',
      'fr': '',
    },
    'erwzwy10': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'dg859dt1': {
      'en': 'Nationality is required',
      'es': '',
      'fr': '',
    },
    'rvsgtl8m': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'ajvgjd6m': {
      'en': 'required',
      'es': '',
      'fr': '',
    },
    'rf2526dl': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'p8it78w2': {
      'en': 'required',
      'es': '',
      'fr': '',
    },
    'sbvk6453': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'ktj78ynb': {
      'en': 'required',
      'es': '',
      'fr': '',
    },
    'b14uxrgd': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'c41bbcfo': {
      'en': 'Height is required',
      'es': '',
      'fr': '',
    },
    't6xjcysy': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'hxx2x6iu': {
      'en': 'Weight is required',
      'es': '',
      'fr': '',
    },
    '2f6mflfy': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'uoh5yl4c': {
      'en': 'Ethnicity is required',
      'es': '',
      'fr': '',
    },
    '0es1wz85': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'qzfvtrol': {
      'en': 'Address is required',
      'es': '',
      'fr': '',
    },
    'xhllex9z': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'u74jxci9': {
      'en': 'Field is required',
      'es': '',
      'fr': '',
    },
    'kg8jflwt': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    '413yeo22': {
      'en': 'Field is required',
      'es': '',
      'fr': '',
    },
    'k81lt7cs': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    '1om6iwu1': {
      'en': 'Field is required',
      'es': '',
      'fr': '',
    },
    'yk5o9c65': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    '7z0wfsbj': {
      'en': 'Create Profile',
      'es': '',
      'fr': '',
    },
  },
  // editProfile_auth_2
  {
    'uueid6oj': {
      'en': 'Adjust the content below to update your profile.',
      'es': '',
      'fr': '',
    },
    'pql6sxm8': {
      'en': 'Change Photo',
      'es': '',
      'fr': '',
    },
    '27j0wtm4': {
      'en': 'Full Name',
      'es': '',
      'fr': '',
    },
    'nqnholxq': {
      'en': 'Your full name...',
      'es': '',
      'fr': '',
    },
    'pg6otdpj': {
      'en': 'Your Role',
      'es': '',
      'fr': '',
    },
    't1m05rg4': {
      'en': 'Search for an item...',
      'es': '',
      'fr': '',
    },
    'ftn0h6u1': {
      'en': 'Owner/Founder',
      'es': '',
      'fr': '',
    },
    'gtaia4if': {
      'en': 'Director',
      'es': '',
      'fr': '',
    },
    '9qii5cpa': {
      'en': 'Manager',
      'es': '',
      'fr': '',
    },
    'wi0iq37f': {
      'en': 'Mid-Manager',
      'es': '',
      'fr': '',
    },
    'g5o7n27m': {
      'en': 'Employee',
      'es': '',
      'fr': '',
    },
    'v559lsr6': {
      'en': 'Short Description',
      'es': '',
      'fr': '',
    },
    'ruu2l0v3': {
      'en': 'A little about you...',
      'es': '',
      'fr': '',
    },
  },
  // userHomeView
  {
    '7p24s56z': {
      'en': 'Followers',
      'es': '',
      'fr': '',
    },
    '0vr25e9b': {
      'en': 'Following',
      'es': '',
      'fr': '',
    },
    'btx0mo18': {
      'en': 'Notifications',
      'es': '',
      'fr': '',
    },
    'gtpm5e8o': {
      'en': '3 new messages',
      'es': '',
      'fr': '',
    },
    'p2mfbn4o': {
      'en': '2 friend requests',
      'es': '',
      'fr': '',
    },
    'tmoou7zk': {
      'en': '15 new likes',
      'es': '',
      'fr': '',
    },
    '4bim87wn': {
      'en': 'Upcoming event: Movie Night',
      'es': '',
      'fr': '',
    },
  },
  // userChatView
  {
    'y7beskyo': {
      'en': 'Chat',
      'es': '',
      'fr': '',
    },
    'xtpfrlcl': {
      'en': 'Connect with friends and groups',
      'es': '',
      'fr': '',
    },
    '0yw2igg3': {
      'en': 'Search chats...',
      'es': '',
      'fr': '',
    },
    'ov7pmqa8': {
      'en': 'Stories',
      'es': '',
      'fr': '',
    },
    '3z60mqvx': {
      'en': 'Add Story',
      'es': '',
      'fr': '',
    },
    's3zngt8z': {
      'en': 'John',
      'es': '',
      'fr': '',
    },
    '1qxo3vgu': {
      'en': 'Emma',
      'es': '',
      'fr': '',
    },
    'qck10k1r': {
      'en': 'Alex',
      'es': '',
      'fr': '',
    },
  },
  // userFindFriendView
  {
    't28kmajs': {
      'en': 'Find Friends',
      'es': '',
      'fr': '',
    },
    '6lrkzeg0': {
      'en': 'Discover new connections',
      'es': '',
      'fr': '',
    },
    'rqqxzkm4': {
      'en': 'Search friends, companies, or activities...',
      'es': '',
      'fr': '',
    },
    'g8d0j1wk': {
      'en': 'Filter Options',
      'es': '',
      'fr': '',
    },
    'q91u19vi': {
      'en': 'Select gender  ',
      'es': '',
      'fr': '',
    },
    '3ammmf5w': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'eb0ntvct': {
      'en': 'Male',
      'es': '',
      'fr': '',
    },
    'kd7ftuid': {
      'en': 'Female',
      'es': '',
      'fr': '',
    },
    'h17cg11m': {
      'en': 'Any',
      'es': '',
      'fr': '',
    },
    '1rizjzbm': {
      'en': 'Alien',
      'es': '',
      'fr': '',
    },
    'du37eq2p': {
      'en': 'Robot',
      'es': '',
      'fr': '',
    },
    'fnojqy19': {
      'en': 'Select Country',
      'es': '',
      'fr': '',
    },
    'kmkmvqgt': {
      'en': 'Age Range',
      'es': '',
      'fr': '',
    },
    'ufnkcyne': {
      'en': 'Min',
      'es': '',
      'fr': '',
    },
    'w0nexjtc': {
      'en': '12',
      'es': '',
      'fr': '',
    },
    'uv2h6nyz': {
      'en': 'to',
      'es': '',
      'fr': '',
    },
    'ch0b3cl9': {
      'en': 'Min',
      'es': '',
      'fr': '',
    },
    'pt0up0ql': {
      'en': '40',
      'es': '',
      'fr': '',
    },
    'x98n56d0': {
      'en': 'Height',
      'es': '',
      'fr': '',
    },
    'q8pftaac': {
      'en': 'Weight',
      'es': '',
      'fr': '',
    },
    '8q2na8s8': {
      'en': 'Ethinicity',
      'es': '',
      'fr': '',
    },
    '5ll03qyi': {
      'en': 'Select eye color',
      'es': '',
      'fr': '',
    },
    'pe4wu2ul': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    '49vy5ymw': {
      'en': 'Brown',
      'es': '',
      'fr': '',
    },
    '7m3vu9gb': {
      'en': 'Blue',
      'es': '',
      'fr': '',
    },
    '0pt6bmhi': {
      'en': 'Green',
      'es': '',
      'fr': '',
    },
    '05w2jfg2': {
      'en': 'Hazel',
      'es': '',
      'fr': '',
    },
    '2vu0qkaf': {
      'en': 'Gray',
      'es': '',
      'fr': '',
    },
    'aqi6pggm': {
      'en': 'Other',
      'es': '',
      'fr': '',
    },
    '85ffeoyw': {
      'en': 'Select hair color',
      'es': '',
      'fr': '',
    },
    'twosx71z': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    '3pyyasr7': {
      'en': 'Black',
      'es': '',
      'fr': '',
    },
    '2enhnmk2': {
      'en': 'Brown',
      'es': '',
      'fr': '',
    },
    'z7av5ue0': {
      'en': 'Blonde',
      'es': '',
      'fr': '',
    },
    '5uw71oks': {
      'en': 'Red',
      'es': '',
      'fr': '',
    },
    'm8eg3u5w': {
      'en': 'Gray',
      'es': '',
      'fr': '',
    },
    'cpe9hvco': {
      'en': 'Other',
      'es': '',
      'fr': '',
    },
    'd82jyazh': {
      'en': 'Select language',
      'es': '',
      'fr': '',
    },
    '97iok9e0': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'qc1pm9vv': {
      'en': 'English',
      'es': '',
      'fr': '',
    },
    '0uwocuev': {
      'en': 'Spanish',
      'es': '',
      'fr': '',
    },
    '24wicgrx': {
      'en': 'French',
      'es': '',
      'fr': '',
    },
    'hhp0nb0p': {
      'en': 'German',
      'es': '',
      'fr': '',
    },
    'u4n6doa5': {
      'en': 'Chinese',
      'es': '',
      'fr': '',
    },
    'qn8vut7z': {
      'en': 'Arabic',
      'es': '',
      'fr': '',
    },
    '4lrgyqeh': {
      'en': 'Other',
      'es': '',
      'fr': '',
    },
    '4184fora': {
      'en': 'Select religion',
      'es': '',
      'fr': '',
    },
    'af273phv': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'mzzxawf6': {
      'en': 'N/A',
      'es': '',
      'fr': '',
    },
    '3yprxpwr': {
      'en': 'Atheist',
      'es': '',
      'fr': '',
    },
    'la1hs686': {
      'en': 'Buddhist',
      'es': '',
      'fr': '',
    },
    '15qr5pqx': {
      'en': 'Christian',
      'es': '',
      'fr': '',
    },
    'oda9a75f': {
      'en': 'Hindu',
      'es': '',
      'fr': '',
    },
    '7aw7w0ok': {
      'en': 'Jewish',
      'es': '',
      'fr': '',
    },
    'p7n1kje1': {
      'en': 'Muslim',
      'es': '',
      'fr': '',
    },
    '4r4pqjkd': {
      'en': 'Other',
      'es': '',
      'fr': '',
    },
    'd5qn75rc': {
      'en': 'Select astrological sign',
      'es': '',
      'fr': '',
    },
    'y9n44g6r': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'yqt8s3fw': {
      'en': 'Aries',
      'es': '',
      'fr': '',
    },
    'whtu25sr': {
      'en': 'Taurus',
      'es': '',
      'fr': '',
    },
    'y7qrjy02': {
      'en': 'Gemini',
      'es': '',
      'fr': '',
    },
    '2gmgdvuz': {
      'en': 'Cancer',
      'es': '',
      'fr': '',
    },
    '8u6qyeh3': {
      'en': 'Leo',
      'es': '',
      'fr': '',
    },
    '3rt7tm9y': {
      'en': 'Virgo',
      'es': '',
      'fr': '',
    },
    'm1zull5u': {
      'en': 'Libra',
      'es': '',
      'fr': '',
    },
    'yosox8hr': {
      'en': 'Scorpio',
      'es': '',
      'fr': '',
    },
    '93ckicvb': {
      'en': 'Sagittarius',
      'es': '',
      'fr': '',
    },
    't6fmcke0': {
      'en': 'Capricorn',
      'es': '',
      'fr': '',
    },
    'l175fxup': {
      'en': 'Aquarius',
      'es': '',
      'fr': '',
    },
    'fh4g3bnl': {
      'en': 'Pisces',
      'es': '',
      'fr': '',
    },
    'h09w8ysr': {
      'en': 'Apply Filters',
      'es': '',
      'fr': '',
    },
    'u833wj12': {
      'en': 'Clear filters',
      'es': '',
      'fr': '',
    },
    'thzz0fwa': {
      'en': 'Search Results',
      'es': '',
      'fr': '',
    },
    '7w4d6dl0': {
      'en': 'Suggested Friends',
      'es': '',
      'fr': '',
    },
  },
  // userCreateActivityView
  {
    'nql9mwso': {
      'en': 'Create Activity',
      'es': '',
      'fr': '',
    },
    '0myzboyz': {
      'en': 'Organize your event and connect with others',
      'es': '',
      'fr': '',
    },
    'n0h5eies': {
      'en': 'Basic Information',
      'es': '',
      'fr': '',
    },
    'r7wyft9c': {
      'en': 'Select planet  ',
      'es': '',
      'fr': '',
    },
    '3mf4gyvr': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'akd4h4y8': {
      'en': 'Mercury',
      'es': '',
      'fr': '',
    },
    '1y1a955a': {
      'en': 'Venus',
      'es': '',
      'fr': '',
    },
    'ojqlmygg': {
      'en': 'Earth',
      'es': '',
      'fr': '',
    },
    '8kl8pauu': {
      'en': 'Mars',
      'es': '',
      'fr': '',
    },
    'qnall8ee': {
      'en': 'Jupiter',
      'es': '',
      'fr': '',
    },
    '7bvo13jv': {
      'en': 'Saturn',
      'es': '',
      'fr': '',
    },
    'n2qtwxf5': {
      'en': 'Uranus',
      'es': '',
      'fr': '',
    },
    'sz83cj85': {
      'en': 'Neptune',
      'es': '',
      'fr': '',
    },
    '5lwoou76': {
      'en': 'Moon',
      'es': '',
      'fr': '',
    },
    'wlr4szx3': {
      'en': 'Select Country',
      'es': '',
      'fr': '',
    },
    'pf7vsx7v': {
      'en': 'Select Region',
      'es': '',
      'fr': '',
    },
    'jzclctub': {
      'en': 'Select City',
      'es': '',
      'fr': '',
    },
    'l2uin7vn': {
      'en': 'Activity Address (Optional)',
      'es': '',
      'fr': '',
    },
    '09pw6d1o': {
      'en': 'Activity Details',
      'es': '',
      'fr': '',
    },
    'gtptgnbv': {
      'en': 'Date',
      'es': '',
      'fr': '',
    },
    'jntslvhy': {
      'en': 'Time',
      'es': '',
      'fr': '',
    },
    'j66dwdr7': {
      'en': 'Is this activity free?',
      'es': '',
      'fr': '',
    },
    'ptzah8gm': {
      'en': 'Select category  ',
      'es': '',
      'fr': '',
    },
    '8qrfphb4': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'c8pe7ek5': {
      'en': 'Party',
      'es': '',
      'fr': '',
    },
    'uyzqkcfy': {
      'en': 'Wedding',
      'es': '',
      'fr': '',
    },
    't8r65gcb': {
      'en': 'Event',
      'es': '',
      'fr': '',
    },
    '0xlzm83s': {
      'en': 'Public',
      'es': '',
      'fr': '',
    },
    'h5d2206w': {
      'en': 'Friends Only',
      'es': '',
      'fr': '',
    },
    'zybp9jjs': {
      'en': 'Private',
      'es': '',
      'fr': '',
    },
    'tngaiacw': {
      'en': 'Public',
      'es': '',
      'fr': '',
    },
    'lntf58ew': {
      'en': 'Number of Participants',
      'es': '',
      'fr': '',
    },
    'gophoymg': {
      'en': 'Activity Description',
      'es': '',
      'fr': '',
    },
    'rvzsklvy': {
      'en': 'Title',
      'es': '',
      'fr': '',
    },
    '8698edeg': {
      'en': 'Description',
      'es': '',
      'fr': '',
    },
    'xfz38kco': {
      'en': 'Add Photo',
      'es': '',
      'fr': '',
    },
    'ue4x5t1s': {
      'en': 'Location Link (Optional)',
      'es': '',
      'fr': '',
    },
    'ktd6sj59': {
      'en': 'Visibility Options',
      'es': '',
      'fr': '',
    },
    '252gsg3q': {
      'en': 'Promote Activity',
      'es': '',
      'fr': '',
    },
    'as1v2wo5': {
      'en':
          'Promoting your activity will place it at the top of the list for increased visibility. Additional charges may apply.',
      'es': '',
      'fr': '',
    },
    'kvuqen6u': {
      'en': 'Create Activity',
      'es': '',
      'fr': '',
    },
    'albhpwow': {
      'en': 'Field is required',
      'es': '',
      'fr': '',
    },
    '34oqhflc': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'ehwawahx': {
      'en': 'participant is required',
      'es': '',
      'fr': '',
    },
    'kipzwiu3': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    '3o7s0arc': {
      'en': 'title is required',
      'es': '',
      'fr': '',
    },
    'hfes6zu0': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    '7h2x0hrr': {
      'en': 'description is required',
      'es': '',
      'fr': '',
    },
    'zbuo98y8': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'c5ns16z4': {
      'en': 'Field is required',
      'es': '',
      'fr': '',
    },
    '0fcydxzk': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'q1nmdnu0': {
      'en': 'Search Activity',
      'es': '',
      'fr': '',
    },
    '42lwdksu': {
      'en': 'Search by category, location...',
      'es': '',
      'fr': '',
    },
    '7gw33lph': {
      'en': 'Featured Acitivity',
      'es': '',
      'fr': '',
    },
  },
  // userCreateAdvertiseView
  {
    'xatj8jb7': {
      'en': 'Create Advertisement',
      'es': '',
      'fr': '',
    },
    'vnzhp3lo': {
      'en': 'Promote your event or content',
      'es': '',
      'fr': '',
    },
    'yfgp3ds8': {
      'en': 'Advertisement Details',
      'es': '',
      'fr': '',
    },
    '4l9uvk8q': {
      'en': 'Select content type  ',
      'es': '',
      'fr': '',
    },
    'tsbvs1g3': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'ow4b863v': {
      'en': 'Flyer',
      'es': '',
      'fr': '',
    },
    '65siqgib': {
      'en': 'Photo',
      'es': '',
      'fr': '',
    },
    '521v5vkc': {
      'en': 'Video',
      'es': '',
      'fr': '',
    },
    'llnimtdo': {
      'en': 'Title',
      'es': '',
      'fr': '',
    },
    '8ozoktzx': {
      'en': 'Description',
      'es': '',
      'fr': '',
    },
    'l0vnnlmj': {
      'en': 'Promotion Link',
      'es': '',
      'fr': '',
    },
    'gfktvlm9': {
      'en': 'Category',
      'es': '',
      'fr': '',
    },
    '7j66mp53': {
      'en': 'Location Details',
      'es': '',
      'fr': '',
    },
    '0lrmn6oc': {
      'en': 'Select planet  ',
      'es': '',
      'fr': '',
    },
    'nhp5wuhm': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'db1vt4cx': {
      'en': 'Mercury',
      'es': '',
      'fr': '',
    },
    'r19fnlyf': {
      'en': 'Venus',
      'es': '',
      'fr': '',
    },
    'o1jx6l6p': {
      'en': 'Earth',
      'es': '',
      'fr': '',
    },
    '2jd0fks0': {
      'en': 'Mars',
      'es': '',
      'fr': '',
    },
    'tbgfu3vl': {
      'en': 'Jupiter',
      'es': '',
      'fr': '',
    },
    'uco731ly': {
      'en': 'Saturn',
      'es': '',
      'fr': '',
    },
    'ldbtpamy': {
      'en': 'Uranus',
      'es': '',
      'fr': '',
    },
    'fjpdeo5u': {
      'en': 'Neptune',
      'es': '',
      'fr': '',
    },
    'm8txbfvq': {
      'en': 'Moon',
      'es': '',
      'fr': '',
    },
    'i27e596q': {
      'en': 'Select Country',
      'es': '',
      'fr': '',
    },
    'e3x73xcv': {
      'en': 'Select Region',
      'es': '',
      'fr': '',
    },
    'um0v92d8': {
      'en': 'Select City',
      'es': '',
      'fr': '',
    },
    'a5ze07lw': {
      'en': 'Promotion Options',
      'es': '',
      'fr': '',
    },
    'hhhu9hje': {
      'en': 'Keep Ad Active',
      'es': '',
      'fr': '',
    },
    'thshlai0': {
      'en': 'Priority Placement',
      'es': '',
      'fr': '',
    },
    '7hasm0v4': {
      'en': 'Create Advertisement',
      'es': '',
      'fr': '',
    },
    'xzz8ho8b': {
      'en': 'title is required',
      'es': '',
      'fr': '',
    },
    '9muir9ug': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'xs5xn6mm': {
      'en': 'description is required',
      'es': '',
      'fr': '',
    },
    'zj76nmb6': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'hz21pxyf': {
      'en': 'promo link is required',
      'es': '',
      'fr': '',
    },
    'qcexc3w9': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    '2gn82e6v': {
      'en': 'category is required',
      'es': '',
      'fr': '',
    },
    'mhv2sgu7': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'vvogy01r': {
      'en': 'Search Advertisements',
      'es': '',
      'fr': '',
    },
    '0c54bsnn': {
      'en': 'Search by category, location...',
      'es': '',
      'fr': '',
    },
    '5bh5gxhw': {
      'en': 'Featured Ads',
      'es': '',
      'fr': '',
    },
  },
  // businessHomeView
  {
    'li1ol5fk': {
      'en': 'Following',
      'es': '',
      'fr': '',
    },
    'ptebco2o': {
      'en': 'Followers',
      'es': '',
      'fr': '',
    },
    'wz8qg4qa': {
      'en': 'Upcoming Event',
      'es': '',
      'fr': '',
    },
    'ird9qo9m': {
      'en': 'Tech Expo 2023',
      'es': '',
      'fr': '',
    },
    'cr611500': {
      'en':
          'Join us at the annual Tech Expo on July 15th, 2023. Showcase your latest innovations!',
      'es': '',
      'fr': '',
    },
    'sijemxrq': {
      'en': 'New Messages',
      'es': '',
      'fr': '',
    },
    'qrb2p0r9': {
      'en': '3 new messages from potential clients',
      'es': '',
      'fr': '',
    },
    '1gldrvqo': {
      'en': 'Check your inbox to respond promptly.',
      'es': '',
      'fr': '',
    },
    '4c8yqy1z': {
      'en': 'New Follower',
      'es': '',
      'fr': '',
    },
    'uxo9l4us': {
      'en': 'InnovateTech Corp is now following you',
      'es': '',
      'fr': '',
    },
    't8yjz5jl': {
      'en': 'Expand your network and explore collaboration opportunities.',
      'es': '',
      'fr': '',
    },
  },
  // businessChatView
  {
    'hyn1h1m3': {
      'en': 'Chat',
      'es': '',
      'fr': '',
    },
    '2tij9tgh': {
      'en': 'Connect with friends and colleagues',
      'es': '',
      'fr': '',
    },
    'o8jszfxu': {
      'en': 'Search friends or conversations...',
      'es': '',
      'fr': '',
    },
    'kudaacvy': {
      'en': 'Friend Requests',
      'es': '',
      'fr': '',
    },
    '6a339ahw': {
      'en': 'John Doe',
      'es': '',
      'fr': '',
    },
    'cy5abr69': {
      'en': 'Wants to connect',
      'es': '',
      'fr': '',
    },
    'kfy2dxxi': {
      'en': 'Accept',
      'es': '',
      'fr': '',
    },
    '72i2hmgj': {
      'en': 'Decline',
      'es': '',
      'fr': '',
    },
    'zihfq57v': {
      'en': 'Recent Chats',
      'es': '',
      'fr': '',
    },
    'hz85nhj9': {
      'en': 'Alice Smith',
      'es': '',
      'fr': '',
    },
    'v1vpl2ex': {
      'en': 'Hey, how\'s it going?',
      'es': '',
      'fr': '',
    },
    '2xfxf7o5': {
      'en': '2m ago',
      'es': '',
      'fr': '',
    },
    'u2io6o0f': {
      'en': '2',
      'es': '',
      'fr': '',
    },
    'f9mmkzg1': {
      'en': 'Marketing Team',
      'es': '',
      'fr': '',
    },
    '5pdkcr9w': {
      'en': 'Sarah: Meeting at 3 PM',
      'es': '',
      'fr': '',
    },
    'h2nfh585': {
      'en': '1h ago',
      'es': '',
      'fr': '',
    },
    'y76kam9j': {
      'en': 'Stories',
      'es': '',
      'fr': '',
    },
    '2b813lxe': {
      'en': 'Add Story',
      'es': '',
      'fr': '',
    },
    'kwgotduv': {
      'en': 'Your Story',
      'es': '',
      'fr': '',
    },
    'v61zj2vx': {
      'en': 'Emma',
      'es': '',
      'fr': '',
    },
    'as1v1s3q': {
      'en': 'Mike',
      'es': '',
      'fr': '',
    },
  },
  // businessCreateActivityView
  {
    'x6zl55sw': {
      'en': 'Adventure Seekers Inc.',
      'es': '',
      'fr': '',
    },
    'p7cxc17v': {
      'en': 'Reliability Rating: 5 stars',
      'es': '',
      'fr': '',
    },
    '8wo5teut': {
      'en': 'Create New Activity',
      'es': '',
      'fr': '',
    },
    'aqd4torq': {
      'en': 'Planet',
      'es': '',
      'fr': '',
    },
    '540capmw': {
      'en': 'Earth',
      'es': '',
      'fr': '',
    },
    'czgxt0ba': {
      'en': 'Country',
      'es': '',
      'fr': '',
    },
    'vwnhiqw3': {
      'en': 'Select Country',
      'es': '',
      'fr': '',
    },
    'hp4k35qb': {
      'en': 'Province/State',
      'es': '',
      'fr': '',
    },
    '9261bgea': {
      'en': 'Select Province',
      'es': '',
      'fr': '',
    },
    'xobo1qiu': {
      'en': 'City/Village',
      'es': '',
      'fr': '',
    },
    'gy8w7440': {
      'en': 'Select City',
      'es': '',
      'fr': '',
    },
    'pibnoviu': {
      'en': 'Address',
      'es': '',
      'fr': '',
    },
    '84qxh468': {
      'en': 'Date',
      'es': '',
      'fr': '',
    },
    'd5kw3ybx': {
      'en': 'Select Date',
      'es': '',
      'fr': '',
    },
    's8zaio95': {
      'en': 'Time',
      'es': '',
      'fr': '',
    },
    '2z6lnmgj': {
      'en': 'Select Time',
      'es': '',
      'fr': '',
    },
    'kjgnn4ia': {
      'en': 'Activity Type',
      'es': '',
      'fr': '',
    },
    'ph54u3k6': {
      'en': 'Free',
      'es': '',
      'fr': '',
    },
    'nlcbb115': {
      'en': 'Paid',
      'es': '',
      'fr': '',
    },
    'qcad4llg': {
      'en': 'Activity Category',
      'es': '',
      'fr': '',
    },
    'a8fm5ltl': {
      'en': 'Select Category',
      'es': '',
      'fr': '',
    },
    'kjl2uz9n': {
      'en': 'Visibility',
      'es': '',
      'fr': '',
    },
    'yfnqvhbz': {
      'en': 'Public',
      'es': '',
      'fr': '',
    },
    'z0fxwbul': {
      'en': 'Participant Limit',
      'es': '',
      'fr': '',
    },
    '01647cvn': {
      'en': '10',
      'es': '',
      'fr': '',
    },
    'vz2hpgsv': {
      'en': 'Invite Friends',
      'es': '',
      'fr': '',
    },
    'eaklt6bg': {
      'en': 'Description',
      'es': '',
      'fr': '',
    },
    'p2k71l0g': {
      'en': 'Add Photo',
      'es': '',
      'fr': '',
    },
    'f3u71r3r': {
      'en': 'Add Video',
      'es': '',
      'fr': '',
    },
    'wb75knbz': {
      'en': 'Add Location',
      'es': '',
      'fr': '',
    },
    '5gqlav2v': {
      'en': 'Enable Double Confirmation',
      'es': '',
      'fr': '',
    },
    '6sdmuan2': {
      'en': 'Create Activity',
      'es': '',
      'fr': '',
    },
    '5kp8z87x': {
      'en': 'Promote Activity',
      'es': '',
      'fr': '',
    },
  },
  // businessCreateAdvertiseView
  {
    'wzff8qac': {
      'en': 'Create Advertisement',
      'es': '',
      'fr': '',
    },
    '8m4oj5gv': {
      'en': 'Promote your event or content',
      'es': '',
      'fr': '',
    },
    '0d90n2m9': {
      'en': 'Advertisement Details',
      'es': '',
      'fr': '',
    },
    'tog5uecz': {
      'en': 'Select content type  ',
      'es': '',
      'fr': '',
    },
    'p0p2a6un': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    '43b5578q': {
      'en': 'Flyer',
      'es': '',
      'fr': '',
    },
    'g1u60yn6': {
      'en': 'Photo',
      'es': '',
      'fr': '',
    },
    'o7qew9ah': {
      'en': 'Video',
      'es': '',
      'fr': '',
    },
    'yini8kqt': {
      'en': 'Description',
      'es': '',
      'fr': '',
    },
    '8vwe7n53': {
      'en': 'Promotion Link',
      'es': '',
      'fr': '',
    },
    'uc34o1lk': {
      'en': 'Category',
      'es': '',
      'fr': '',
    },
    'bdg32ivo': {
      'en': 'Location Details',
      'es': '',
      'fr': '',
    },
    'uwc97i3m': {
      'en': 'Select planet  ',
      'es': '',
      'fr': '',
    },
    'wtldq7dp': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'ksgchyai': {
      'en': 'Mercury',
      'es': '',
      'fr': '',
    },
    'r7k7pqv8': {
      'en': 'Venus',
      'es': '',
      'fr': '',
    },
    '07nfg9jz': {
      'en': 'Earth',
      'es': '',
      'fr': '',
    },
    'et7026yi': {
      'en': 'Mars',
      'es': '',
      'fr': '',
    },
    '7rtwkaeq': {
      'en': 'Jupiter',
      'es': '',
      'fr': '',
    },
    'vot6dh3p': {
      'en': 'Saturn',
      'es': '',
      'fr': '',
    },
    'igxhxyaa': {
      'en': 'Uranus',
      'es': '',
      'fr': '',
    },
    '1he2zx0v': {
      'en': 'Neptune',
      'es': '',
      'fr': '',
    },
    'cim3lirg': {
      'en': 'Moon',
      'es': '',
      'fr': '',
    },
    'f3vduchs': {
      'en': 'Select Country',
      'es': '',
      'fr': '',
    },
    '0mecou6s': {
      'en': 'Select Region',
      'es': '',
      'fr': '',
    },
    'yug41wbx': {
      'en': 'Select City',
      'es': '',
      'fr': '',
    },
    'zbijk10o': {
      'en': 'Promotion Options',
      'es': '',
      'fr': '',
    },
    'p6pl0a4n': {
      'en': 'Keep Ad Active',
      'es': '',
      'fr': '',
    },
    '5h9dk75z': {
      'en': 'Priority Placement',
      'es': '',
      'fr': '',
    },
    'rnqdjemv': {
      'en': 'Duration: 7 days',
      'es': '',
      'fr': '',
    },
    'gp1zg155': {
      'en': 'Create Advertisement',
      'es': '',
      'fr': '',
    },
    '5wv7rzmk': {
      'en': 'Search Advertisements',
      'es': '',
      'fr': '',
    },
    'dl634tf8': {
      'en': 'Search by category, location...',
      'es': '',
      'fr': '',
    },
    'cslgix33': {
      'en': 'Featured Ads',
      'es': '',
      'fr': '',
    },
    '30h1c1vg': {
      'en': 'Live Jazz Night',
      'es': '',
      'fr': '',
    },
    'go1s3j2u': {
      'en':
          'Join us for an unforgettable evening of smooth jazz and soulful melodies.',
      'es': '',
      'fr': '',
    },
    '3oksolha': {
      'en': 'New York, USA',
      'es': '',
      'fr': '',
    },
    'obmgtorc': {
      'en': 'Earth',
      'es': '',
      'fr': '',
    },
    'b9oaniox': {
      'en': 'Modern Art Showcase',
      'es': '',
      'fr': '',
    },
    '46vkrsex': {
      'en': 'Experience the future of art in our cutting-edge exhibition.',
      'es': '',
      'fr': '',
    },
    'cidvs2sf': {
      'en': 'Paris, France',
      'es': '',
      'fr': '',
    },
    'c6pw148s': {
      'en': 'Earth',
      'es': '',
      'fr': '',
    },
    'nglwq3ea': {
      'en': 'Worldwide Suggestions',
      'es': '',
      'fr': '',
    },
    'kl1346rn': {
      'en': 'Virtual Reality Experience',
      'es': '',
      'fr': '',
    },
    'v12ae136': {
      'en': 'Immerse yourself in new worlds',
      'es': '',
      'fr': '',
    },
    '4xnjmjil': {
      'en': 'Tokyo, Japan',
      'es': '',
      'fr': '',
    },
    '99guf3px': {
      'en': 'Earth',
      'es': '',
      'fr': '',
    },
    'qgw0q3er': {
      'en': 'Mars Colony Tour',
      'es': '',
      'fr': '',
    },
    'r4m7ses3': {
      'en': 'Experience life on the Red Planet',
      'es': '',
      'fr': '',
    },
    'mxkattop': {
      'en': 'Olympus Mons',
      'es': '',
      'fr': '',
    },
    '87kjo0kw': {
      'en': 'Mars',
      'es': '',
      'fr': '',
    },
  },
  // deleteDialogBox
  {
    'bfm55k8i': {
      'en': 'Delete Account',
      'es': '',
      'fr': '',
    },
    'e4zn6nui': {
      'en': 'Are you sure you wanna delete this aacount?',
      'es': '',
      'fr': '',
    },
    '92x85frf': {
      'en': 'Cancel',
      'es': '',
      'fr': '',
    },
    'y8673rbs': {
      'en': 'Delete',
      'es': '',
      'fr': '',
    },
  },
  // chatThread
  {
    'gweue5j7': {
      'en': 'Me',
      'es': '',
      'fr': '',
    },
  },
  // chat_DetailsOverlay
  {
    'll3jcoxy': {
      'en': 'Group Chat ID: ',
      'es': '',
      'fr': '',
    },
    'eow63y2z': {
      'en': 'In this chat',
      'es': '',
      'fr': '',
    },
    'yommwqwu': {
      'en': 'Close',
      'es': '',
      'fr': '',
    },
  },
  // chat_ThreadComponent
  {
    'tqrihuvy': {
      'en': 'Start typing here...',
      'es': '',
      'fr': '',
    },
    'ddjwpl9g': {
      'en': 'Enter your message',
      'es': '',
      'fr': '',
    },
    'xisup4b7': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
  },
  // user_ListSmall
  {
    'ulhrrw54': {
      'en': 'ME',
      'es': '',
      'fr': '',
    },
  },
  // deleteDialog
  {
    'yfjmr17t': {
      'en': 'Options',
      'es': '',
      'fr': '',
    },
    'e8elqoso': {
      'en': 'Invite Users',
      'es': '',
      'fr': '',
    },
    'h2oqpo5r': {
      'en': 'Delete Chat',
      'es': '',
      'fr': '',
    },
    '1pd5v9ad': {
      'en': 'Confirm Delete',
      'es': '',
      'fr': '',
    },
    '0hr9y484': {
      'en': 'You can\'t undo this action.',
      'es': '',
      'fr': '',
    },
    'timzwfx2': {
      'en': 'Delete',
      'es': '',
      'fr': '',
    },
  },
  // Miscellaneous
  {
    'qb0vdcl8': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '6oi9z3yr': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'uq1jpldm': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'lcnhgvxs': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'p79pory7': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'ctvrpwim': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'q51mym7t': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '0f2ndvx3': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '2qv6ayn6': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '0k9f6tkx': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'k364u9mg': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'tquzutjv': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'nnaowxp5': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '4f8jsppu': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '48q6z8ob': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'uq8ytkoq': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'yhw92xp6': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'vyo7frzq': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'q2hy9c8a': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'vhta7em1': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '474lb68c': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '85f53eqp': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'ky7os6pd': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'or3xjxjc': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '6ly2fqth': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'm9cd8byv': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'p4tp5xne': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'umskwvxy': {
      'en': '',
      'es': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
