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

  static List<String> languages() => ['en', 'gu'];

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
    String? guText = '',
  }) =>
      [enText, guText][languageIndex] ?? '';

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
  // editProfile
  {
    'hxs3au3a': {
      'en': 'Edit your profile picture',
      'gu': '',
    },
    '8jjolo45': {
      'en': 'Email',
      'gu': '',
    },
    'uhkz2zj3': {
      'en': '',
      'gu': '',
    },
    'phn2x4j0': {
      'en': 'Choose Your Title',
      'gu': '',
    },
    'gkpdfz8c': {
      'en': 'Search for an item...',
      'gu': '',
    },
    'z9eghy49': {
      'en': 'Bro.',
      'gu': '',
    },
    '90mtuftu': {
      'en': 'W.Bro.',
      'gu': '',
    },
    '7w8jqw0v': {
      'en': 'V.W.Bro.',
      'gu': '',
    },
    'v6gsj4j6': {
      'en': 'R.W.Bro.',
      'gu': '',
    },
    '8tqxfezt': {
      'en': 'M.W.Bro.',
      'gu': '',
    },
    '1uwjfgc1': {
      'en': ' Name',
      'gu': '',
    },
    '42qldwv3': {
      'en': '',
      'gu': '',
    },
    '2vgyiwsj': {
      'en': 'Phone ',
      'gu': '',
    },
    'deld2w9x': {
      'en': '',
      'gu': '',
    },
    '6y196ldg': {
      'en': 'Reg No',
      'gu': '',
    },
    '13mb0pkp': {
      'en': '',
      'gu': '',
    },
    'ab7iidhn': {
      'en': 'RGLSI ID',
      'gu': '',
    },
    '1el3a163': {
      'en': '',
      'gu': '',
    },
    'nsaxdz5t': {
      'en': 'Address',
      'gu': '',
    },
    'gvg4vpnk': {
      'en': '',
      'gu': '',
    },
    'k3i6enxc': {
      'en': 'Date of Birth',
      'gu': '',
    },
    'occ7cyya': {
      'en': 'DOI',
      'gu': '',
    },
    '0p65aspf': {
      'en': 'DOP',
      'gu': '',
    },
    '9867j1nj': {
      'en': 'DOR',
      'gu': '',
    },
    'oo36dz7q': {
      'en': 'Master Year',
      'gu': '',
    },
    '0o4h8xwp': {
      'en': '',
      'gu': '',
    },
    'h96igozj': {
      'en': 'R.G. Rank',
      'gu': '',
    },
    'spjc62at': {
      'en': '',
      'gu': '',
    },
    'hww15l18': {
      'en': 'G. Rank',
      'gu': '',
    },
    'd809ncgt': {
      'en': '',
      'gu': '',
    },
    'w5yvx55d': {
      'en': 'Side Degree',
      'gu': '',
    },
    '6n36dzie': {
      'en': 'Chapter',
      'gu': '',
    },
    'isppryww': {
      'en': 'Mark',
      'gu': '',
    },
    'ia54y15h': {
      'en': 'RAM',
      'gu': '',
    },
    'vt6z0mhi': {
      'en': 'Conclave',
      'gu': '',
    },
    'x7um56kf': {
      'en': 'Are you a Blood Donor?',
      'gu': '',
    },
    'juqm0981': {
      'en': 'Choose Your Blood Group',
      'gu': '',
    },
    '2cbsucrs': {
      'en': 'Search for an item...',
      'gu': '',
    },
    'eix9ebnv': {
      'en': 'Family Details',
      'gu': '',
    },
    'msllloar': {
      'en': 'Spouse Name',
      'gu': '',
    },
    'e611cohg': {
      'en': '',
      'gu': '',
    },
    'q43umev4': {
      'en': 'Spouse DOB',
      'gu': '',
    },
    't3se53oc': {
      'en': 'Wedding Anniversary',
      'gu': '',
    },
    'kai5kzc1': {
      'en': 'Spouse Blood Group',
      'gu': '',
    },
    '9s11n21s': {
      'en': 'Search for an item...',
      'gu': '',
    },
    'z1m4y85v': {
      'en': 'Children Name',
      'gu': '',
    },
    'er7vyvc3': {
      'en': '',
      'gu': '',
    },
    'togr42n0': {
      'en': '',
      'gu': '',
    },
    'p10cw4v6': {
      'en': '',
      'gu': '',
    },
    '1yjtw2pu': {
      'en': 'Field is required',
      'gu': '',
    },
    'ogpv5pmh': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    'vmglqvg7': {
      'en': 'Field is required',
      'gu': '',
    },
    'x5u86vj2': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    'oqx78uhw': {
      'en': 'Field is required',
      'gu': '',
    },
    'ddaj58f4': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    'khjylm36': {
      'en': 'Field is required',
      'gu': '',
    },
    'kkeoml8p': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    'i7pj50id': {
      'en': 'Field is required',
      'gu': '',
    },
    'fjls6ob9': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    'atlituwi': {
      'en': 'Field is required',
      'gu': '',
    },
    'am3ayj55': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    'n80fe6ck': {
      'en': 'Field is required',
      'gu': '',
    },
    '25z4j0qx': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    'nu9inncf': {
      'en': 'Field is required',
      'gu': '',
    },
    '4zwz1jxn': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    'jolf9fws': {
      'en': 'Field is required',
      'gu': '',
    },
    'tgzolc34': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    'fc5c5ogg': {
      'en': 'Field is required',
      'gu': '',
    },
    'q7dzoupw': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    'f0s5kafb': {
      'en': 'Field is required',
      'gu': '',
    },
    'lhp8vqzx': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    'bbvtendb': {
      'en': 'Field is required',
      'gu': '',
    },
    'duocb9k1': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    '97e5z6jr': {
      'en': 'Field is required',
      'gu': '',
    },
    '2y5mgw02': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    'mecrfs2j': {
      'en': 'Save Changes',
      'gu': '',
    },
    'smfqvg3a': {
      'en': 'Your Profile information',
      'gu': '',
    },
    '3c9p77rf': {
      'en': 'Home',
      'gu': '',
    },
  },
  // ForgotPassword
  {
    'mxuj1ej0': {
      'en': 'Back',
      'gu': '',
    },
    '120vit8m': {
      'en': 'Forgot Password',
      'gu': '',
    },
    '53322jne': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'gu': '',
    },
    'xye8orv4': {
      'en': 'Your email address...',
      'gu': '',
    },
    'j8v2g40s': {
      'en': '',
      'gu': '',
    },
    'a4mfnwpk': {
      'en': 'Send Link',
      'gu': '',
    },
    'uxam8xh2': {
      'en': 'Back',
      'gu': '',
    },
    'hx48dnub': {
      'en': 'Home',
      'gu': '',
    },
  },
  // Report
  {
    'vev85pp4': {
      'en': 'Create Report',
      'gu': '',
    },
    'q4ad4l1w': {
      'en': 'Fill out the form below to submit a ticket.',
      'gu': '',
    },
    'aghbvhy5': {
      'en': 'Subject...',
      'gu': '',
    },
    'l7xuqe2l': {
      'en': 'Short Description of what is going on...',
      'gu': '',
    },
    'gf91hr27': {
      'en': 'Submit Now',
      'gu': '',
    },
    'pjmc78ia': {
      'en': 'Home',
      'gu': '',
    },
  },
  // Businesinfo
  {
    'jcpl6m6w': {
      'en': 'Add your Logo',
      'gu': '',
    },
    'x0x9vmcr': {
      'en': 'Business Name',
      'gu': '',
    },
    '4b4h1ldc': {
      'en': '',
      'gu': '',
    },
    'e1qce6bh': {
      'en': 'Choose Business Categories',
      'gu': '',
    },
    'e0g8qq91': {
      'en': 'Search for an item...',
      'gu': '',
    },
    'ep4z1oab': {
      'en': 'Address 1',
      'gu': '',
    },
    'mduy725r': {
      'en': '',
      'gu': '',
    },
    'fv6n6an4': {
      'en': 'Address 2',
      'gu': '',
    },
    'bb5jdvib': {
      'en': '',
      'gu': '',
    },
    'erjc23ov': {
      'en': 'City',
      'gu': '',
    },
    'kn5c9hpa': {
      'en': 'Search for an item...',
      'gu': '',
    },
    '9nnlylnl': {
      'en': 'State',
      'gu': '',
    },
    'hl4i1cvs': {
      'en': 'Search for an item...',
      'gu': '',
    },
    'ufdi2n70': {
      'en': 'Pin Code',
      'gu': '',
    },
    'bt128ql2': {
      'en': '',
      'gu': '',
    },
    'gaji2g3m': {
      'en': 'Save Changes',
      'gu': '',
    },
    'rcct99wq': {
      'en': 'Field is required',
      'gu': '',
    },
    'pvau2ijb': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    'ivptrzia': {
      'en': 'Field is required',
      'gu': '',
    },
    '9de1z5sq': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    '16liunuf': {
      'en': 'Field is required',
      'gu': '',
    },
    'j6tt3ef9': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    '5d5yogkz': {
      'en': 'Add Your Business Info',
      'gu': '',
    },
    '6adr9e7o': {
      'en': 'Home',
      'gu': '',
    },
  },
  // MainBusiness
  {
    'bkme79qj': {
      'en': 'Search Business / Profession',
      'gu': '',
    },
    'q2w807vn': {
      'en': 'Sort by Category',
      'gu': '',
    },
    '28yg9b4s': {
      'en': 'Sort by City ',
      'gu': '',
    },
    'ko37r9r7': {
      'en': 'Business',
      'gu': '',
    },
  },
  // EditBusinesinfo
  {
    'l0jrttvf': {
      'en': 'Edit your logo',
      'gu': '',
    },
    'q1oqiwzn': {
      'en': 'Company Name',
      'gu': '',
    },
    'rk3cn6wu': {
      'en': '',
      'gu': '',
    },
    'jj7o1iuq': {
      'en': '',
      'gu': '',
    },
    'wgh8pqgt': {
      'en': 'Edit',
      'gu': '',
    },
    'jhln3sgx': {
      'en': 'Search for an item...',
      'gu': '',
    },
    'l91apwt7': {
      'en': 'Address',
      'gu': '',
    },
    'cjzoqkka': {
      'en': '',
      'gu': '',
    },
    'x98e4yze': {
      'en': 'Address 2',
      'gu': '',
    },
    'vkmnrdgc': {
      'en': '',
      'gu': '',
    },
    'dv3inr5h': {
      'en': '',
      'gu': '',
    },
    'tcwmgb54': {
      'en': 'Edit Your City',
      'gu': '',
    },
    'ru6lyf2x': {
      'en': 'Search for an item...',
      'gu': '',
    },
    'rfsjii2m': {
      'en': '',
      'gu': '',
    },
    '0eiu74i6': {
      'en': 'Edit Your State',
      'gu': '',
    },
    'wk6y70a5': {
      'en': 'Search for an item...',
      'gu': '',
    },
    '6eylx7op': {
      'en': 'Pin Code',
      'gu': '',
    },
    's4po8ie8': {
      'en': '',
      'gu': '',
    },
    'iq6x1iwi': {
      'en': 'Save Changes',
      'gu': '',
    },
    '5cl7chua': {
      'en': 'Field is required',
      'gu': '',
    },
    '1xofigd5': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    'feutk29e': {
      'en': 'Field is required',
      'gu': '',
    },
    'gp67xqy3': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    'mhte93o5': {
      'en': 'Field is required',
      'gu': '',
    },
    'q63tkbt6': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    'mnp2nsgy': {
      'en': 'Edit Business / Profession Info',
      'gu': '',
    },
    'h8v4ps9i': {
      'en': 'Home',
      'gu': '',
    },
  },
  // ProfessionPage
  {
    'opkdj7xe': {
      'en': 'All Profession',
      'gu': '',
    },
    'y4zrh34y': {
      'en': 'Filters',
      'gu': '',
    },
    'ucot9d88': {
      'en': 'Sort by Category...',
      'gu': '',
    },
    'e4t51ieo': {
      'en': 'City of Operations',
      'gu': '',
    },
    'j64sxngr': {
      'en': 'View Info',
      'gu': '',
    },
    'q2y6fn81': {
      'en': 'Business',
      'gu': '',
    },
  },
  // ProfessionInfo
  {
    '0j367ref': {
      'en': 'Profession info',
      'gu': '',
    },
    'f9hx85w1': {
      'en': 'Company Name, if Any (optional)',
      'gu': '',
    },
    '34s2tr2i': {
      'en': '',
      'gu': '',
    },
    'wzun5zom': {
      'en': 'Choose Profession Categories',
      'gu': '',
    },
    'k7kpee3a': {
      'en': 'Search for an item...',
      'gu': '',
    },
    'dvlg137r': {
      'en': 'City of Operations...',
      'gu': '',
    },
    '304xpb1q': {
      'en': 'Search for an item...',
      'gu': '',
    },
    'qt15yzd3': {
      'en': 'Address 1',
      'gu': '',
    },
    'mgp89ad8': {
      'en': '',
      'gu': '',
    },
    'v6vjmukr': {
      'en': 'Address 2',
      'gu': '',
    },
    'fjllv8ds': {
      'en': '',
      'gu': '',
    },
    'm8yj6q25': {
      'en': 'State',
      'gu': '',
    },
    'vjt8avcn': {
      'en': '',
      'gu': '',
    },
    '12gxiz7n': {
      'en': 'Pin Code',
      'gu': '',
    },
    '11oh2u5i': {
      'en': '',
      'gu': '',
    },
    'a3ki1c4c': {
      'en': 'Save Changes',
      'gu': '',
    },
    'hbxk3gqi': {
      'en': 'Field is required',
      'gu': '',
    },
    '6v2ah8fi': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    'hj6sq5qy': {
      'en': 'Field is required',
      'gu': '',
    },
    '6583p7af': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    'ou0fntvz': {
      'en': 'Field is required',
      'gu': '',
    },
    'giq92u8e': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    'c7ybm7gz': {
      'en': 'Home',
      'gu': '',
    },
  },
  // EditProfessionInfo
  {
    '20spvo6v': {
      'en': 'Profession info',
      'gu': '',
    },
    'ttrnjios': {
      'en': '',
      'gu': '',
    },
    'ku4swi2q': {
      'en': 'Edit Your City',
      'gu': '',
    },
    'gyrpxi6m': {
      'en': 'Search for an item...',
      'gu': '',
    },
    'i6wqhg0q': {
      'en': '',
      'gu': '',
    },
    'x70nouue': {
      'en': 'Edit Your Category',
      'gu': '',
    },
    'vvsje1f4': {
      'en': 'Search for an item...',
      'gu': '',
    },
    'toeg2kqb': {
      'en': '',
      'gu': '',
    },
    'k1dvss6o': {
      'en': '',
      'gu': '',
    },
    'hp2a0hp1': {
      'en': '',
      'gu': '',
    },
    '82umckmt': {
      'en': 'State',
      'gu': '',
    },
    '1shuo5x8': {
      'en': 'Search for an item...',
      'gu': '',
    },
    'fl622rj4': {
      'en': '',
      'gu': '',
    },
    '66vadhj2': {
      'en': 'Save Changes',
      'gu': '',
    },
    '6a66nsln': {
      'en': 'Field is required',
      'gu': '',
    },
    'uhjkpzzp': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    'y8ikm7kx': {
      'en': 'Field is required',
      'gu': '',
    },
    '9gye18x6': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    'hykfutr0': {
      'en': 'Field is required',
      'gu': '',
    },
    'msf7mn4n': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    '64d15xzx': {
      'en': 'Home',
      'gu': '',
    },
  },
  // Home_bloodgroup
  {
    'h2v53oex': {
      'en': 'List of Blood Donors',
      'gu': '',
    },
    '8jhrbxtj': {
      'en': 'Search by Blood Group',
      'gu': '',
    },
    '522nzxd1': {
      'en': 'Search by City...',
      'gu': '',
    },
    '7gdf7k2k': {
      'en': 'Option 1',
      'gu': '',
    },
    '7xvf6nfz': {
      'en': 'View',
      'gu': '',
    },
    'e8drvu2y': {
      'en': 'user@domainname.com',
      'gu': '',
    },
    'p9sdqvy1': {
      'en': 'View',
      'gu': '',
    },
    '5dbjsgo3': {
      'en': 'Username',
      'gu': '',
    },
    'vvjmfpdk': {
      'en': 'user@domainname.com',
      'gu': '',
    },
    'hwa6r5mm': {
      'en': 'View',
      'gu': '',
    },
    '2wcqz96v': {
      'en': 'Username',
      'gu': '',
    },
    '29lmzkzl': {
      'en': 'user@domainname.com',
      'gu': '',
    },
    'ex9si9c7': {
      'en': 'View',
      'gu': '',
    },
    '8a3apgz6': {
      'en': 'user@domainname.com',
      'gu': '',
    },
    'd299q0zo': {
      'en': 'View',
      'gu': '',
    },
    'nviqozkk': {
      'en': 'Home',
      'gu': '',
    },
  },
  // Signup
  {
    'm4xl9e8s': {
      'en': 'Register',
      'gu': '',
    },
    'nmy2npyg': {
      'en': 'Are you a Member of Lodge Bharathi ?',
      'gu': '',
    },
    'm570bs16': {
      'en': 'Yes',
      'gu': '',
    },
    'nx7bcn89': {
      'en': 'Yes',
      'gu': '',
    },
    '5huffpxg': {
      'en': 'No',
      'gu': '',
    },
    '5hoihsoy': {
      'en': '',
      'gu': '',
    },
    'lgtu7vyg': {
      'en':
          'Sorry, This site is exclusively for Members of Lodge Bharathi 161.  Access denied.',
      'gu': '',
    },
    '64t9f3td': {
      'en': 'Enter Your Email',
      'gu': '',
    },
    'o9q9je3i': {
      'en': '',
      'gu': '',
    },
    'u9uw3z2a': {
      'en': 'Enter Your Password',
      'gu': '',
    },
    '5zk975x4': {
      'en': '',
      'gu': '',
    },
    't3qvvefm': {
      'en': 'Confirm Password',
      'gu': '',
    },
    'm4hibs7f': {
      'en': '',
      'gu': '',
    },
    'mhwxswvv': {
      'en': 'Create Account',
      'gu': '',
    },
    'q6qil620': {
      'en': 'Field is required',
      'gu': '',
    },
    'rk6903gj': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    '9cf646wj': {
      'en': 'Field is required',
      'gu': '',
    },
    'u0sujhzp': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    'y6vtibh9': {
      'en': 'Field is required',
      'gu': '',
    },
    'n4pbw5aq': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    'oc3j8j38': {
      'en': 'Field is required',
      'gu': '',
    },
    '6v2dutse': {
      'en': 'Min Six Characters',
      'gu': '',
    },
    'h6wbtg3j': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    'oigcouvi': {
      'en': 'Field is required',
      'gu': '',
    },
    'z2j80l8r': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    'nouadfub': {
      'en': 'Home',
      'gu': '',
    },
  },
  // ProfilePage
  {
    'd0ya8sb3': {
      'en': 'Logout',
      'gu': '',
    },
    'r958itlz': {
      'en': 'Edit Profile',
      'gu': '',
    },
    '7hwnlir4': {
      'en': 'Help Center',
      'gu': '',
    },
    'a97ax4ve': {
      'en': 'Email',
      'gu': '',
    },
    '9m62xlw8': {
      'en': 'Phone Number',
      'gu': '',
    },
    '84qtdpqc': {
      'en': 'Reg No',
      'gu': '',
    },
    'drkysig0': {
      'en': 'RGLSI ID',
      'gu': '',
    },
    'bkudlmt1': {
      'en': 'Address ',
      'gu': '',
    },
    'f341rr1l': {
      'en': 'Date of Birth',
      'gu': '',
    },
    'gob59v8g': {
      'en': 'DOI',
      'gu': '',
    },
    'kmiyc4xi': {
      'en': 'DOP',
      'gu': '',
    },
    'iqbs8gla': {
      'en': 'DOR',
      'gu': '',
    },
    'zhnggi3a': {
      'en': 'Master Year ',
      'gu': '',
    },
    '79wmyu84': {
      'en': 'R G Rank',
      'gu': '',
    },
    'nbqvo14h': {
      'en': 'G Rank',
      'gu': '',
    },
    'gjwskyvk': {
      'en': 'Side Degrees',
      'gu': '',
    },
    'tp12vruu': {
      'en': 'Blood Group',
      'gu': '',
    },
    'uiedx0tu': {
      'en': 'Subscription for 2024-2025',
      'gu': '',
    },
    '0ro87z85': {
      'en': 'Family Details',
      'gu': '',
    },
    '8v7s5uxq': {
      'en': 'Spouse Name',
      'gu': '',
    },
    'r394vc20': {
      'en': 'Spouse DOB',
      'gu': '',
    },
    '2xgr8qtp': {
      'en': 'Spouse Blood Group',
      'gu': '',
    },
    'nozlpf60': {
      'en': 'Date of Anniversary',
      'gu': '',
    },
    'drbx1sxw': {
      'en': 'Children',
      'gu': '',
    },
    'azik5rkv': {
      'en': 'Children',
      'gu': '',
    },
    'hqgpvs2j': {
      'en': 'Children',
      'gu': '',
    },
    'midyqbk8': {
      'en': 'Profile',
      'gu': '',
    },
  },
  // Profile06
  {
    'q35ad2ev': {
      'en': 'Add Business Info',
      'gu': '',
    },
    'py7knbtk': {
      'en': 'Add Profession Info',
      'gu': '',
    },
    'lka1okpg': {
      'en': 'View My Businesses',
      'gu': '',
    },
    '6hq8gbuh': {
      'en': 'View My Professions',
      'gu': '',
    },
    'ota7kyrs': {
      'en': 'Edit Profile',
      'gu': '',
    },
    'nubbuv6q': {
      'en': 'View Blood Donars',
      'gu': '',
    },
    'c0nuna5n': {
      'en': 'Terms of Service',
      'gu': '',
    },
    'ccn21n4v': {
      'en': 'Change Password',
      'gu': '',
    },
    'oydiju2f': {
      'en': 'Settings',
      'gu': '',
    },
    'ulbgp15y': {
      'en': 'Home',
      'gu': '',
    },
  },
  // Users
  {
    'qwazeevy': {
      'en': 'Search by Name...',
      'gu': '',
    },
    'ypdu5t0a': {
      'en': 'View',
      'gu': '',
    },
    '7ff42jtv': {
      'en': 'All Members',
      'gu': '',
    },
    '8vyurbsn': {
      'en': 'Members',
      'gu': '',
    },
  },
  // SingleBusinessInfo
  {
    't27h5mbf': {
      'en': 'Business Info',
      'gu': '',
    },
    '0piqxnpc': {
      'en': 'Name: ',
      'gu': '',
    },
    '9c92ho4q': {
      'en': 'State',
      'gu': '',
    },
    'ljkfaagj': {
      'en': 'Pincode',
      'gu': '',
    },
    'czy8g6zo': {
      'en': 'Home',
      'gu': '',
    },
  },
  // SingleProfessionInfo
  {
    '6klhrsxr': {
      'en': 'Profession Info',
      'gu': '',
    },
    'mjzq05w6': {
      'en': 'Profession Name',
      'gu': '',
    },
    '2g029m89': {
      'en': 'State',
      'gu': '',
    },
    '47pi0c85': {
      'en': 'Pincode',
      'gu': '',
    },
    'bajlea72': {
      'en': 'Personal Info',
      'gu': '',
    },
    'h70pfwhg': {
      'en': 'Contact',
      'gu': '',
    },
    '900gd6dj': {
      'en': 'Home',
      'gu': '',
    },
  },
  // MyBusinessList
  {
    'zv0l2r15': {
      'en': 'My Business / Profession ',
      'gu': '',
    },
    '91wzq9jj': {
      'en': 'Home',
      'gu': '',
    },
  },
  // MyProfessionList
  {
    'obz94tox': {
      'en': 'My Profession Lists',
      'gu': '',
    },
    'zfc84tlq': {
      'en': 'Home',
      'gu': '',
    },
  },
  // Login
  {
    'rqa19gsc': {
      'en': 'Login',
      'gu': '',
    },
    'k838x62o': {
      'en': 'Enter Your Email',
      'gu': '',
    },
    'kugny491': {
      'en': '',
      'gu': '',
    },
    'h14tpvqv': {
      'en': 'Enter Your Password',
      'gu': '',
    },
    'kem46t8u': {
      'en': '',
      'gu': '',
    },
    's0nv4n22': {
      'en': 'Log in',
      'gu': '',
    },
    'oc2en5mm': {
      'en': 'Field is required',
      'gu': '',
    },
    'pwpfeqma': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    '7977boj8': {
      'en': 'Field is required',
      'gu': '',
    },
    'csq9txcx': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    'xdfs6u2h': {
      'en': 'Forgot Password?',
      'gu': '',
    },
    'fchzr3zs': {
      'en': 'Register Now',
      'gu': '',
    },
    'xpleu6pw': {
      'en': 'Home',
      'gu': '',
    },
  },
  // WelcomeScreen
  {
    'swald3e3': {
      'en': 'About Lodge Bharathi',
      'gu': '',
    },
    'czlnjdj8': {
      'en': 'All Members',
      'gu': '',
    },
    'bjcaidfb': {
      'en': 'Minutes',
      'gu': '',
    },
    'q3dnx79m': {
      'en': 'Summons',
      'gu': '',
    },
    'h6g7c78r': {
      'en': 'List of Past Masters',
      'gu': '',
    },
    '1bdxnu5g': {
      'en': 'Masonic Education',
      'gu': '',
    },
    '0qy7hgnb': {
      'en': 'By Laws',
      'gu': '',
    },
    's0f8qeu7': {
      'en': 'Welcome,',
      'gu': '',
    },
    'bdsygxrr': {
      'en': 'Search Members',
      'gu': '',
    },
    'qdzgha9k': {
      'en': 'View All',
      'gu': '',
    },
    'nnzpzi15': {
      'en': 'Search Members by Business',
      'gu': '',
    },
    'af2qpogz': {
      'en': 'View All Businesses',
      'gu': '',
    },
    'misrv5ny': {
      'en': 'Masonic Education',
      'gu': '',
    },
    'tliba14i': {
      'en': 'Read More',
      'gu': '',
    },
    'kvecn9v0': {
      'en': 'Home',
      'gu': '',
    },
  },
  // MemberPage
  {
    'hvu7ypjb': {
      'en': 'Email',
      'gu': '',
    },
    'yntqai5p': {
      'en': 'Phone Number',
      'gu': '',
    },
    '8cg2wr7b': {
      'en': 'Reg No',
      'gu': '',
    },
    'm9e64ov2': {
      'en': 'RGLSI ID',
      'gu': '',
    },
    '319qy0bi': {
      'en': 'Address ',
      'gu': '',
    },
    'z0vwn20o': {
      'en': 'Date of Birth',
      'gu': '',
    },
    '16sf2hlm': {
      'en': 'DOI',
      'gu': '',
    },
    'lsotxqss': {
      'en': 'DOP',
      'gu': '',
    },
    '10s4buyl': {
      'en': 'DOR',
      'gu': '',
    },
    '6iwh2ud0': {
      'en': 'Master Year ',
      'gu': '',
    },
    'wpj33j2j': {
      'en': 'R G Rank',
      'gu': '',
    },
    'guyfaena': {
      'en': 'G Rank',
      'gu': '',
    },
    'vjqy7ova': {
      'en': 'Side Degrees',
      'gu': '',
    },
    'u50ojfpx': {
      'en': 'Blood Group',
      'gu': '',
    },
    'otdy75yd': {
      'en': 'Subscription for 2024-2025',
      'gu': '',
    },
    'h4td06yb': {
      'en': 'Family Details',
      'gu': '',
    },
    'yssbcuup': {
      'en': 'Spouse Name',
      'gu': '',
    },
    'd84iqg0g': {
      'en': 'Spouse DOB',
      'gu': '',
    },
    'gk4dhzle': {
      'en': 'Spouse Blood Group',
      'gu': '',
    },
    'w4qmqgva': {
      'en': 'Date of Anniversary',
      'gu': '',
    },
    'mfwxv4s2': {
      'en': 'Children',
      'gu': '',
    },
    'pgrmopb5': {
      'en': 'Children',
      'gu': '',
    },
    'msp38c8f': {
      'en': 'Children',
      'gu': '',
    },
    'zw49ouxb': {
      'en': 'Home',
      'gu': '',
    },
  },
  // MainScreen
  {
    'sxu1kpmz': {
      'en': 'Welcome to Lodge Bharathi 161',
      'gu': '',
    },
    '99xuqd5g': {
      'en': '',
      'gu': '',
    },
    'ps8klazz': {
      'en': 'Home',
      'gu': '',
    },
  },
  // Profile17OtherUser
  {
    '557443po': {
      'en': 'Andres Freddies',
      'gu': '',
    },
    'wx0uxau0': {
      'en': 'Product Designer',
      'gu': '',
    },
    '8peyig2u': {
      'en': '@andresfreddies',
      'gu': '',
    },
    'h1e1jrik': {
      'en': 'Recent Work',
      'gu': '',
    },
    'tcnuzonb': {
      'en': 'Home',
      'gu': '',
    },
  },
  // Summonslist
  {
    'kyigbpxj': {
      'en': 'Download',
      'gu': '',
    },
    'fb52e6lr': {
      'en': ' List of Summons',
      'gu': '',
    },
    'pp5ygsp5': {
      'en': 'Summons',
      'gu': '',
    },
  },
  // Minuteslist
  {
    'gka05ucr': {
      'en': 'Download',
      'gu': '',
    },
    'qiqy2hcd': {
      'en': 'Minutes of Meetings',
      'gu': '',
    },
    'gfmse4hy': {
      'en': 'Minutes',
      'gu': '',
    },
  },
  // Masonieducation
  {
    'qb3edpzw': {
      'en': 'Masonic Education',
      'gu': '',
    },
    '3falnlne': {
      'en': 'Choose Category...',
      'gu': '',
    },
    '6zz9ozw7': {
      'en': 'Search for an item...',
      'gu': '',
    },
    'k2g7k4q3': {
      'en': 'Option 1',
      'gu': '',
    },
    'vo3tlyxv': {
      'en': 'Read More',
      'gu': '',
    },
    'u953j4hb': {
      'en': 'Title',
      'gu': '',
    },
    'j1al9gcf': {
      'en': 'Read More',
      'gu': '',
    },
    'e9pu1j5z': {
      'en': 'Title',
      'gu': '',
    },
    'qz6x5tt8': {
      'en': 'Read More',
      'gu': '',
    },
    '26bqt6qc': {
      'en': 'Title',
      'gu': '',
    },
    'kj63dkhr': {
      'en': 'Read More',
      'gu': '',
    },
    'vb2brnvx': {
      'en': 'Title',
      'gu': '',
    },
    'w9s26l7l': {
      'en': 'Read More',
      'gu': '',
    },
    'ms4y5izh': {
      'en': 'Home',
      'gu': '',
    },
  },
  // AboutLodgeBharathi
  {
    'zt5ewh0v': {
      'en': 'Lodge Bharathi Bo. 161',
      'gu': '',
    },
    '3ri196e4': {
      'en':
          'After Pondicherry merged with the Indian Union. The Bharathi Lodge No. 161 was born on Jan 31 st , 1963 in Pondicherry. It was ceremoniously consecrated on 7 th February 1964 in Freemasons Hall, Madras (now Chennai), by M.W. Grand Master of Grand Lodge of India, M.W.Bro. Bhogilal Shah., founder ruling Master was W. Bro. A.T. Kathiresan.',
      'gu': '',
    },
    'u95ywxmz': {
      'en':
          'After three meetings, including two installations in Chennai, the venue was shifted to Masonic Temple at Murungappakkam, Pondicherry and then at Ariyankuppam, Pondicherry. Installations were held in the Mairie Hall, Beach Road, Pondicherry.',
      'gu': '',
    },
    'eeldfbn3': {
      'en':
          'From 1984 to 1991 meetings were held in Cosmolitan Club, Cuddalore, and sometimes in the Judges Bungalow – residence of Cuddalore Judge R.W. Bro. Ratnaswamy. Meetings were then shifted to the residence of R.W. Bro. Dr. R.Bhaskaran in Brindavanam, Pondicherry. Few meetings were held in Hotel Mass from the year 2000 to 2002 and then in W. Bro. Probir’s office building in Eswaran Koil Street, Pondicherry.',
      'gu': '',
    },
    'y7bqd5nq': {
      'en':
          'At this juncture, active steps were taken to construct the Masonic Temple at Kumaran Nagar, Lawspet. The land was purchased in 1980 and the foundation stone laying ceremony of the Temple was conducted by late M.W. Bro. Hon’ble Justice Prakash Narain O.S.M. the Grand Master of the Grand Lodge of India in 1988. The Lodge office was accommodated in late R.W.Bro. Dr. K.P. Singh’s consultation chamber.',
      'gu': '',
    },
    '5x9ypwbd': {
      'en':
          'As a result of the unstinted efforts of the brethren, the Temple was completed in 2004 and dedicated by M.W. Bro. Arun Chintopanth, OSM, the then Grand Master of India. The Lodge is now firmly established due to the vision and support of the brethren who firmly believe that life is not to be simply life but is to be celebrated.',
      'gu': '',
    },
    'erdanwwm': {
      'en':
          'The Masonic meetings shifted to many places in the past, but the focus of the Brethren never shifted, it remained steadfast and firm.',
      'gu': '',
    },
    's1z14yz2': {
      'en':
          'Places of meetings changed but the places occupied by the Masonic movement in the hearts of the Brethren remained steady.',
      'gu': '',
    },
    'f8j3z2kx': {
      'en': 'About Lodge Bharathi',
      'gu': '',
    },
    's3mvphwf': {
      'en': 'Home',
      'gu': '',
    },
  },
  // ListofPastmasters
  {
    'j6l4d2xb': {
      'en': 'W. Bro. S. Mahadevan',
      'gu': '',
    },
    'fapziivz': {
      'en': '1964',
      'gu': '',
    },
    'ogdip9si': {
      'en': 'W. Bro. S.A.R. Chary\t',
      'gu': '',
    },
    'qi5wpfbs': {
      'en': '1964',
      'gu': '',
    },
    'wuskb3nz': {
      'en': 'W. Bro. A.C. Patel',
      'gu': '',
    },
    'dfyz92pr': {
      'en': '1964',
      'gu': '',
    },
    '8hbyrnrw': {
      'en': 'W. Bro. A.C. Shah',
      'gu': '',
    },
    'v44z2xvv': {
      'en': '1964',
      'gu': '',
    },
    'hg9vjy5f': {
      'en': 'W. Bro. C.K. Patel',
      'gu': '',
    },
    'i78klqwi': {
      'en': '1964',
      'gu': '',
    },
    'b3gl1f33': {
      'en': 'W. Bro. V.P. Raman\t',
      'gu': '',
    },
    'uskl9ka5': {
      'en': '1964',
      'gu': '',
    },
    'cr2p6fnp': {
      'en': 'W. Bro. V.P. Raman',
      'gu': '',
    },
    '8zn6zno0': {
      'en': '1964',
      'gu': '',
    },
    'p8e99xpd': {
      'en': 'W. Bro. L. Vanathaiya',
      'gu': '',
    },
    'iqax4io9': {
      'en': '1964',
      'gu': '',
    },
    'suvgtzan': {
      'en': 'W. Bro. L. Vanathaiya',
      'gu': '',
    },
    'mf47vwaa': {
      'en': '1964',
      'gu': '',
    },
    't735a1li': {
      'en': 'W. Bro. A. Arunachalam',
      'gu': '',
    },
    'ue99oddg': {
      'en': '1964',
      'gu': '',
    },
    '14iraf2q': {
      'en': 'W. Bro. Dr. S. Chauduri',
      'gu': '',
    },
    'ycb274p7': {
      'en': '1964',
      'gu': '',
    },
    '8s09mt1l': {
      'en': 'W. Bro. G. Dorairajulu',
      'gu': '',
    },
    'mu6klim3': {
      'en': '1964',
      'gu': '',
    },
    'hkta25cl': {
      'en': 'W. Bro. G. Bhaskaran',
      'gu': '',
    },
    'imfcwdtt': {
      'en': '1964',
      'gu': '',
    },
    '3k5bdxh7': {
      'en': 'Roll of Past Masters',
      'gu': '',
    },
    '0rp9bjfc': {
      'en': 'Home',
      'gu': '',
    },
  },
  // bylaws
  {
    '7q80ozy2': {
      'en': 'BYE - LAWS OF',
      'gu': '',
    },
    'ni3epplw': {
      'en': '',
      'gu': '',
    },
    'gtfhwcov': {
      'en': 'The Bharathi Lodge No. 161',
      'gu': '',
    },
    'ima0h0uc': {
      'en': ' Download Now',
      'gu': '',
    },
    '71jqzp0v': {
      'en': 'By Laws',
      'gu': '',
    },
    'r36b8ur9': {
      'en': 'Home',
      'gu': '',
    },
  },
  // SingleBlogPage
  {
    'jcmaczjw': {
      'en': 'Masonic Education',
      'gu': '',
    },
  },
  // Settings02
  {
    'vo6pible': {
      'en': 'Settings Page',
      'gu': '',
    },
    '3nexgou9': {
      'en': 'Please evaluate your options below.',
      'gu': '',
    },
    'z9s7hlyv': {
      'en': 'My Business / Profession',
      'gu': '',
    },
    '38e743c9': {
      'en': 'Edit Profile',
      'gu': '',
    },
    'w7wogqgb': {
      'en': 'Side Degrees',
      'gu': '',
    },
    '9aipp934': {
      'en': 'Change Password',
      'gu': '',
    },
    'xn2g8jhq': {
      'en': 'Home',
      'gu': '',
    },
  },
  // editSidedegrees
  {
    'c34jd21s': {
      'en': 'Side Degrees',
      'gu': '',
    },
    'ahqlyjn1': {
      'en': 'Chapter',
      'gu': '',
    },
    'txbgesjy': {
      'en': 'Add',
      'gu': '',
    },
    'l3nvxo1d': {
      'en': 'Edit',
      'gu': '',
    },
    '0rvh019a': {
      'en': 'Mark',
      'gu': '',
    },
    '4tlq2gqa': {
      'en': 'Add',
      'gu': '',
    },
    'bfxg7ktn': {
      'en': 'Edit',
      'gu': '',
    },
    'z458h6qj': {
      'en': 'RAM',
      'gu': '',
    },
    'uz8pbjx3': {
      'en': 'Add',
      'gu': '',
    },
    'igy9o3c1': {
      'en': 'Edit',
      'gu': '',
    },
    'h5l5llwj': {
      'en': 'Conclave',
      'gu': '',
    },
    'dfensngq': {
      'en': 'Add',
      'gu': '',
    },
    '4n6sztc2': {
      'en': 'Edit',
      'gu': '',
    },
    'flr0k4xm': {
      'en': 'Home',
      'gu': '',
    },
  },
  // createchapter
  {
    '35jozkou': {
      'en': 'Choose Your Title',
      'gu': '',
    },
    'l9wzqab3': {
      'en': 'Search for an item...',
      'gu': '',
    },
    'ep26ewjs': {
      'en': 'Bro',
      'gu': '',
    },
    'cp0zlq5k': {
      'en': 'W.Bro',
      'gu': '',
    },
    'jii8k728': {
      'en': 'R.W.Bro',
      'gu': '',
    },
    'xrw6bzid': {
      'en': 'M.W.Bro',
      'gu': '',
    },
    'jp1qn09i': {
      'en': 'Member Name',
      'gu': '',
    },
    '67vjplb9': {
      'en': '',
      'gu': '',
    },
    'won94snj': {
      'en': 'Lodge Reg No',
      'gu': '',
    },
    '7zcyda2a': {
      'en': '',
      'gu': '',
    },
    'ztcmr93w': {
      'en': 'Grand Ranks',
      'gu': '',
    },
    'zkvjtdmh': {
      'en': 'Year',
      'gu': '',
    },
    '0zn714fm': {
      'en': '',
      'gu': '',
    },
    'd2ou51qr': {
      'en': '',
      'gu': '',
    },
    '7whzqgvj': {
      'en': 'Regional Grand Ranks',
      'gu': '',
    },
    '4ecl56h7': {
      'en': 'Year',
      'gu': '',
    },
    'f7f14oz4': {
      'en': '',
      'gu': '',
    },
    '8t9z86x8': {
      'en': '',
      'gu': '',
    },
    'o1k1ros0': {
      'en': 'Field is required',
      'gu': '',
    },
    'o1nizoxl': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    'c4w0yl2v': {
      'en': 'Field is required',
      'gu': '',
    },
    'vdrh0nqi': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    'pu2xxmt3': {
      'en': 'Field is required',
      'gu': '',
    },
    'vedamjb4': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    'lky9myy1': {
      'en': 'Submit',
      'gu': '',
    },
    'pm7q64fo': {
      'en': 'Chapter information',
      'gu': '',
    },
    'rig7fmpx': {
      'en': 'Home',
      'gu': '',
    },
  },
  // chapterProfile
  {
    'bgia83uy': {
      'en': 'Chapter',
      'gu': '',
    },
    'j83r0e5k': {
      'en': 'Lodge Reg No',
      'gu': '',
    },
    's73j63l2': {
      'en': 'Grand Rank',
      'gu': '',
    },
    'csd6p0y0': {
      'en': 'Year',
      'gu': '',
    },
    'dchc0n2y': {
      'en': 'Regional Grand Rank',
      'gu': '',
    },
    'rfixsaoh': {
      'en': 'Year',
      'gu': '',
    },
    '9431wnmg': {
      'en': 'Profile',
      'gu': '',
    },
  },
  // profileRAM
  {
    'f4dcqa8r': {
      'en': 'RAM',
      'gu': '',
    },
    '8rb4orh0': {
      'en': 'Lodge Reg No',
      'gu': '',
    },
    '3pckw4av': {
      'en': 'Grand Rank',
      'gu': '',
    },
    '5z4ihc34': {
      'en': 'Year',
      'gu': '',
    },
    'b1o2df8r': {
      'en': 'Regional Grand Rank',
      'gu': '',
    },
    '1hq934tm': {
      'en': 'Year',
      'gu': '',
    },
    '4x0iuy3p': {
      'en': 'Profile',
      'gu': '',
    },
  },
  // profileConclave
  {
    'udm6uiju': {
      'en': 'Conclave',
      'gu': '',
    },
    '2sbhelbj': {
      'en': 'Lodge Reg No',
      'gu': '',
    },
    'ed0ooxec': {
      'en': 'Grand Rank',
      'gu': '',
    },
    'awhs3tv7': {
      'en': 'Year',
      'gu': '',
    },
    'ti21te7b': {
      'en': 'Regional Grand Rank',
      'gu': '',
    },
    '6jj5ll1c': {
      'en': 'Year',
      'gu': '',
    },
    '24g3g77a': {
      'en': 'Profile',
      'gu': '',
    },
  },
  // profileMark
  {
    'vv11obrc': {
      'en': 'Mark',
      'gu': '',
    },
    'o40wutzj': {
      'en': 'Lodge Reg No',
      'gu': '',
    },
    'ahhm8bec': {
      'en': 'Grand Rank',
      'gu': '',
    },
    'diwrahze': {
      'en': 'Year',
      'gu': '',
    },
    'bk9e5cdp': {
      'en': 'Regional Grand Rank',
      'gu': '',
    },
    's4so37wy': {
      'en': 'Year',
      'gu': '',
    },
    'ce3kzlpv': {
      'en': 'Profile',
      'gu': '',
    },
  },
  // createRAM
  {
    'uy2ddqng': {
      'en': 'Choose Your Title',
      'gu': '',
    },
    'r1izougb': {
      'en': 'Search for an item...',
      'gu': '',
    },
    '880k8t03': {
      'en': 'Bro',
      'gu': '',
    },
    'u7y5a7gf': {
      'en': 'W.Bro',
      'gu': '',
    },
    'nkxujlar': {
      'en': 'R.W.Bro',
      'gu': '',
    },
    'qxme5ie7': {
      'en': 'M.W.Bro',
      'gu': '',
    },
    't4g3ipp5': {
      'en': 'Member Name',
      'gu': '',
    },
    'pl0ge2y9': {
      'en': '',
      'gu': '',
    },
    'f6t7wiyg': {
      'en': 'Lodge Reg No',
      'gu': '',
    },
    'ui59c45v': {
      'en': '',
      'gu': '',
    },
    'v01f3lkx': {
      'en': 'Grand Ranks',
      'gu': '',
    },
    'bngzqqva': {
      'en': 'Year',
      'gu': '',
    },
    '8ti3guvi': {
      'en': '',
      'gu': '',
    },
    'hoeivxet': {
      'en': '',
      'gu': '',
    },
    'bsijyo15': {
      'en': 'Regional Grand Ranks',
      'gu': '',
    },
    'i5pdl3qi': {
      'en': 'Year',
      'gu': '',
    },
    'rcoqm7jl': {
      'en': '',
      'gu': '',
    },
    'nhpaji8y': {
      'en': '',
      'gu': '',
    },
    'ieafmpz4': {
      'en': 'Field is required',
      'gu': '',
    },
    'lnovmdmv': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    'ac9aipcq': {
      'en': 'Field is required',
      'gu': '',
    },
    '26ykwhaj': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    '6tlhwvx7': {
      'en': 'Field is required',
      'gu': '',
    },
    'tllgz82s': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    'xzgjiglp': {
      'en': 'Submit',
      'gu': '',
    },
    '5c0ddskd': {
      'en': 'RAM information',
      'gu': '',
    },
    '1uhof3bt': {
      'en': 'Home',
      'gu': '',
    },
  },
  // createconclave
  {
    '0ytvlb74': {
      'en': 'Choose Your Title',
      'gu': '',
    },
    '5n8pi7gv': {
      'en': 'Search for an item...',
      'gu': '',
    },
    '73x4bd5e': {
      'en': 'Bro',
      'gu': '',
    },
    'ep0e1xi3': {
      'en': 'W.Bro',
      'gu': '',
    },
    'sh38x0l5': {
      'en': 'R.W.Bro',
      'gu': '',
    },
    'gasohctx': {
      'en': 'M.W.Bro',
      'gu': '',
    },
    'vt5rpsyy': {
      'en': 'Member Name',
      'gu': '',
    },
    'tnzhq898': {
      'en': '',
      'gu': '',
    },
    '1xgd1s24': {
      'en': 'Lodge Reg No',
      'gu': '',
    },
    'eflc5tzg': {
      'en': '',
      'gu': '',
    },
    'key9tkbo': {
      'en': 'Grand Ranks',
      'gu': '',
    },
    'xuih2v0s': {
      'en': 'Year',
      'gu': '',
    },
    'ffph8e9a': {
      'en': '',
      'gu': '',
    },
    'psyu4xb8': {
      'en': '',
      'gu': '',
    },
    '8b9fuet0': {
      'en': 'Regional Grand Ranks',
      'gu': '',
    },
    '1xi5c2ju': {
      'en': 'Year',
      'gu': '',
    },
    'ry3vj52m': {
      'en': '',
      'gu': '',
    },
    'cqb7joo0': {
      'en': '',
      'gu': '',
    },
    '84bbccmj': {
      'en': 'Field is required',
      'gu': '',
    },
    'mxugznr5': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    '6pbuxhgn': {
      'en': 'Field is required',
      'gu': '',
    },
    '4k4tipwo': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    '1utt1rgt': {
      'en': 'Field is required',
      'gu': '',
    },
    '5k5487uz': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    'vprbi46d': {
      'en': 'Submit',
      'gu': '',
    },
    'ye8gwwo2': {
      'en': 'Conclave  information',
      'gu': '',
    },
    'z20edxtu': {
      'en': 'Home',
      'gu': '',
    },
  },
  // createMark
  {
    '2zff7lyz': {
      'en': 'Choose Your Title',
      'gu': '',
    },
    'zye3rt5d': {
      'en': 'Search for an item...',
      'gu': '',
    },
    'roepede2': {
      'en': 'Bro',
      'gu': '',
    },
    'c910lufg': {
      'en': 'W.Bro',
      'gu': '',
    },
    'bzheml3m': {
      'en': 'R.W.Bro',
      'gu': '',
    },
    'rm5ur8po': {
      'en': 'M.W.Bro',
      'gu': '',
    },
    'clr71h7s': {
      'en': 'Member Name',
      'gu': '',
    },
    'ez7r224v': {
      'en': '',
      'gu': '',
    },
    'bbgqos6c': {
      'en': 'Lodge Reg No',
      'gu': '',
    },
    'dj20krfa': {
      'en': '',
      'gu': '',
    },
    'xtay4bhi': {
      'en': 'Grand Ranks',
      'gu': '',
    },
    'tjdyf6e6': {
      'en': 'Year',
      'gu': '',
    },
    '8xpaxcp7': {
      'en': '',
      'gu': '',
    },
    '52i7i75u': {
      'en': '',
      'gu': '',
    },
    'wavxilif': {
      'en': 'Regional Grand Ranks',
      'gu': '',
    },
    'z20dsnfh': {
      'en': 'Year',
      'gu': '',
    },
    '3yfx3r9v': {
      'en': '',
      'gu': '',
    },
    '8uryq0ak': {
      'en': '',
      'gu': '',
    },
    'bdplcf4h': {
      'en': 'Field is required',
      'gu': '',
    },
    '2vmiztcf': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    '4hte0v1g': {
      'en': 'Field is required',
      'gu': '',
    },
    'ayxegqd4': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    '865hoqan': {
      'en': 'Field is required',
      'gu': '',
    },
    '9s85xk9i': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    'u7g0ie95': {
      'en': 'Submit',
      'gu': '',
    },
    'f1grdrvc': {
      'en': 'Mark information',
      'gu': '',
    },
    'bcw9ba3o': {
      'en': 'Home',
      'gu': '',
    },
  },
  // ramList
  {
    'id73ys6r': {
      'en': 'Search by Name...',
      'gu': '',
    },
    'dscp2sa4': {
      'en': '',
      'gu': '',
    },
    'mqdfv3ki': {
      'en': '',
      'gu': '',
    },
    'cxj7zbps': {
      'en': 'View',
      'gu': '',
    },
    '9i3rzyha': {
      'en': 'A',
      'gu': '',
    },
    'xjs617jj': {
      'en': 'List Item',
      'gu': '',
    },
    'guticvlg': {
      'en': 'A',
      'gu': '',
    },
    '37ues3we': {
      'en': 'List Item',
      'gu': '',
    },
    'xfj66ci4': {
      'en': 'A',
      'gu': '',
    },
    'g96ol04l': {
      'en': 'List Item',
      'gu': '',
    },
    'vp6lxt2i': {
      'en': 'A',
      'gu': '',
    },
    'ivzdygko': {
      'en': 'List Item',
      'gu': '',
    },
    'p0g4oebh': {
      'en': 'RAM Members',
      'gu': '',
    },
    'pdpwl5x9': {
      'en': 'Home',
      'gu': '',
    },
  },
  // editchapter
  {
    '341s1q7u': {
      'en': 'Choose Your Title',
      'gu': '',
    },
    '1r5f2y2j': {
      'en': 'Search for an item...',
      'gu': '',
    },
    'uste6wlz': {
      'en': 'Bro',
      'gu': '',
    },
    '62ddx6a8': {
      'en': 'W.Bro',
      'gu': '',
    },
    'mk8m8qy3': {
      'en': 'R.W.Bro',
      'gu': '',
    },
    'fwd71649': {
      'en': 'M.W.Bro',
      'gu': '',
    },
    'ui0o9st8': {
      'en': 'Member Name',
      'gu': '',
    },
    'br4zyhld': {
      'en': '',
      'gu': '',
    },
    'juhez6bp': {
      'en': 'Lodge Reg No',
      'gu': '',
    },
    'itjzwn8d': {
      'en': '',
      'gu': '',
    },
    'uzce84y4': {
      'en': 'Grand Ranks',
      'gu': '',
    },
    'xxiio3y1': {
      'en': 'Year',
      'gu': '',
    },
    '17lj091j': {
      'en': '',
      'gu': '',
    },
    '658g08wo': {
      'en': '',
      'gu': '',
    },
    'pfo72wxu': {
      'en': 'Regional Grand Ranks',
      'gu': '',
    },
    'pbqzfq9t': {
      'en': 'Year',
      'gu': '',
    },
    'tnnj674c': {
      'en': '',
      'gu': '',
    },
    'bkjtijjz': {
      'en': '',
      'gu': '',
    },
    'ugljde7n': {
      'en': 'Field is required',
      'gu': '',
    },
    '4k4nthlo': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    '2f47gb6v': {
      'en': 'Field is required',
      'gu': '',
    },
    '3es0haq7': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    'por4cl86': {
      'en': 'Field is required',
      'gu': '',
    },
    '0sfbjvo6': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    't0hk2ff5': {
      'en': 'Submit',
      'gu': '',
    },
    '0vjvwp6a': {
      'en': 'Edit Chapter information',
      'gu': '',
    },
    'upzh2k16': {
      'en': 'Home',
      'gu': '',
    },
  },
  // editRAM
  {
    'h8vyo82m': {
      'en': 'Choose Your Title',
      'gu': '',
    },
    'u4b9n8ny': {
      'en': 'Search for an item...',
      'gu': '',
    },
    '6dov56hc': {
      'en': 'Bro',
      'gu': '',
    },
    'p5p5er21': {
      'en': 'W.Bro',
      'gu': '',
    },
    'ux9ajwfu': {
      'en': 'R.W.Bro',
      'gu': '',
    },
    'iv2gtxq3': {
      'en': 'M.W.Bro',
      'gu': '',
    },
    'qekcw8kz': {
      'en': 'Member Name',
      'gu': '',
    },
    'n7akkfb2': {
      'en': '',
      'gu': '',
    },
    'jnev5s6x': {
      'en': 'Lodge Reg No',
      'gu': '',
    },
    '2s0gyhfx': {
      'en': '',
      'gu': '',
    },
    '27h8lurs': {
      'en': 'Grand Ranks',
      'gu': '',
    },
    '4yzdajnf': {
      'en': 'Year',
      'gu': '',
    },
    'qcq3wvp2': {
      'en': '',
      'gu': '',
    },
    'olvitkcy': {
      'en': '',
      'gu': '',
    },
    '8e7u2wbg': {
      'en': 'Regional Grand Ranks',
      'gu': '',
    },
    'mllvtnml': {
      'en': 'Year',
      'gu': '',
    },
    'qsms8zza': {
      'en': '',
      'gu': '',
    },
    'u1khtyik': {
      'en': '',
      'gu': '',
    },
    'asy63a3o': {
      'en': 'Field is required',
      'gu': '',
    },
    'n3uwzber': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    '11q69v33': {
      'en': 'Field is required',
      'gu': '',
    },
    '6y6elz6v': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    'bbd1dbm4': {
      'en': 'Field is required',
      'gu': '',
    },
    'hzhuatbu': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    'xcy3minz': {
      'en': 'Submit',
      'gu': '',
    },
    '8ows9k0v': {
      'en': 'Edit RAM information',
      'gu': '',
    },
    'rnftn6rr': {
      'en': 'Home',
      'gu': '',
    },
  },
  // editconclave
  {
    'tgr113i8': {
      'en': 'Choose Your Title',
      'gu': '',
    },
    '9cg07ih1': {
      'en': 'Search for an item...',
      'gu': '',
    },
    'vm56yiln': {
      'en': 'Bro',
      'gu': '',
    },
    '1dq1yl77': {
      'en': 'W.Bro',
      'gu': '',
    },
    'vkp2ha7g': {
      'en': 'R.W.Bro',
      'gu': '',
    },
    'b72stez7': {
      'en': 'M.W.Bro',
      'gu': '',
    },
    'wmplkssm': {
      'en': 'Member Name',
      'gu': '',
    },
    'zlsexknu': {
      'en': '',
      'gu': '',
    },
    'e2m3vbnf': {
      'en': 'Lodge Reg No',
      'gu': '',
    },
    'eqopynsc': {
      'en': '',
      'gu': '',
    },
    'dhgystnt': {
      'en': 'Grand Ranks',
      'gu': '',
    },
    'eliltmrz': {
      'en': 'Year',
      'gu': '',
    },
    'tyswhmhs': {
      'en': '',
      'gu': '',
    },
    'mwkwtley': {
      'en': '',
      'gu': '',
    },
    't19eidvw': {
      'en': 'Regional Grand Ranks',
      'gu': '',
    },
    '6ref2n9z': {
      'en': 'Year',
      'gu': '',
    },
    'c5va33el': {
      'en': '',
      'gu': '',
    },
    't213h3fh': {
      'en': '',
      'gu': '',
    },
    'nwc79ynb': {
      'en': 'Field is required',
      'gu': '',
    },
    'u7i4gspv': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    '1x8gdug4': {
      'en': 'Field is required',
      'gu': '',
    },
    '8dxmt2h5': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    'r1ky9gt9': {
      'en': 'Field is required',
      'gu': '',
    },
    'x1ku6z8e': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    'ddhmypxy': {
      'en': 'Submit',
      'gu': '',
    },
    '06idsmg1': {
      'en': 'Edit Conclave information',
      'gu': '',
    },
    'ivkgteoq': {
      'en': 'Home',
      'gu': '',
    },
  },
  // editmark
  {
    'arw02o7x': {
      'en': 'Choose Your Title',
      'gu': '',
    },
    'qgoszs98': {
      'en': 'Search for an item...',
      'gu': '',
    },
    'ccqi0nx2': {
      'en': 'Bro',
      'gu': '',
    },
    'qf14t941': {
      'en': 'W.Bro',
      'gu': '',
    },
    'd8jqener': {
      'en': 'R.W.Bro',
      'gu': '',
    },
    '0o30rafo': {
      'en': 'M.W.Bro',
      'gu': '',
    },
    'm62139xi': {
      'en': 'Member Name',
      'gu': '',
    },
    'gv2vdx35': {
      'en': '',
      'gu': '',
    },
    'hn45bl8w': {
      'en': 'Lodge Reg No',
      'gu': '',
    },
    'artqb49q': {
      'en': '',
      'gu': '',
    },
    '7qbqitwc': {
      'en': 'Grand Ranks',
      'gu': '',
    },
    '3rfylw1f': {
      'en': 'Year',
      'gu': '',
    },
    'n72k712u': {
      'en': '',
      'gu': '',
    },
    'z5tnhut0': {
      'en': '',
      'gu': '',
    },
    'iy81ewdc': {
      'en': 'Regional Grand Ranks',
      'gu': '',
    },
    'y1wr26lp': {
      'en': 'Year',
      'gu': '',
    },
    '3cu64fcr': {
      'en': '',
      'gu': '',
    },
    '8nb80zcr': {
      'en': '',
      'gu': '',
    },
    'fff7ftx8': {
      'en': 'Field is required',
      'gu': '',
    },
    'f8tqok5d': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    '8wnak6aw': {
      'en': 'Field is required',
      'gu': '',
    },
    'fymk6iyh': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    'f5b99e01': {
      'en': 'Field is required',
      'gu': '',
    },
    'sh6pw0o0': {
      'en': 'Please choose an option from the dropdown',
      'gu': '',
    },
    '3mcm6tl2': {
      'en': 'Submit',
      'gu': '',
    },
    'mba7wfb6': {
      'en': ' Edit Mark information',
      'gu': '',
    },
    'n0r5x1s6': {
      'en': 'Home',
      'gu': '',
    },
  },
  // Home
  {
    'zus3irhk': {
      'en': 'Welcome,',
      'gu': '',
    },
    'fbjh8m05': {
      'en': 'Search Members',
      'gu': '',
    },
    '5iu7m2n2': {
      'en': 'View All',
      'gu': '',
    },
    'eczdp26m': {
      'en': 'Masonic Education',
      'gu': '',
    },
    'z19fzbv2': {
      'en': 'Read More',
      'gu': '',
    },
    '8m2cqtz8': {
      'en': 'About Lodge Bharathi',
      'gu': '',
    },
    'xnzhu0hg': {
      'en': 'All Members',
      'gu': '',
    },
    '9il0aozy': {
      'en': 'Minutes',
      'gu': '',
    },
    'xbum6b7m': {
      'en': 'Summons',
      'gu': '',
    },
    'y4eikedh': {
      'en': 'List of Past Masters',
      'gu': '',
    },
    '4df7n5ej': {
      'en': 'Masonic Education',
      'gu': '',
    },
    'frh4kdq5': {
      'en': 'By Laws',
      'gu': '',
    },
    'zi9rhhpw': {
      'en': 'Home',
      'gu': '',
    },
  },
  // List06UserSearch
  {
    'c3s6t5dz': {
      'en': 'Add Members',
      'gu': '',
    },
    'a3h2tztd': {
      'en': 'Search members...',
      'gu': '',
    },
    '2ulwbt8c': {
      'en': 'Members in Project',
      'gu': '',
    },
    '2s43sfqo': {
      'en': 'UserName',
      'gu': '',
    },
    '5z8hrh6c': {
      'en': 'Remove',
      'gu': '',
    },
    'pgqesc8g': {
      'en': 'UserName',
      'gu': '',
    },
    'r8vwtvpo': {
      'en': 'Remove',
      'gu': '',
    },
    'p34tjvn6': {
      'en': 'UserName',
      'gu': '',
    },
    '2h97vok5': {
      'en': 'Remove',
      'gu': '',
    },
    'utdowyc4': {
      'en': 'Add Members',
      'gu': '',
    },
    'g3inrwaf': {
      'en': 'user@domainname.com',
      'gu': '',
    },
    'ec5agky4': {
      'en': 'View',
      'gu': '',
    },
    'u7kh2979': {
      'en': 'user@domainname.com',
      'gu': '',
    },
    'v847uf5o': {
      'en': 'View',
      'gu': '',
    },
    'qd7lehyb': {
      'en': 'Username',
      'gu': '',
    },
    '4jfd57pm': {
      'en': 'user@domainname.com',
      'gu': '',
    },
    '0vup611x': {
      'en': 'View',
      'gu': '',
    },
    'h6m0mu51': {
      'en': 'Username',
      'gu': '',
    },
    'kti4e8mg': {
      'en': 'user@domainname.com',
      'gu': '',
    },
    'gzdiqhkj': {
      'en': 'View',
      'gu': '',
    },
    'jjuqujzm': {
      'en': 'user@domainname.com',
      'gu': '',
    },
    '75fnssaw': {
      'en': 'View',
      'gu': '',
    },
    '3xv5s9a9': {
      'en': 'Home',
      'gu': '',
    },
  },
  // Home2
  {
    'a46u632i': {
      'en':
          'Your account is not active yet. Please wait for the admin to approve your login.',
      'gu': '',
    },
    'io6kodv3': {
      'en': 'Members',
      'gu': '',
    },
    'ge0k1y40': {
      'en': 'Side Degrees',
      'gu': '',
    },
    'pi3d6sqp': {
      'en': 'Search Members by Business / Profession',
      'gu': '',
    },
    'keuiohli': {
      'en': 'Search Members by Blood \nGroup',
      'gu': '',
    },
    'kk8cs2si': {
      'en': 'Minutes',
      'gu': '',
    },
    'pprrsadg': {
      'en': 'Summons',
      'gu': '',
    },
    'x6nqao1h': {
      'en': 'Masonic \nEducation',
      'gu': '',
    },
    'e6xlzmgv': {
      'en': 'Photo \nGallery',
      'gu': '',
    },
    'uayduzv7': {
      'en': 'About Lodge Bharathi',
      'gu': '',
    },
    '4xwnbp0w': {
      'en': 'All Members',
      'gu': '',
    },
    'kb4gcyfy': {
      'en': 'Side Degrees',
      'gu': '',
    },
    'nhuzs7q2': {
      'en': 'Chapter',
      'gu': '',
    },
    'lopzivlo': {
      'en': 'RAM',
      'gu': '',
    },
    '5sjyx38i': {
      'en': 'Mark',
      'gu': '',
    },
    'tgas5dli': {
      'en': 'Conclave',
      'gu': '',
    },
    'opca0ukt': {
      'en': 'Minutes',
      'gu': '',
    },
    'd8l161sl': {
      'en': 'Summons',
      'gu': '',
    },
    's1uw0k51': {
      'en': 'Freemasonry',
      'gu': '',
    },
    'pp8jihg9': {
      'en': 'About Freemasonry',
      'gu': '',
    },
    '9adost7a': {
      'en': 'Grand Lodge of India',
      'gu': '',
    },
    'eyct8no8': {
      'en': 'Regional Grand Lodge of Southern India',
      'gu': '',
    },
    'm51ii09s': {
      'en': 'Masonic Education',
      'gu': '',
    },
    '3t84uw07': {
      'en': 'Others',
      'gu': '',
    },
    'p7dvre34': {
      'en': 'Bylaws',
      'gu': '',
    },
    'dskqqpu4': {
      'en': 'List of Officers',
      'gu': '',
    },
    '9zpapq38': {
      'en': 'List of Past Masters',
      'gu': '',
    },
    'ta9xsawv': {
      'en': 'Help',
      'gu': '',
    },
    '6ib3bg48': {
      'en': 'Home',
      'gu': '',
    },
  },
  // AllSideDegrees
  {
    'wlir7kmg': {
      'en': '',
      'gu': '',
    },
    'w1dubz7b': {
      'en': 'RAM',
      'gu': '',
    },
    'dnrt126y': {
      'en': 'View All Members',
      'gu': '',
    },
    'cohd3ytj': {
      'en': '',
      'gu': '',
    },
    'kz4wtv4a': {
      'en': 'Conclave',
      'gu': '',
    },
    'tdgi3hwc': {
      'en': 'View Now',
      'gu': '',
    },
    'b9244q2h': {
      'en': '',
      'gu': '',
    },
    'w81v44ko': {
      'en': 'Mark',
      'gu': '',
    },
    'dvjjmiu0': {
      'en': 'View Now',
      'gu': '',
    },
    'hu1klszm': {
      'en': '',
      'gu': '',
    },
    'inz9sp26': {
      'en': 'Chapter',
      'gu': '',
    },
    't6bwvipx': {
      'en': 'View Now',
      'gu': '',
    },
    '1qhavkvt': {
      'en': 'Side Degrees',
      'gu': '',
    },
    '824otv6k': {
      'en': 'Home',
      'gu': '',
    },
  },
  // chapterlist
  {
    '68x352ds': {
      'en': 'Search by Name...',
      'gu': '',
    },
    'a8hw4ay1': {
      'en': 'View',
      'gu': '',
    },
    'sgolh50c': {
      'en': 'A',
      'gu': '',
    },
    'xfd989l7': {
      'en': 'List Item',
      'gu': '',
    },
    'u9uekxh2': {
      'en': 'A',
      'gu': '',
    },
    '0xwawb3k': {
      'en': 'List Item',
      'gu': '',
    },
    'z0orni9o': {
      'en': 'A',
      'gu': '',
    },
    'l2266lbv': {
      'en': 'List Item',
      'gu': '',
    },
    'tixwcgeu': {
      'en': 'A',
      'gu': '',
    },
    'kixh6ax1': {
      'en': 'List Item',
      'gu': '',
    },
    'ie7jny6c': {
      'en': 'Chapter Members',
      'gu': '',
    },
    'bf1nyvkh': {
      'en': 'Home',
      'gu': '',
    },
  },
  // ConclaveList
  {
    'o0cok5ss': {
      'en': 'Search by Name...',
      'gu': '',
    },
    'wjlvq713': {
      'en': '',
      'gu': '',
    },
    'fva4cjsz': {
      'en': '',
      'gu': '',
    },
    'relllg22': {
      'en': 'View',
      'gu': '',
    },
    'rgpsj9y6': {
      'en': 'A',
      'gu': '',
    },
    's0w7rac2': {
      'en': 'List Item',
      'gu': '',
    },
    'zclwcql0': {
      'en': 'A',
      'gu': '',
    },
    '6gwxnhrd': {
      'en': 'List Item',
      'gu': '',
    },
    'gsitrrac': {
      'en': 'A',
      'gu': '',
    },
    'e8pri0vz': {
      'en': 'List Item',
      'gu': '',
    },
    't5rrdttd': {
      'en': 'A',
      'gu': '',
    },
    '8zfj0rr6': {
      'en': 'List Item',
      'gu': '',
    },
    '14s0kz3n': {
      'en': 'Conclave Members',
      'gu': '',
    },
    '0rrigwbb': {
      'en': 'Home',
      'gu': '',
    },
  },
  // markList
  {
    'd3mzgpdj': {
      'en': 'Search by Name...',
      'gu': '',
    },
    'cf159bqt': {
      'en': '',
      'gu': '',
    },
    'jck0c0nr': {
      'en': '',
      'gu': '',
    },
    'c1dja3n4': {
      'en': 'View',
      'gu': '',
    },
    'cbx6sa9g': {
      'en': 'A',
      'gu': '',
    },
    'wu7q4x0m': {
      'en': 'List Item',
      'gu': '',
    },
    'r5znq4g3': {
      'en': 'A',
      'gu': '',
    },
    'o0g0np9l': {
      'en': 'List Item',
      'gu': '',
    },
    'pew40yln': {
      'en': 'A',
      'gu': '',
    },
    'g52uwz3g': {
      'en': 'List Item',
      'gu': '',
    },
    'hr1uhdo2': {
      'en': 'A',
      'gu': '',
    },
    '9q0pb19v': {
      'en': 'List Item',
      'gu': '',
    },
    'mvtwj8ro': {
      'en': 'Mark Members',
      'gu': '',
    },
    'fyvp0a1p': {
      'en': 'Home',
      'gu': '',
    },
  },
  // Gallery
  {
    'swvad5fg': {
      'en': 'World Brotherhood Day ',
      'gu': '',
    },
    '60qfctnm': {
      'en':
          ' - First : Providing lunch to the 30 inmates of Ayush senior home, Puducherry',
      'gu': '',
    },
    'v88rllrv': {
      'en': 'World Brotherhood Day ',
      'gu': '',
    },
    'g6edb4g8': {
      'en':
          ' - Second : Donating books to poor deserving students of the physics department, Tagore arts college Puducherry.',
      'gu': '',
    },
    'efoheqj7': {
      'en': '',
      'gu': '',
    },
    'udpoaj23': {
      'en': 'Friendly visit of the ARGM on 29th June, 2024',
      'gu': '',
    },
    '3y5q2syg': {
      'en': 'Gallery',
      'gu': '',
    },
    'b3tb6wud': {
      'en': 'Home',
      'gu': '',
    },
  },
  // List14StickyHeaderList
  {
    'lqdrx9wy': {
      'en': 'Sticky Header One',
      'gu': '',
    },
    '2evbbvxu': {
      'en': 'A',
      'gu': '',
    },
    'z14a7162': {
      'en': 'List Item',
      'gu': '',
    },
    'sduucimn': {
      'en': 'A',
      'gu': '',
    },
    'hrqzq0sw': {
      'en': 'List Item',
      'gu': '',
    },
    '6cwupfaq': {
      'en': 'A',
      'gu': '',
    },
    'rxfdxc3l': {
      'en': 'List Item',
      'gu': '',
    },
    '66lsm2xa': {
      'en': 'A',
      'gu': '',
    },
    'r17n9heo': {
      'en': 'List Item',
      'gu': '',
    },
    'av5jpf0r': {
      'en': 'A',
      'gu': '',
    },
    '45s5otvc': {
      'en': 'List Item',
      'gu': '',
    },
    'd6nzp2iv': {
      'en': 'Sticky Header Two',
      'gu': '',
    },
    'mj5g1nw7': {
      'en': 'A',
      'gu': '',
    },
    'bejhwm3b': {
      'en': 'List Item',
      'gu': '',
    },
    'y9cyaijt': {
      'en': 'A',
      'gu': '',
    },
    'et81qcrj': {
      'en': 'List Item',
      'gu': '',
    },
    'z5llq113': {
      'en': 'A',
      'gu': '',
    },
    'u88y6iza': {
      'en': 'List Item',
      'gu': '',
    },
    '6csfbilp': {
      'en': 'A',
      'gu': '',
    },
    'kckrlmcb': {
      'en': 'List Item',
      'gu': '',
    },
    'hnxs54qo': {
      'en': 'A',
      'gu': '',
    },
    'hsgcxrxl': {
      'en': 'List Item',
      'gu': '',
    },
    '9dg3r3wv': {
      'en': 'Sticky Header Three',
      'gu': '',
    },
    'o0cerwih': {
      'en': 'A',
      'gu': '',
    },
    'w1jorgkk': {
      'en': 'List Item',
      'gu': '',
    },
    '7x2euwqs': {
      'en': 'A',
      'gu': '',
    },
    '5qv26qxk': {
      'en': 'List Item',
      'gu': '',
    },
    'tv6lgbd5': {
      'en': 'A',
      'gu': '',
    },
    'qbfkukll': {
      'en': 'List Item',
      'gu': '',
    },
    'ji0x4xdd': {
      'en': 'A',
      'gu': '',
    },
    '6kxundw0': {
      'en': 'List Item',
      'gu': '',
    },
    't1q2se5o': {
      'en': 'A',
      'gu': '',
    },
    '2tjax4vq': {
      'en': 'List Item',
      'gu': '',
    },
    'ov0bgoro': {
      'en': 'Sticky Header Four',
      'gu': '',
    },
    'y0uwdfb3': {
      'en': 'A',
      'gu': '',
    },
    '86pbbhv6': {
      'en': 'List Item',
      'gu': '',
    },
    'wozcmhu8': {
      'en': 'A',
      'gu': '',
    },
    '46y1i2ws': {
      'en': 'List Item',
      'gu': '',
    },
    'c6sq1edj': {
      'en': 'A',
      'gu': '',
    },
    'frvb2u24': {
      'en': 'List Item',
      'gu': '',
    },
    '2ujbwpve': {
      'en': 'A',
      'gu': '',
    },
    'cx4r2790': {
      'en': 'List Item',
      'gu': '',
    },
    '3aliq61o': {
      'en': 'A',
      'gu': '',
    },
    'cjqqy2fx': {
      'en': 'List Item',
      'gu': '',
    },
    'i1kvfj3l': {
      'en': 'A',
      'gu': '',
    },
    'vz7c3hdd': {
      'en': 'List Item',
      'gu': '',
    },
    'o3edtcwk': {
      'en': 'My Users',
      'gu': '',
    },
    'ajxffjgv': {
      'en': 'Home',
      'gu': '',
    },
  },
  // createSummons
  {
    'gee8ob16': {
      'en': 'Summons',
      'gu': '',
    },
    'j9hme21p': {
      'en': 'Fill out the form below to submit a ticket.',
      'gu': '',
    },
    'zq80ss3a': {
      'en': 'Title ',
      'gu': '',
    },
    'hmbfdlpz': {
      'en': 'Upload Document',
      'gu': '',
    },
    'fqzngo1l': {
      'en': 'Choose a Date & TIme',
      'gu': '',
    },
    'lpyntzha': {
      'en': 'Submit',
      'gu': '',
    },
    'utb0vmp1': {
      'en': 'Page Title',
      'gu': '',
    },
    'wb60xenc': {
      'en': 'Home',
      'gu': '',
    },
  },
  // SingleBlogPageCopy
  {
    '1cbjazt6': {
      'en': 'Masonic Education',
      'gu': '',
    },
    'rkq10jgt': {
      'en': 'LEADERSHIP',
      'gu': '',
    },
    '167bqg1b': {
      'en':
          'By R.W. Bro. Barry Snider                                                                                                               \n *WORSHIPFUL MASTER THE LODGE IS IN YOUR HANDS* \n\nWe hear at every Installation that the new Worshipful Master is in charge. He is the ONE and at that time very lonely. Is he prepared? Does he really know what is needed and expected of him? \n\nLeadership is the key for Masonry to once again become a preeminent, viable, and growing fraternity. We need leaders who innovate, focus on people, inspire trust and have an eye on the future. Only such leaders will assure Masonry and Freemasons make a difference in the world. These leaders must work co-operatively for the common good of the Masonic Fraternity. The Brethren in the Lodge expect leadership and can get annoyed if they do not get it. They want someone who can preside at the meeting, explain an issue without taking sides, talk about Masonry with conviction and plan how the year will unfold. We examine the Master-Elect, but do we mentor him in leadership? Leadership is a skill that can be learned. We must endeavour to teach our new Officers so that when the W. Master does get to the East it will not be as the loneliest member. \n\nThere are many with leadership skills, but true leadership today is much more difficult than it once was. Corporations, government, cities, churches, schools, hospitals and other institutions all seem to be sorely in need of the kind of visionary leaders that built them in the first place  leaders who were determined and confident in their sense of direction, unafraid to take risks, bold and courageous, inspiring and uplifting. \n\nThe fundamental beliefs of dignity of manhood, strength of brotherhood, and the virtue of truth must be the basic principles for a vision for our Fraternity. We all share the vision that Masonry will be a relevant, preeminent Fraternity, committed to attracting, developing, and retaining men of high quality who strive for self-improvement and the opportunity to make a difference. \n\nWe must be ready for this man through improved methods of teaching, responsive leadership, and by the examples he sees when he joins. Masons must help him recognize that the Masonic Fraternity is a relevant part of the new century and worthy of his time, his attention, his participation and his support. \n\nWhen a Brother becomes an Officer we must provide him with the opportunity and skills to become a Masonic leader who will assure that Masonry provides quality in everything it does; a leader who optimistically commit to achieve excellence and long-term success as he shares a plan to reach a vision of the preferred future; a leader who inspire Masons to achieve high performance as each responds to change; a leader who not only does things right but does the right things. \n\nBeing a leader has little to do with age, although age can bring experience and perspective. Being a leader has to do with character, commitment, faith, integrity, accountability and trust and gaining the genuine respect of those around you. \nI put forward five basic aspects or leadership skills which can serve you well in Masonic office: Planning, Promptness, Organization, Inspiration, and Encouragement. \n\nUsing all of these will result in an organization that is harmoniously run and enthusiastically attended. \n\nPlanning is the first step and provides the level beginning in each endeavour. Planning meetings sets direction and destination. Without destination we could never arrive, and, without a plan, we would not know where to go and what should be done. Planning should be for more than the next meeting. It should be for your whole term with the flexibility to change and adapt when needed. \n\nPromptness is like setting the cornerstone for the meeting. It marks the beginning and brings all the parts to that point in time. Being on time shows that you care enough to put out the effort. Your effort, in turn, encourages others to strive for timeliness. Example is a gentle teacher. Being early gives time to meet and greet your members and visitors as well as time to go over your meeting notes. \n\nOrganization: Just as every builder needs a plan or architect’s drawings, the Master needs organization: his knowledge of the correct usage of the Ritual and his ability to set and follow the agenda to get the job done efficiently. Organization ensures that important things are given priority and that all things are addressed as needed. \n\nInspiration: Giving inspiration enriches your year as a leader as well as the lives of the members. You can inspire members by giving each a job that is appropriate and meaningful to him. Recognition is the approval we all seek, and enthusiasm follows. Recognizing your members can be done by pats on the back at each meeting, positive notes in the Summons, or by presenting them with a Certificate of Appreciation or other honour. \n\nEncouragement: Lastly, encouragement causes all of us to grow to our potential and the Masonic organization, in turn, to progress toward its goal of teaching the great principles of Brotherly Love, Relief, and Truth. To encourage a Brother may be as simple as being polite in your conversations. At other times, it may mean you will have to go out of your way and do something more substantial such as providing a physical need. \n\nPlanning, Promptness, Organization, Inspiration, and Encouragement are all tools of leadership that can be used to promote the principles of Freemasonry. \n\nThe 21st century is the right time to be a Mason. It is time to do things right as we do the right things, so we once again become the preferred choice of men in our communities, attracting and retaining more youthful, community-active men as well as rekindling the interest and activity of our existing members. To do this we must have leadership not only from the W. Master but all the Brethren so that one is not the loneliest member.\n',
      'gu': '',
    },
  },
  // SummonslistCopy
  {
    'rfczir3x': {
      'en': 'Summons for the 717th Regular Meeting on 29th June, 2024.',
      'gu': '',
    },
    '8xv6r6qt': {
      'en': 'Download',
      'gu': '',
    },
    'qb0xemkd': {
      'en': ' List of Summons',
      'gu': '',
    },
    'rhx3ihi2': {
      'en': 'Summons',
      'gu': '',
    },
  },
  // MinuteslistCopy
  {
    'o0e0jv5q': {
      'en': 'Minutes of the 715th Meeting held on 27.04.2024',
      'gu': '',
    },
    '7h605qoj': {
      'en': 'Download',
      'gu': '',
    },
    '0jzvsw5q': {
      'en': 'Minutes of Meetings',
      'gu': '',
    },
    'knc9lnxl': {
      'en': 'Minutes',
      'gu': '',
    },
  },
  // about
  {
    'sag6km7w': {
      'en': 'Lodge Bharathi Bo. 161',
      'gu': '',
    },
    'tmhznzbq': {
      'en':
          'After Pondicherry merged with the Indian Union. The Bharathi Lodge No. 161 was born on Jan 31 st , 1963 in Pondicherry. It was ceremoniously consecrated on 7 th February 1964 in Freemasons Hall, Madras (now Chennai), by M.W. Grand Master of Grand Lodge of India, M.W.Bro. Bhogilal Shah., founder ruling Master was W. Bro. A.T. Kathiresan.',
      'gu': '',
    },
    'w84siemu': {
      'en':
          'After three meetings, including two installations in Chennai, the venue was shifted to Masonic Temple at Murungappakkam, Pondicherry and then at Ariyankuppam, Pondicherry. Installations were held in the Mairie Hall, Beach Road, Pondicherry.',
      'gu': '',
    },
    'en2rl1xh': {
      'en':
          'From 1984 to 1991 meetings were held in Cosmolitan Club, Cuddalore, and sometimes in the Judges Bungalow – residence of Cuddalore Judge R.W. Bro. Ratnaswamy. Meetings were then shifted to the residence of R.W. Bro. Dr. R.Bhaskaran in Brindavanam, Pondicherry. Few meetings were held in Hotel Mass from the year 2000 to 2002 and then in W. Bro. Probir’s office building in Eswaran Koil Street, Pondicherry.',
      'gu': '',
    },
    'y0c2syhb': {
      'en':
          'At this juncture, active steps were taken to construct the Masonic Temple at Kumaran Nagar, Lawspet. The land was purchased in 1980 and the foundation stone laying ceremony of the Temple was conducted by late M.W. Bro. Hon’ble Justice Prakash Narain O.S.M. the Grand Master of the Grand Lodge of India in 1988. The Lodge office was accommodated in late R.W.Bro. Dr. K.P. Singh’s consultation chamber.',
      'gu': '',
    },
    'wu08oj3y': {
      'en':
          'As a result of the unstinted efforts of the brethren, the Temple was completed in 2004 and dedicated by M.W. Bro. Arun Chintopanth, OSM, the then Grand Master of India. The Lodge is now firmly established due to the vision and support of the brethren who firmly believe that life is not to be simply life but is to be celebrated.',
      'gu': '',
    },
    'lim04i83': {
      'en':
          'The Masonic meetings shifted to many places in the past, but the focus of the Brethren never shifted, it remained steadfast and firm.',
      'gu': '',
    },
    'kkojfttr': {
      'en':
          'Places of meetings changed but the places occupied by the Masonic movement in the hearts of the Brethren remained steady.',
      'gu': '',
    },
    '2ak6h8cf': {
      'en': 'About Lodge Bharathi',
      'gu': '',
    },
    'wrm4fqsn': {
      'en': 'Home',
      'gu': '',
    },
  },
  // ListofOfficers
  {
    'v310d023': {
      'en': 'Name',
      'gu': '',
    },
    '982e5nng': {
      'en': 'Officers',
      'gu': '',
    },
    'rmu6fzfj': {
      'en': 'W. Bro. R.T. Mahesh',
      'gu': '',
    },
    '8gszs3um': {
      'en': 'W. Master',
      'gu': '',
    },
    'snpel4gu': {
      'en': 'W. Bro. Dr. Dinukumar Arthur',
      'gu': '',
    },
    '0prsn8ya': {
      'en': 'I. P. M.',
      'gu': '',
    },
    '01h4b1db': {
      'en': 'Bro. Vikram Parekh',
      'gu': '',
    },
    '43uvodkn': {
      'en': 'S. Warden',
      'gu': '',
    },
    'jf3wlvfa': {
      'en': 'Bro. Prof. Dr. Periasamy Nallasamy',
      'gu': '',
    },
    '86mtl8mg': {
      'en': 'J. Warden',
      'gu': '',
    },
    'izsgojqp': {
      'en': 'W. Bro. G.E. Satheesh',
      'gu': '',
    },
    'fuwyk1wh': {
      'en': 'Chaplin',
      'gu': '',
    },
    'nu77041g': {
      'en': 'W. Bro. T. Manikandan',
      'gu': '',
    },
    'gclb61hs': {
      'en': 'Treasurer',
      'gu': '',
    },
    'ek41y3qy': {
      'en': 'W. Bro. G. Gunasekar',
      'gu': '',
    },
    '476dx6ut': {
      'en': 'Secretary',
      'gu': '',
    },
    'pph4amn7': {
      'en': 'W. Bro. K. Joshi',
      'gu': '',
    },
    'ycac0l53': {
      'en': 'D of C',
      'gu': '',
    },
    'lvyvqhrv': {
      'en': 'Bro. Jerome C. Christy',
      'gu': '',
    },
    'rfegd1zh': {
      'en': 'S. Deacon',
      'gu': '',
    },
    '9d33ygbv': {
      'en': 'W. Bro. Ramesh S.',
      'gu': '',
    },
    'i1x9bt06': {
      'en': 'J. Deacon',
      'gu': '',
    },
    'muy97gxi': {
      'en': 'W. Bro. M.K. Khan',
      'gu': '',
    },
    'ogkn4h8n': {
      'en': 'Bearer of VSL',
      'gu': '',
    },
    'f1a8nptu': {
      'en': 'R.W. Bro. V. Arulappan',
      'gu': '',
    },
    'f2lx64bn': {
      'en': 'Bearer of VSL',
      'gu': '',
    },
    'hpso3flp': {
      'en': '#R.W. Bro. Probir K. Banerjee',
      'gu': '',
    },
    '6whrpwr6': {
      'en': 'Bearer of VSL',
      'gu': '',
    },
    'v0vs6wfm': {
      'en': 'W. Bro. C.K. Manoharan',
      'gu': '',
    },
    'fv3ohyxx': {
      'en': 'Bearer of VSL',
      'gu': '',
    },
    'hjd4y2s1': {
      'en': 'V.W. Bro. V. Jayaram',
      'gu': '',
    },
    '8wistwwu': {
      'en': 'Bearer of VSL',
      'gu': '',
    },
    'oo0shmp6': {
      'en': 'W. Bro. Dr. S. Ramakrishnan',
      'gu': '',
    },
    '91q68lgn': {
      'en': 'Sword Bearer',
      'gu': '',
    },
    'nyx53kxp': {
      'en': 'W. Bro. Dr. A. Govindarajan',
      'gu': '',
    },
    'kgshu3ou': {
      'en': 'Asst. Secretary',
      'gu': '',
    },
    'h34y7byo': {
      'en': 'W. Bro. P. Satish Babu',
      'gu': '',
    },
    'xxmcdihq': {
      'en': 'Asst. D of C',
      'gu': '',
    },
    'n0q3fmx2': {
      'en': 'W. Bro. Major C. Fernandoz',
      'gu': '',
    },
    'bjt6xjzw': {
      'en': 'Organist',
      'gu': '',
    },
    'yo0mlkuh': {
      'en': 'Bro. Dr. Sreevathsa K.S. Prasad',
      'gu': '',
    },
    'sezotk6b': {
      'en': 'Inner Guard',
      'gu': '',
    },
    '87j0b3pt': {
      'en': 'Bro. A. Pandyarajan',
      'gu': '',
    },
    'pvov2epb': {
      'en': 'Almoner',
      'gu': '',
    },
    '81t8ux9c': {
      'en': 'W. Bro. Soundron Prosper',
      'gu': '',
    },
    'l7xwrig5': {
      'en': 'Chief Steward',
      'gu': '',
    },
    'ruy6v9ql': {
      'en': 'Bro. Gerard Pratap de Condappa',
      'gu': '',
    },
    'z39wl19z': {
      'en': 'Steward',
      'gu': '',
    },
    'fh7e7z6z': {
      'en': 'Bro. M. Arun',
      'gu': '',
    },
    'mqkcpsur': {
      'en': 'Steward',
      'gu': '',
    },
    'zcn4s1zc': {
      'en': 'W. Bro. T. Rajarajan',
      'gu': '',
    },
    '887xkzct': {
      'en': 'Tyler',
      'gu': '',
    },
    '7jezqs4h': {
      'en': 'List of Officers',
      'gu': '',
    },
    'r599ztst': {
      'en': 'Home',
      'gu': '',
    },
  },
  // List01Transactions
  {
    'h2pr1q7e': {
      'en': 'This Month',
      'gu': '',
    },
    'bngiunf9': {
      'en': 'Walden Books',
      'gu': '',
    },
    'jnl8bvam': {
      'en': 'Feb 15, 2022',
      'gu': '',
    },
    'teduv0g2': {
      'en': '\$52.20',
      'gu': '',
    },
    't41ln9qh': {
      'en': 'TJ Maxx',
      'gu': '',
    },
    'lf9agp26': {
      'en': 'Feb 15, 2022',
      'gu': '',
    },
    'e3the8ys': {
      'en': '\$152.20',
      'gu': '',
    },
    'j8ee2mws': {
      'en': 'Nike Store',
      'gu': '',
    },
    'witnebmd': {
      'en': 'Feb 15, 2022',
      'gu': '',
    },
    'ldchtgqp': {
      'en': '\$552.20',
      'gu': '',
    },
    'tznp275h': {
      'en': 'Border Bookstore',
      'gu': '',
    },
    'vxxv0nag': {
      'en': 'Feb 15, 2022',
      'gu': '',
    },
    'm408jgim': {
      'en': '\$59.20',
      'gu': '',
    },
    'y5vwcbui': {
      'en': 'Last Month',
      'gu': '',
    },
    'ipphovbu': {
      'en': 'Walden Books',
      'gu': '',
    },
    'o1yydg76': {
      'en': 'Feb 15, 2022',
      'gu': '',
    },
    'ecqj34sx': {
      'en': '\$52.20',
      'gu': '',
    },
    'm32llupt': {
      'en': 'Border Bookstore',
      'gu': '',
    },
    '7tqi574s': {
      'en': 'Feb 15, 2022',
      'gu': '',
    },
    'wcn7aj8h': {
      'en': '\$59.20',
      'gu': '',
    },
    '8jejghh0': {
      'en': 'Order History',
      'gu': '',
    },
    'ylu6afxg': {
      'en': 'Home',
      'gu': '',
    },
  },
  // AboutFreemasonry
  {
    'bs0kx6e4': {
      'en': 'Freemasonary',
      'gu': '',
    },
    'nqflr9o6': {
      'en':
          'Freemasonry is one of the world’s oldest secular fraternal societies. It is a world-wide organisation based on the principle of the Fatherhood of God and the Brotherhood of man. It is a society of men concerned with moral and spiritual values. Its members are taught its precepts by series of ritual which follow ancient forms and use stone masons’ customs and tools and allegorical guides. It seeks to make good men better and thereby make the world a better place in which to live. Freemasonry has been in existence in the present form for nearly 280 years in the world and for over 250 years in India. There are more than 150 Grand Lodges functioning all over the world.',
      'gu': '',
    },
    'uykynp2o': {
      'en':
          'Freemasonry traces its origin from King Solomon’s times, but its real origin is lost in antiquity. Freemasonry in its present form originated in England, in 1717. It came to India, at Calcutta in 1729. Freemasonry exists in over 190 countries in the World. There are over 5 million Freemasons in the world; in India we have about 20,000 Freemasons. There are as on date, 360 Lodges in 142 locations all over India, which are the basic units for membership. Prominent Indian Freemasons include Swami Vivekananda, Moti Lal Nehru C. Rajagopalachary, Dr. Rajendra Prasad, Dr. S. Radhakrishnan, Fakhrudhin Ali Ahmed, Actor Ashok Kumar, Mansur Ali Khan Pataudi etc., as also a wide variety of a cross section of society and professionals, such as Doctors, Engineers, Industrialists, Professors, Teachers Advocates, Chartered Accountants, Business Executives, Judges, Officers of various ranks belonging to Armed Forces, Civil Service Officers etc',
      'gu': '',
    },
    'js9vpmsn': {
      'en': 'How does Masonry gets its membership',
      'gu': '',
    },
    '9cm52ql7': {
      'en':
          'Freemasonry does not canvass for members. The person must seek for membership of a Masonic Lodge of his own free will and accord. He would however, be provided all information he wishes to know. Who is eligible to become a Mason? No atheist can become a Mason. Anyone who is of good moral character and believes in the existence of Almighty God and a belief in the Supreme Being, no matter by what name He is called, or what faith the person professes, is eligible. What does Freemasonry expect from one who joins it? He must understand and appreciate its high ideals and objectives and put to actual practice its motto of “Brotherly Love, Relief and Truth”. Patriotism & Loyalty to one’s own country and the Fraternity at all times is a bounden duty. It expects that a Freemason should do unto others, as he would wish others would do unto him. Charity is the predominant characteristic of a Freemason’s heart. He is always expected to “give” to Freemasonry rather than expect to “receive” anything from it for personal benefit. That he will practice outside the Lodge those duties & virtues that he is taught inside the Lodge.',
      'gu': '',
    },
    'pbxyf9g3': {
      'en': 'Objective of Masonry',
      'gu': '',
    },
    'qlhy229l': {
      'en':
          'Motto of Freemasonry is Brotherly Love, Relief & Truth. Freemasonry seeks to make good men better. It encourages the practice of the moral virtues of Temperance, Fortitude, prudence and Justice.It inculcates obedience to God & observance of the Laws of the country. It is committed to extend the hand of fellowship & provide Relief to those in distress.',
      'gu': '',
    },
    'c50arns3': {
      'en': 'What Masonry Is Not',
      'gu': '',
    },
    'yyxwich5': {
      'en':
          'It is not a Religion, However it emphasizes secularism by teaching respect for and tolerance towards all religions. It is not a political party or organisation. It reminds them of the filial affection one should always have for the Land of their birth, to remain loyal to the laws of the land which, for the time being, may be the place of their residence, or afford them protection. It is not a secret society There is nothing secret or secretive about Freemasonry. Freemasonry does not conceal the time and place of its meeting nor does a member hide the fact of his membership. Like many other Societies it regards some of its internal affairs as private matters of concern only for its members. There is no secret about its aims & principles. Copies of its Constitutions and Rules can be obtained by interested members of the public from its offices. It is not a social club However, it provides the means of socializing among its members, which consists of a cross section of society drawn from all walks of life who meet on an equal · footing. It also involves the families of members on such social occasions.',
      'gu': '',
    },
    'i1hrwlq8': {
      'en': 'About Freemasonry',
      'gu': '',
    },
    'awf1pnc2': {
      'en': 'Home',
      'gu': '',
    },
  },
  // GrandLodgeofIndia
  {
    'ccwr502o': {
      'en': 'Regional Grand Lodge of Northern India',
      'gu': '',
    },
    'ssm3kf04': {
      'en': 'Craft Lodges',
      'gu': '',
    },
    '8z4i5ctd': {
      'en': '136',
      'gu': '',
    },
    'ghdmo99y': {
      'en': 'Chapters',
      'gu': '',
    },
    'ivfqtbl3': {
      'en': '51',
      'gu': '',
    },
    'k5xmh48y': {
      'en': 'Mark Lodges\t',
      'gu': '',
    },
    'bmvbn5k5': {
      'en': '55',
      'gu': '',
    },
    'mdxlfczd': {
      'en': 'RAM Lodges\t',
      'gu': '',
    },
    'iptw3aui': {
      'en': '46',
      'gu': '',
    },
    'j7r41hsa': {
      'en': '44 Centres I 6319 Members',
      'gu': '',
    },
    '6owt3iuk': {
      'en': 'Regional Grand Lodge of Eastern India',
      'gu': '',
    },
    'x4npcq74': {
      'en': 'Craft Lodges',
      'gu': '',
    },
    'qe6afs0f': {
      'en': '65',
      'gu': '',
    },
    '4ntjhv65': {
      'en': 'Chapters',
      'gu': '',
    },
    '188670gp': {
      'en': '18',
      'gu': '',
    },
    'uk8uv9gp': {
      'en': 'Mark Lodges\t',
      'gu': '',
    },
    '536nuyon': {
      'en': '21',
      'gu': '',
    },
    '26h3n2hl': {
      'en': 'RAM Lodges\t',
      'gu': '',
    },
    'i2asxvgk': {
      'en': '15',
      'gu': '',
    },
    'nwf26zzt': {
      'en': '24 Centres I 2178 Members',
      'gu': '',
    },
    'gncxbmv1': {
      'en': 'Regional Grand Lodge of Western India',
      'gu': '',
    },
    '477dl2ui': {
      'en': 'Craft Lodges',
      'gu': '',
    },
    'h3xyax59': {
      'en': '77',
      'gu': '',
    },
    'pp902szp': {
      'en': 'Chapters',
      'gu': '',
    },
    'kn457gi7': {
      'en': '19',
      'gu': '',
    },
    '2m7e0rlc': {
      'en': 'Mark Lodges\t',
      'gu': '',
    },
    'kptlhix4': {
      'en': '19',
      'gu': '',
    },
    'h4tfmlu0': {
      'en': 'RAM Lodges\t',
      'gu': '',
    },
    '7alg2wjp': {
      'en': '18',
      'gu': '',
    },
    'ppzip6xr': {
      'en': '22 Centres I 2880 Members',
      'gu': '',
    },
    '369pcz9p': {
      'en': 'Regional Grand Lodge of Southern India',
      'gu': '',
    },
    'zdbhxmrq': {
      'en': 'Craft Lodges',
      'gu': '',
    },
    'eedu5be2': {
      'en': '177',
      'gu': '',
    },
    '8k07uezx': {
      'en': 'Chapters',
      'gu': '',
    },
    'qtmzv6xu': {
      'en': '68',
      'gu': '',
    },
    '5mpimai4': {
      'en': 'Mark Lodges\t',
      'gu': '',
    },
    '60gt8tri': {
      'en': '76',
      'gu': '',
    },
    '0d1247o4': {
      'en': 'RAM Lodges\t',
      'gu': '',
    },
    'sv3sq2n2': {
      'en': '65',
      'gu': '',
    },
    'mbvfdsoc': {
      'en': '82 Centres I 11314 Members',
      'gu': '',
    },
    'qqitwvvf': {
      'en': 'Grand Lodge of India',
      'gu': '',
    },
    'd7swyqz0': {
      'en': 'Home',
      'gu': '',
    },
  },
  // RegionalGrandLodgeofSouthernIndia
  {
    'klnjq99l': {
      'en':
          'Freemasonry is one of the world\'s oldest secular fraternal societies. It is a world-wide organization based on the principle of the Fatherhood of God and the Brotherhood of man. It is a society of men concerned with moral and spiritual values.\n',
      'gu': '',
    },
    's08qsrck': {
      'en': 'UPCOMING EVENTS',
      'gu': '',
    },
    'gtn04lj5': {
      'en': 'Half Yearly Meeting 2024',
      'gu': '',
    },
    'ppx1yhw4': {
      'en': '21st September 2024, Goa',
      'gu': '',
    },
    '63uqmfii': {
      'en': 'Register Now!',
      'gu': '',
    },
    'yngwkkdy': {
      'en': 'RGL of Southern India',
      'gu': '',
    },
    's9x99jt0': {
      'en': 'Home',
      'gu': '',
    },
  },
  // Details01ProjectTracker
  {
    'x0bbfnai': {
      'en': '12 Projects',
      'gu': '',
    },
    'kn09hkon': {
      'en': 'View All',
      'gu': '',
    },
    'jnwrji9f': {
      'en': 'Pending',
      'gu': '',
    },
    '4knztfoz': {
      'en': 'Design Template Screens',
      'gu': '',
    },
    '7gqhe9fn': {
      'en': 'Create template screen for task todo app.',
      'gu': '',
    },
    'wnb5w8eh': {
      'en': 'Due',
      'gu': '',
    },
    'lb94syhs': {
      'en': 'Tuesday, 10:00am',
      'gu': '',
    },
    'frx4mn42': {
      'en': 'In Progress',
      'gu': '',
    },
    '2vuocdn3': {
      'en': 'Theme Collection',
      'gu': '',
    },
    'rprlag2a': {
      'en': 'Create themes for use by our users.',
      'gu': '',
    },
    'sty05xc7': {
      'en': 'Due',
      'gu': '',
    },
    'tlyqjygx': {
      'en': 'Tuesday, 10:00am',
      'gu': '',
    },
    'k7o362ru': {
      'en': 'In Progress',
      'gu': '',
    },
    'm3wfzpjm': {
      'en': 'Completed',
      'gu': '',
    },
    'ldkgei27': {
      'en': 'Design Template Screens',
      'gu': '',
    },
    '9ew0deex': {
      'en': 'Create template screen for task todo app.',
      'gu': '',
    },
    'jxvj143q': {
      'en': 'Tuesday, 10:00am',
      'gu': '',
    },
    '3z30wyp9': {
      'en': 'Completed',
      'gu': '',
    },
    'udoifuyn': {
      'en': 'Theme Collection',
      'gu': '',
    },
    'a7j0rfh7': {
      'en': 'Create themes for use by our users.',
      'gu': '',
    },
    '858l6l3j': {
      'en': 'Tuesday, 10:00am',
      'gu': '',
    },
    'vr59tgwv': {
      'en': 'Completed',
      'gu': '',
    },
    'og33aadt': {
      'en': 'No-Code Platform Design',
      'gu': '',
    },
    'g1dxgjrg': {
      'en': 'Home',
      'gu': '',
    },
  },
  // Details11EventTicket
  {
    'a7f0bh3i': {
      'en': 'FlutterFlow Meetup',
      'gu': '',
    },
    '4x0904nw': {
      'en': 'Address',
      'gu': '',
    },
    'g5v3n8w7': {
      'en': '56292 West Hollywood Blvd. Brooklyn NY 12405',
      'gu': '',
    },
    'o4cu0hqi': {
      'en': 'Event Details',
      'gu': '',
    },
    '6z3eto3c': {
      'en':
          'Don\'t miss the upcoming FlutterFlow Meetup, where enthusiasts and professionals alike will gather to exchange ideas, showcase groundbreaking projects, and experience the thrill of creating cutting-edge applications using this powerful and versatile framework.',
      'gu': '',
    },
    'ld784kxt': {
      'en': 'at',
      'gu': '',
    },
    'qz33o3go': {
      'en': 'FlutterFlow Event',
      'gu': '',
    },
    '5xa6wqet': {
      'en': '@ Brooklyn NY - Barklay Center',
      'gu': '',
    },
    '442kmsmc': {
      'en': '6:00pm',
      'gu': '',
    },
    'zj5n6rjn': {
      'en': 'November 29, 2022',
      'gu': '',
    },
    '9a64x1yl': {
      'en': 'Andrew Daniels',
      'gu': '',
    },
    '4egov3o3': {
      'en': 'Section',
      'gu': '',
    },
    'ca2v3pn1': {
      'en': '202 F',
      'gu': '',
    },
    '08e25aoq': {
      'en': 'Seat',
      'gu': '',
    },
    'da26208s': {
      'en': '19F',
      'gu': '',
    },
    'blx94hwb': {
      'en': 'Puchased',
      'gu': '',
    },
    'gl8bd9zz': {
      'en': '\$2,202',
      'gu': '',
    },
    'g9012dfw': {
      'en': 'Card ending in 4214',
      'gu': '',
    },
    '43wta23h': {
      'en': 'Home',
      'gu': '',
    },
  },
  // Help
  {
    'xg9sd6ow': {
      'en': 'Help',
      'gu': '',
    },
    'hboqau5u': {
      'en': 'Contact Developer',
      'gu': '',
    },
    'uno18m76': {
      'en': '@ Auro Creative Studio',
      'gu': '',
    },
    'jm668g9w': {
      'en':
          'We value your feedback and suggestions! Please let us know if you have any ideas, suggestions, or issues you\'d like to share.',
      'gu': '',
    },
    'clyoqaw1': {
      'en': 'Email',
      'gu': '',
    },
    '9yfo1v5m': {
      'en': 'getcreative@auroinnovations.com',
      'gu': '',
    },
    '30j5tnnb': {
      'en': 'Contact Us',
      'gu': '',
    },
    'o85d88yl': {
      'en': 'Home',
      'gu': '',
    },
  },
  // Profile07
  {
    'runenbzh': {
      'en': 'Your Account is inactive, Wait for Admin Approval',
      'gu': '',
    },
    'fi54rfng': {
      'en': 'Log Out',
      'gu': '',
    },
    'u7xe3x9k': {
      'en': 'Home',
      'gu': '',
    },
  },
  // ProfilePageCopy
  {
    '1gvj3nlc': {
      'en': 'Logout',
      'gu': '',
    },
    'chg5bm4s': {
      'en': 'Edit Profile',
      'gu': '',
    },
    'a9lse9qc': {
      'en': 'Help Center',
      'gu': '',
    },
    '590tmiev': {
      'en': 'Reg No.',
      'gu': '',
    },
    'r7phjas0': {
      'en': 'RGLSI Id',
      'gu': '',
    },
    '7n6u1aeu': {
      'en': 'Address ',
      'gu': '',
    },
    'f7743dlg': {
      'en': 'Date of Birth',
      'gu': '',
    },
    'jquurm0i': {
      'en': 'DOI',
      'gu': '',
    },
    'xcv1jq0w': {
      'en': 'DOP',
      'gu': '',
    },
    'h5pbreeq': {
      'en': 'DOR',
      'gu': '',
    },
    'hcoj92hw': {
      'en': 'Master Year ',
      'gu': '',
    },
    'tqnmoamn': {
      'en': 'R G Rank',
      'gu': '',
    },
    '97tr231s': {
      'en': 'G Rank',
      'gu': '',
    },
    'xi6dll0g': {
      'en': 'Side Degrees',
      'gu': '',
    },
    'e0vw3jpc': {
      'en': 'Blood Group',
      'gu': '',
    },
    'it3ievdj': {
      'en': 'Subscribed Member  ',
      'gu': '',
    },
    '59dy51go': {
      'en': 'Paid',
      'gu': '',
    },
    'z2xu9ub3': {
      'en': 'Non-Subscribed User',
      'gu': '',
    },
    '4ki2jbvz': {
      'en': 'Not Paid',
      'gu': '',
    },
    'xiyqlbb7': {
      'en': 'Family Details',
      'gu': '',
    },
    '32kqm53x': {
      'en': 'Spouse Name',
      'gu': '',
    },
    'ez1xvz5r': {
      'en': 'Spouse DOB',
      'gu': '',
    },
    'xg4fayln': {
      'en': 'Spouse Blood Group',
      'gu': '',
    },
    'mstpf51a': {
      'en': 'Date of Anniversary',
      'gu': '',
    },
    'pe2u73px': {
      'en': 'Children',
      'gu': '',
    },
    'ul9rogp4': {
      'en': 'Children',
      'gu': '',
    },
    'd3nl0gps': {
      'en': 'Children',
      'gu': '',
    },
    '78y3sscb': {
      'en': 'Profile',
      'gu': '',
    },
  },
  // Accommodations
  {
    'd3wmgxkw': {
      'en': 'DETAILS',
      'gu': '',
    },
    'pvzo4m61': {
      'en': 'Airbnb',
      'gu': '',
    },
    'yjh0ek08': {
      'en': 'Fontaine-de-Vaucluse',
      'gu': '',
    },
    'n95r2880': {
      'en': 'July 15-22',
      'gu': '',
    },
    'tl8q522r': {
      'en': '2023',
      'gu': '',
    },
    'o4f5f9v0': {
      'en': 'Guests',
      'gu': '',
    },
    '79m32c4i': {
      'en': '+7',
      'gu': '',
    },
    '66e1obyw': {
      'en': 'Check-in',
      'gu': '',
    },
    'lijzjtry': {
      'en': '3:00 pm',
      'gu': '',
    },
    '7otm2tzo': {
      'en': '3:00 pm',
      'gu': '',
    },
    'vosbzu2j': {
      'en': 'Check-out',
      'gu': '',
    },
    'clo5ta9b': {
      'en': '11:00 am',
      'gu': '',
    },
  },
  // NoMembersfound
  {
    '5c5hj3ye': {
      'en': 'No Members Found',
      'gu': '',
    },
  },
  // NoBusinessefound
  {
    'gsia0mjw': {
      'en': 'No Businesses Found',
      'gu': '',
    },
  },
  // NoProfessionsFound
  {
    'b4bhmhe5': {
      'en': 'No Professions Found',
      'gu': '',
    },
  },
  // NoDonarsfound
  {
    'a2xcfx56': {
      'en': 'No Donors  Found',
      'gu': '',
    },
  },
  // Card12Project
  {
    '830ozbux': {
      'en': 'No-Code Platform Design',
      'gu': '',
    },
    'ze4zyol0': {
      'en': '12 Projects',
      'gu': '',
    },
    'we36mas8': {
      'en': '30%',
      'gu': '',
    },
  },
  // ChangePhoto_business
  {
    '13q81ess': {
      'en': 'Change Photo',
      'gu': '',
    },
    '1cw58g5v': {
      'en':
          'Upload a new photo below in order to change your avatar seen by others.',
      'gu': '',
    },
    '0qguw3xc': {
      'en': 'Upload Image',
      'gu': '',
    },
    '41cqjx8b': {
      'en': 'Save Changes',
      'gu': '',
    },
  },
  // ChangePhoto_profession
  {
    'nafsrodj': {
      'en': 'Change Photo',
      'gu': '',
    },
    'gqdb76q4': {
      'en':
          'Upload a new photo below in order to change your avatar seen by others.',
      'gu': '',
    },
    'ytdoysyd': {
      'en': 'Upload Image',
      'gu': '',
    },
    '9x05et1q': {
      'en': 'Save Changes',
      'gu': '',
    },
  },
  // ChangePhoto_profile
  {
    'pjbiwpv6': {
      'en': 'Change Photo',
      'gu': '',
    },
    '1wlmnfos': {
      'en':
          'Upload a new photo below in order to change your avatar seen by others.',
      'gu': '',
    },
    '76kgt6s6': {
      'en': 'Upload Image',
      'gu': '',
    },
    'rwjn9dgc': {
      'en': 'Save Changes',
      'gu': '',
    },
  },
  // Sidedegrees
  {
    'mkc50ek6': {
      'en': 'Side Degrees',
      'gu': '',
    },
    '8r9snu3p': {
      'en': 'CHAPTER',
      'gu': '',
    },
    'c5ge4gdg': {
      'en': 'RAM',
      'gu': '',
    },
    '10hwmfyp': {
      'en': 'MARK',
      'gu': '',
    },
    't3lumzbp': {
      'en': 'CONCLAVE',
      'gu': '',
    },
  },
  // Miscellaneous
  {
    'l6ytk006': {
      'en': '',
      'gu': '',
    },
    'w05szlqt': {
      'en': '',
      'gu': '',
    },
    'y2ojiscf': {
      'en': 'This app requires permission to view the notification',
      'gu': '',
    },
    'rez7242h': {
      'en': '',
      'gu': '',
    },
    '8bwkread': {
      'en': '',
      'gu': '',
    },
    'q37gzgn6': {
      'en': '',
      'gu': '',
    },
    'w7kasosg': {
      'en': '',
      'gu': '',
    },
    'm3b4eo1w': {
      'en': '',
      'gu': '',
    },
    'rs4n9vf0': {
      'en': '',
      'gu': '',
    },
    'qtpkpe72': {
      'en': '',
      'gu': '',
    },
    'ub2yvqph': {
      'en': '',
      'gu': '',
    },
    '670i74qt': {
      'en': '',
      'gu': '',
    },
    'n8pj39zb': {
      'en': '',
      'gu': '',
    },
    'mazxvpvf': {
      'en': '',
      'gu': '',
    },
    '0dqerx7z': {
      'en': '',
      'gu': '',
    },
    'g92u5503': {
      'en': '',
      'gu': '',
    },
    '9fk0fua9': {
      'en': '',
      'gu': '',
    },
    '15b90huf': {
      'en': '',
      'gu': '',
    },
    'ovqdoavv': {
      'en': '',
      'gu': '',
    },
    'ypwqj51a': {
      'en': '',
      'gu': '',
    },
    'ebn3m7k8': {
      'en': '',
      'gu': '',
    },
    'gupfq0fo': {
      'en': '',
      'gu': '',
    },
    'qwwkhjfm': {
      'en': '',
      'gu': '',
    },
    'ck8u0vv1': {
      'en': '',
      'gu': '',
    },
    'p861lrtj': {
      'en': '',
      'gu': '',
    },
    'duwcubcu': {
      'en': '',
      'gu': '',
    },
    '7jp89reo': {
      'en': '',
      'gu': '',
    },
    'o292osz4': {
      'en': '',
      'gu': '',
    },
  },
].reduce((a, b) => a..addAll(b));
