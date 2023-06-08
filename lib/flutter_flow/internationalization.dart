import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'vi'];

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
    String? viText = '',
  }) =>
      [enText, viText][languageIndex] ?? '';

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
  // loginPage
  {
    'kf6f2cn9': {
      'en': 'Get better, feel happier!',
      'vi': 'Thận khoẻ, sống vui!',
    },
    'wygbhemc': {
      'en': 'Login',
      'vi': 'Đăng nhập',
    },
    '9u2hww2f': {
      'en': 'Email Address',
      'vi': 'Địa chỉ email',
    },
    '7fwx6xyu': {
      'en': 'Enter your email...',
      'vi': 'Nhập email...',
    },
    'dkuwf6fz': {
      'en': 'Password',
      'vi': 'Mật khẩu',
    },
    '3gk5jzf7': {
      'en': 'Enter your password...',
      'vi': 'Nhập mật khẩu (ít nhất 6 ký tự)...',
    },
    '6xhhqmn0': {
      'en': 'Login',
      'vi': 'Đăng nhập',
    },
    'hoiy5iog': {
      'en': 'Forgot Password',
      'vi': 'Quên mật khẩu',
    },
    'zo2675du': {
      'en': 'Or use a social account to login',
      'vi': 'Hoặc sử dụng tài khoản xã hội để đăng nhập',
    },
    'khvxmays': {
      'en': 'Language',
      'vi': 'Ngôn ngữ',
    },
    '5872taho': {
      'en': 'Tiếng Việt',
      'vi': 'Tiếng Việt',
    },
    'wql7d185': {
      'en': 'English',
      'vi': 'English',
    },
    'rbggi4ds': {
      'en': '',
      'vi': '',
    },
    '5hovp62b': {
      'en': 'Search for an item...',
      'vi': '',
    },
    'xvfexpfc': {
      'en': 'Switch to Dark Mode',
      'vi': 'Chuyển sang chế độ tối',
    },
    '061lekje': {
      'en': 'Switch to Light Mode',
      'vi': 'Chuyển sang chế độ sáng',
    },
    'si1vlb0q': {
      'en': 'Register',
      'vi': 'Đăng ký',
    },
    '0vwsotxt': {
      'en': 'Email Address',
      'vi': 'Địa chỉ email',
    },
    'u2zhkcja': {
      'en': 'Enter your email...',
      'vi': 'Nhập email của bạn...',
    },
    '6i1emsk2': {
      'en': 'Password',
      'vi': 'Mật khẩu',
    },
    'mbnwgl6j': {
      'en': 'Enter your password...',
      'vi': 'Nhập mật khẩu (ít nhất 6 ký tự)...',
    },
    'sk66aamx': {
      'en': 'Confirm Password',
      'vi': 'Xác nhận mật khẩu',
    },
    'g77500pd': {
      'en': 'Enter your password...',
      'vi': 'Nhập mật khẩu (ít nhất 6 ký tự)...',
    },
    'gibd8m1g': {
      'en': 'Create Account',
      'vi': 'Tạo tài khoản mới',
    },
    '5xo9bot5': {
      'en': 'Or use a social account to login',
      'vi': 'Hoặc sử dụng tài khoản xã hội để đăng nhập',
    },
    'qymi0y2n': {
      'en': 'Language',
      'vi': 'Ngôn ngữ',
    },
    'jtc81uqg': {
      'en': 'Tiếng Việt',
      'vi': 'Tiếng Việt',
    },
    'f8151acy': {
      'en': 'English',
      'vi': 'English',
    },
    '1tm9tdw8': {
      'en': '',
      'vi': '',
    },
    'utlsfrz1': {
      'en': 'Search for an item...',
      'vi': '',
    },
    't43385tl': {
      'en': 'Switch to Dark Mode',
      'vi': 'Chuyển sang chế độ tối',
    },
    'qzrcneot': {
      'en': 'Switch to Light Mode',
      'vi': 'Chuyển sang chế độ sáng',
    },
    'x6vyoura': {
      'en': 'Home',
      'vi': 'Trang chủ',
    },
  },
  // completeProfile
  {
    '1a2m7636': {
      'en': 'Complete Profile',
      'vi': 'Bước 1. Hoàn thành hồ sơ',
    },
    'i0yd39rz': {
      'en': 'Upload a photo for us to easily identify you.',
      'vi': 'Tải ảnh avatar',
    },
    'f45t5aiy': {
      'en': 'Your Name',
      'vi': 'Tên của bạn',
    },
    'ounyhigo': {
      'en': 'i.e. Kyle John',
      'vi': 'Ví dụ. Hary ',
    },
    'vgttgz1e': {
      'en': 'Your Height',
      'vi': 'Chiều cao của bạn',
    },
    '57t248nn': {
      'en': 'i.e. 160 (cm)',
      'vi': 'ví dụ: 160 (cm)',
    },
    'he5l2fn3': {
      'en': 'Your Weight',
      'vi': 'Cân nặng của bạn',
    },
    '26vujieq': {
      'en': 'i.e. 60 (kg)',
      'vi': 'ví dụ: 60 (kg)',
    },
    'uy6udiaq': {
      'en': 'Your Age',
      'vi': 'Tuổi của bạn',
    },
    'e9dx1x36': {
      'en': 'i.e. 34',
      'vi': 'ví dụ: 34',
    },
    'c5d7u6bq': {
      'en': 'Year',
      'vi': 'Năm',
    },
    '9t50geaw': {
      'en': 'Month',
      'vi': 'Tháng',
    },
    'mr5hze9w': {
      'en': 'Please select...',
      'vi': '',
    },
    'rvqwqcig': {
      'en': 'Search for an item...',
      'vi': '',
    },
    'l8w06274': {
      'en': 'Creatinine',
      'vi': 'Creatinine',
    },
    '9hukyu70': {
      'en': 'i.e. 70 (umol/L)',
      'vi': 'Ví dụ. 70 (umol/L)',
    },
    'hukrhwoa': {
      'en': '',
      'vi': '',
    },
    '19ar53qd': {
      'en': '24 hour Fluid Output',
      'vi': 'Lượng nước tiểu 24h',
    },
    'rmu583o3': {
      'en': 'i.e. 200 (ml)',
      'vi': 'Ví dụ. 200 (ml)',
    },
    '06u4vg40': {
      'en': 'Your Status',
      'vi': 'Chọn tình trạng chạy thận (nếu có)',
    },
    'k4qz9yxt': {
      'en': 'Undisclosed',
      'vi': 'Không muốn tiết lộ',
    },
    'hmnomybq': {
      'en': 'Not on dialysis',
      'vi': 'Chưa chạy thận',
    },
    'jy676ois': {
      'en': 'Preparing for a kidney transplant',
      'vi': 'Chuẩn bị ghép thận',
    },
    '43tjyb3d': {
      'en': 'On dialysis',
      'vi': 'Đang chạy thận',
    },
    'arfs12ex': {
      'en': 'Had a kidney transplant',
      'vi': 'Đã ghép thận',
    },
    'tnt7geu3': {
      'en': 'Please select...',
      'vi': 'Chọn',
    },
    'mmoxeer0': {
      'en': 'Search for an item...',
      'vi': 'Tìm kiếm',
    },
    '16wfyi8c': {
      'en': 'Your Stage',
      'vi': 'Chọn giai đoạn bệnh thận (nếu có)',
    },
    'yg3w463k': {
      'en': 'Stage 1',
      'vi': 'Giai đoạn 1',
    },
    'ajrxsds2': {
      'en': 'Stage 2',
      'vi': 'Giai đoạn 2',
    },
    '63otkktg': {
      'en': 'Stage 3A',
      'vi': 'Giai đoạn 3A',
    },
    'rxx5suqz': {
      'en': 'Stage 3B',
      'vi': 'Giai đoạn 3B',
    },
    'faxpbca0': {
      'en': 'Stage 4',
      'vi': 'Giai đoạn 4',
    },
    'm4iwabs7': {
      'en': 'Stage 5',
      'vi': 'Giai đoạn 5',
    },
    'ae8owbmv': {
      'en': 'No kidney disease',
      'vi': 'Chưa bị bệnh thận',
    },
    'k51r900d': {
      'en': 'Please select...',
      'vi': 'Chọn',
    },
    'esjtthk4': {
      'en': 'Search for an item...',
      'vi': 'Tìm kiếm',
    },
    'xpeoj7pm': {
      'en': 'Your Birth Sex',
      'vi': 'Giới tính ',
    },
    '113p8lmv': {
      'en': 'Male',
      'vi': 'Nam giới',
    },
    '5made8we': {
      'en': 'Female',
      'vi': 'Nữ giới',
    },
    '9k5dndp6': {
      'en': 'Upload lab test paper (if available)',
      'vi': 'Tải lên giấy xét nghiệm (nếu có)',
    },
    '22n8dvez': {
      'en': 'Click to upload file',
      'vi': 'Nhấp để tải tệp lên',
    },
    '59csbupd': {
      'en': 'Next',
      'vi': 'Tiếp',
    },
    'k2wzyi2s': {
      'en': 'Next',
      'vi': 'Tiếp',
    },
    'o202cs0d': {
      'en': '* Field is required',
      'vi': '* Bắt buộc nhập',
    },
    'qtbjlqrn': {
      'en': 'Please choose an option from the dropdown',
      'vi': '',
    },
    'ewrbinhs': {
      'en': '* Field is required',
      'vi': '* Bắt buộc nhập',
    },
    'tgmefisa': {
      'en': 'Please choose an option from the dropdown',
      'vi': '',
    },
    'zsvzcw58': {
      'en': '* Field is required',
      'vi': '* Bắt buộc nhập',
    },
    'xvg5tq2s': {
      'en': 'Please choose an option from the dropdown',
      'vi': '',
    },
    '4rhq7jph': {
      'en': '* Field is required',
      'vi': '* Bắt buộc nhập',
    },
    'ig21l38o': {
      'en': 'Please choose an option from the dropdown',
      'vi': '',
    },
    'hhbkmz7r': {
      'en': '* Field is required',
      'vi': '* Bắt buộc nhập',
    },
    '0a19h67c': {
      'en': 'Please choose an option from the dropdown',
      'vi': '',
    },
    'd18zcaf6': {
      'en': '* Field is required',
      'vi': '* Bắt buộc nhập',
    },
    '2psfa81e': {
      'en': 'Please choose an option from the dropdown',
      'vi': '',
    },
    '590nzzsq': {
      'en': 'Home',
      'vi': 'Trang chủ',
    },
  },
  // homePage
  {
    '9y3nkona': {
      'en': 'Today\'s Nutrients',
      'vi': 'Thống kê dinh dưỡng hôm nay',
    },
    'pdu3oa6u': {
      'en': 'Fluids',
      'vi': 'Nước',
    },
    'jcdb289o': {
      'en': 'Phosphorus',
      'vi': 'Phốt pho',
    },
    '9s0ejfax': {
      'en': 'Protein',
      'vi': 'Đạm',
    },
    'ypgv36is': {
      'en': 'Potassium',
      'vi': 'Kali',
    },
    'oyuve3jp': {
      'en': 'Sodium',
      'vi': 'Natri',
    },
    '2db12849': {
      'en': 'Calories',
      'vi': 'Lượng Calo',
    },
    'pwlakqmk': {
      'en': 'Log a Meal',
      'vi': 'Ghi lại món ăn',
    },
    'ors9qdaw': {
      'en': 'Add Fluids',
      'vi': 'Ghi lượng nước',
    },
    'o2s9si8f': {
      'en': 'Your Medications',
      'vi': 'Thuốc của bạn',
    },
    'ttlgm9ld': {
      'en': 'Seem like you don\'t have any medications!',
      'vi': 'Có vẻ như hôm nay bạn không có lời nhắc uống thuốc nào!',
    },
    'njx932be': {
      'en': 'Add medicine reminder',
      'vi': 'Thêm lời nhắc uống thuốc',
    },
    'iulwwn9p': {
      'en': 'Upcoming Appointments',
      'vi': 'Nhắc lịch khám bệnh',
    },
    '6p2qp7ie': {
      'en': 'Sêm like you don\'t have any appointment!',
      'vi': 'Có vẻ như hôm nay bạn không có lịch khám nào!',
    },
    'cz7zbaoc': {
      'en': 'Add appointment',
      'vi': 'Thêm lịch khám',
    },
    'g9fyjlcw': {
      'en': 'Latest Lab Work',
      'vi': 'Chỉ số xét nghiệm gần nhất',
    },
    'pya9nkjz': {
      'en': 'Blood Glucose',
      'vi': 'Đường huyết',
    },
    'njnjqyrp': {
      'en': '%',
      'vi': '%',
    },
    'tsscx8ef': {
      'en': 'Blood Glucose A1C',
      'vi': 'Đường huyết A1C',
    },
    'zdyv2k6b': {
      'en': 'eGFR',
      'vi': 'eGFR',
    },
    '2cglgp06': {
      'en': 'mL/min',
      'vi': 'ml/phút',
    },
    't35jajkf': {
      'en': 'GFR',
      'vi': 'GFR',
    },
    '1zfb1ke4': {
      'en': 'Albumin',
      'vi': 'Albumin',
    },
    '3arub610': {
      'en': 'g/dL',
      'vi': 'g/dL',
    },
    'qh6bqrxf': {
      'en': 'Albumin',
      'vi': 'Albumin',
    },
    'xn2tkucy': {
      'en': 'Blood Urea Nitrogen',
      'vi': 'Ni tơ u rê máu (BUN)',
    },
    'e2olchym': {
      'en': 'mg/dL',
      'vi': 'mg/dL',
    },
    '3vc4j5kf': {
      'en': 'Blood Urea Nitrogen',
      'vi': 'Ni tơ u rê trong máu',
    },
    '4yoil16t': {
      'en': 'Seem like you don\'t have any lab test results!',
      'vi': 'Có vẻ như bạn không có chỉ số xét nghiệm gần nhất nào!',
    },
    'hvi82ccd': {
      'en': 'Add lab test results',
      'vi': 'Thêm chỉ số xét nghiệm',
    },
    'fnnev2ts': {
      'en': 'Ask KidneyAI',
      'vi': 'Hỏi KidneyAI',
    },
    'oa8ozkbe': {
      'en': 'Ask KidneyAI',
      'vi': 'Hỏi KidneyAI',
    },
    '65vc0bvz': {
      'en': 'Home',
      'vi': 'Trang chủ',
    },
  },
  // profilePage
  {
    'er4ubg0w': {
      'en': 'Switch to Dark Mode',
      'vi': 'Chuyển sang chế độ tối',
    },
    '8ozcfhu0': {
      'en': 'Switch to Light Mode',
      'vi': 'Chuyển sang chế độ sáng',
    },
    '0s3klvx9': {
      'en': 'Change Language',
      'vi': 'Chọn ngôn ngữ (Language)',
    },
    '0itygpq5': {
      'en': 'Edit Profile',
      'vi': 'Chỉnh sửa hồ sơ',
    },
    'wbnf1jb2': {
      'en': 'Edit Your Targets',
      'vi': 'Đặt mục tiêu ',
    },
    '6zsh7ogd': {
      'en': 'Send us your feedback!',
      'vi': 'Liên hệ',
    },
    'ymzfj1v8': {
      'en': 'Log Out',
      'vi': 'Đăng xuất',
    },
    'rg3ycpup': {
      'en': '•',
      'vi': '•',
    },
  },
  // editProfile
  {
    'xed5lrvh': {
      'en': 'Edit Profile',
      'vi': 'Chỉnh sửa hồ sơ',
    },
    '9jn971lw': {
      'en': 'Change Photo',
      'vi': 'Thay đổi hình ảnh',
    },
    'bst6xw7t': {
      'en': 'Your Name',
      'vi': 'Tên của bạn',
    },
    'a8esj9gk': {
      'en': '',
      'vi': '',
    },
    '46farw0v': {
      'en': 'Email Address',
      'vi': 'Địa chỉ email',
    },
    '1xq971jb': {
      'en': 'Your email',
      'vi': 'Email của bạn',
    },
    '93t0iafg': {
      'en': 'Your Weight',
      'vi': 'Cân nặng của bạn',
    },
    'e3ibldps': {
      'en': 'i.e. 60 (kg)',
      'vi': 'ví dụ: 60 (kg)',
    },
    '0jkvaqqr': {
      'en': 'Your Height',
      'vi': 'Chiều cao của bạn',
    },
    'byy5jhap': {
      'en': 'i.e. 160 (cm)',
      'vi': 'ví dụ: 160 (cm)',
    },
    'fbgmrmkv': {
      'en': 'Your Age',
      'vi': 'Tuổi của bạn',
    },
    '21t41go4': {
      'en': 'i.e. 34',
      'vi': 'ví dụ: 34',
    },
    'jvb6w3ly': {
      'en': 'Year',
      'vi': 'Năm',
    },
    '613twru1': {
      'en': 'Month',
      'vi': 'Tháng',
    },
    'a54zlbt5': {
      'en': 'Please select...',
      'vi': '',
    },
    'emv71lkd': {
      'en': 'Search for an item...',
      'vi': '',
    },
    'sp4xatou': {
      'en': 'Creatinine',
      'vi': 'Creatinine',
    },
    'q96g4yt9': {
      'en': 'i.e. 70 (umol/L)',
      'vi': 'Ví dụ. 70 (umol/L)',
    },
    'dd2vbj8j': {
      'en': '24 hour Fluid Output',
      'vi': 'Lượng nước tiểu 24h',
    },
    'bvf1qgnc': {
      'en': 'i.e. 200 (ml)',
      'vi': 'Ví dụ. 200 (ml)',
    },
    'h74j5esz': {
      'en': 'Your Status',
      'vi': 'Chọn tình trạng chạy thận (nếu có)',
    },
    '0d97wmn4': {
      'en': 'Undisclosed',
      'vi': 'Không muốn tiết lộ',
    },
    '6aeyh46v': {
      'en': 'Not on dialysis',
      'vi': 'Chưa chạy thận',
    },
    'vgkpttui': {
      'en': 'Preparing for a kidney transplant',
      'vi': 'Chuẩn bị ghép thận',
    },
    't4j89nac': {
      'en': 'On dialysis',
      'vi': 'Đang chạy thận',
    },
    'uf8v8tqt': {
      'en': 'Had a kidney transplant',
      'vi': 'Đã ghép thận',
    },
    '5wcccm74': {
      'en': 'Please select...',
      'vi': 'Chọn',
    },
    'i8ir7h2j': {
      'en': 'Search for an item...',
      'vi': 'Tìm kiếm',
    },
    '32wugtyw': {
      'en': 'Your Stage',
      'vi': 'Giai đoạn của bạn',
    },
    'b0cvrtfd': {
      'en': 'Stage 1',
      'vi': 'Giai đoạn 1',
    },
    'd768ylt1': {
      'en': 'Stage 2',
      'vi': 'Giai đoạn 2',
    },
    'p6udgun7': {
      'en': 'Stage 3A',
      'vi': 'Giai đoạn 3A',
    },
    'iov1nr7d': {
      'en': 'Stage 3B',
      'vi': 'Giai đoạn 3B',
    },
    'rc3u1j5q': {
      'en': 'Stage 4',
      'vi': 'Giai đoạn 4',
    },
    '85qnl8h4': {
      'en': 'Stage 5',
      'vi': 'Giai đoạn 5',
    },
    'pn57clzk': {
      'en': 'No kidney disease',
      'vi': 'Chưa bị bệnh thận',
    },
    'wjct92dz': {
      'en': 'Please select...',
      'vi': 'Chọn',
    },
    'lld5zidb': {
      'en': 'Search for an item...',
      'vi': 'Tìm kiếm',
    },
    '1fzebeg3': {
      'en': 'Your Birth Sex',
      'vi': 'Giới tính của bạn',
    },
    'btizm940': {
      'en': 'Male',
      'vi': 'Nam giới',
    },
    'z0n5angb': {
      'en': 'Female',
      'vi': 'Nữ giới',
    },
    '6cr0pv71': {
      'en': 'Save Changes',
      'vi': 'Lưu thay đổi',
    },
    'vord6y5e': {
      'en': 'Home',
      'vi': 'Trang chủ',
    },
  },
  // carePage
  {
    '2jd6hlsf': {
      'en': 'Care 👨‍🔬',
      'vi': 'Chăm sóc 👨‍🔬',
    },
    '3e1l9dv8': {
      'en':
          'Expand each category below to see active medications, upcoming appoinments, and key care team contacts.',
      'vi': 'Nơi đặt lịch nhắc uống thuốc, và các lịch hẹn tái khám',
    },
    'n990j908': {
      'en': 'Medications',
      'vi': 'Thuốc',
    },
    '18gethf3': {
      'en': 'This is tooltip!',
      'vi': 'Đây là chú giải công cụ!',
    },
    'yh3u8w1d': {
      'en': 'Current Medications',
      'vi': 'Lịch uống thuốc',
    },
    'x853vyw8': {
      'en': 'Current Medication',
      'vi': 'Lịch uống thuốc',
    },
    'h1m0tn4q': {
      'en': 'Add a Medication',
      'vi': 'Thêm lịch uống thuốc',
    },
    'q2nwi88h': {
      'en': 'Appointments',
      'vi': 'Các cuộc hẹn',
    },
    'esvbgmxh': {
      'en': 'This is tooltip!',
      'vi': 'Đây là chú giải công cụ!',
    },
    '2yy63275': {
      'en': 'Upcoming Appointments',
      'vi': 'Cuộc hẹn sắp tới',
    },
    'cerxdptm': {
      'en': 'Upcoming Appointment',
      'vi': 'Cuộc hẹn sắp tới',
    },
    'a9noxkfo': {
      'en': 'Add an Appointments',
      'vi': 'Thêm một cuộc hẹn',
    },
    'j2vvdlm6': {
      'en': 'Care Team',
      'vi': 'Bác sĩ',
    },
    '0l8pib0q': {
      'en': 'This is tooltip!',
      'vi': 'Đây là chú giải công cụ!',
    },
    '32vmt1k7': {
      'en': 'Your Team Members',
      'vi': 'Bác sĩ của bạn',
    },
    'c0tjk74w': {
      'en': 'Add a Member',
      'vi': 'Thêm bác sĩ',
    },
    'kkxxnb6l': {
      'en': 'Care',
      'vi': 'Chăm sóc',
    },
  },
  // chatGPT
  {
    'be62jok2': {
      'en': 'Note: ',
      'vi': 'Lưu ý: ',
    },
    'yyzq1dwi': {
      'en':
          'Kidney AI is an artificial intelligence product. The information is for reference purpose only. Please contact your doctor for medical information.',
      'vi':
          'Kidney AI là một sản phẩm trí tuệ nhân tạo. Thông tin chỉ mang tính chất tham khảo. Vui lòng liên hệ với bác sĩ của bạn để biết thông tin y tế.',
    },
    'hew4e8k3': {
      'en': 'Copy response',
      'vi': 'Sao chép phản hồi',
    },
    'k9w52upz': {
      'en': 'Select question to ask AI',
      'vi': 'Chọn câu hỏi để hỏi AI',
    },
    '2zeyophz': {
      'en':
          'What can I do to improve my quality of life while living with kidney disease?',
      'vi':
          'Tôi có thể làm gì để cải thiện chất lượng cuộc sống khi sống chung với bệnh thận?',
    },
    'xkhy6e64': {
      'en': 'How to stay positive while living with kidney disease?',
      'vi': 'Làm thế nào để sống tích cực khi sống chung với bệnh thận?',
    },
    'm2z1gdey': {
      'en': 'How is kidney disease diagnosed - what tests will I need?',
      'vi':
          'Bệnh thận được chẩn đoán như thế nào - tôi sẽ cần những xét nghiệm nào?',
    },
    'wwsvn6wq': {
      'en': 'Will I need dialysis or a kidney transplant?',
      'vi': 'Tôi có cần lọc máu hoặc ghép thận không?',
    },
    'gz6gjnmc': {
      'en': '5 recipes for renal diet',
      'vi': '5 công thức chế độ ăn uống cho thận',
    },
    's5bjnpgn': {
      'en': 'Type something...',
      'vi': 'Nhập nội dung nào đó...',
    },
    'qt82rih1': {
      'en': 'Kidney AI',
      'vi': 'Kidney AI',
    },
    'yrn375fp': {
      'en': 'Chat',
      'vi': 'Trò chuyện',
    },
  },
  // learnPage
  {
    '28kbxv8n': {
      'en': 'Share',
      'vi': 'Chia sẻ',
    },
    '4oxk9u4m': {
      'en': 'Learn',
      'vi': 'Học hỏi',
    },
  },
  // setTargetPage
  {
    'xlz2nya8': {
      'en': 'Targets 🎯',
      'vi': 'Đặt mục tiêu 🎯',
    },
    '5uffj3ge': {
      'en':
          'Set personalized targets with your care providers, or use general recommended targets for now.',
      'vi':
          'Đặt mục tiêu cho chính bản thân tại đây. Ví dụ, mỗi ngày bạn cần bao nhiêu mg Phốt pho, đạm, natri, kali..?',
    },
    'pbqzpyjb': {
      'en': 'Nutrient Targets (Daily Totals)',
      'vi': 'Các mục tiêu dinh dưỡng (Tính theo ngày)',
    },
    '8hq9syn7': {
      'en': 'Phosphorus (mg)',
      'vi': 'Phốt pho (mg)',
    },
    'u3r115wv': {
      'en': 'Recommended',
      'vi': 'Khuyến nghị',
    },
    'qsti0aew': {
      'en': '...',
      'vi': '...',
    },
    'wxg98q25': {
      'en': '700',
      'vi': '',
    },
    '4q59179e': {
      'en': 'Target',
      'vi': 'Mục tiêu',
    },
    'wrtb9hib': {
      'en': '',
      'vi': '',
    },
    'c36wj8cr': {
      'en': 'Protein (g)',
      'vi': 'Chất đạm (g)',
    },
    '46y408om': {
      'en': 'Recommended',
      'vi': 'Khuyến nghị',
    },
    'x27a8ox4': {
      'en': '...',
      'vi': '...',
    },
    'gf2fm22z': {
      'en': 'Target',
      'vi': 'Mục tiêu',
    },
    'c4cir9fh': {
      'en': '',
      'vi': '',
    },
    'iwveij70': {
      'en': 'Calories (kcal)',
      'vi': 'Lượng calo (kcal)',
    },
    '4e6cewu4': {
      'en': 'Recommended',
      'vi': 'Khuyến nghị',
    },
    'o63wti1k': {
      'en': '...',
      'vi': '...',
    },
    'gve2w4hz': {
      'en': 'Target',
      'vi': 'Mục tiêu',
    },
    '3fbzfamx': {
      'en': '',
      'vi': '',
    },
    'kfozy7qa': {
      'en': 'Potassium (mg)',
      'vi': 'Kali (mg)',
    },
    'zhixo8pt': {
      'en': 'Recommended',
      'vi': 'Khuyến nghị',
    },
    'cua4o0bf': {
      'en': '...',
      'vi': '...',
    },
    'yjblcvio': {
      'en': '2000',
      'vi': '',
    },
    'iyhjsuza': {
      'en': 'Target',
      'vi': 'Mục tiêu',
    },
    '5dng4x4h': {
      'en': '',
      'vi': '',
    },
    'bzcuhc3u': {
      'en': 'Sodium (mg)',
      'vi': 'Natri (mg)',
    },
    'lx0nfeqe': {
      'en': 'Recommended',
      'vi': 'Khuyến nghị',
    },
    'jisuntx6': {
      'en': '...',
      'vi': '...',
    },
    'z2zemime': {
      'en': '2000',
      'vi': '',
    },
    'vpmdksov': {
      'en': 'Target',
      'vi': 'Mục tiêu',
    },
    '1ols1bcw': {
      'en': '',
      'vi': '',
    },
    'vr0a5ph8': {
      'en': 'Fluid Intake (l)',
      'vi': 'Lượng nước (lít)',
    },
    'yf1ojiqm': {
      'en': 'Recommended',
      'vi': 'Khuyến nghị',
    },
    'e8im326b': {
      'en': '...',
      'vi': '...',
    },
    '9xuqx090': {
      'en': 'Target',
      'vi': 'Mục tiêu',
    },
    'wexiybi5': {
      'en': '',
      'vi': '',
    },
    '64gk82sm': {
      'en': 'Vital Targets',
      'vi': 'Các mục tiêu về chỉ số cơ thể',
    },
    'jj02io2w': {
      'en': 'Blood Pressure (mmHg)',
      'vi': 'Huyết áp mong muốn (mmHg)',
    },
    'abljitx2': {
      'en': 'Recommended',
      'vi': 'Khuyến nghị',
    },
    '18tdua4d': {
      'en': '...',
      'vi': '...',
    },
    'g4p4i7nk': {
      'en': '120',
      'vi': '',
    },
    'uh8bdxwj': {
      'en': 'Target',
      'vi': 'Mục tiêu',
    },
    'sz9jrdzk': {
      'en': '',
      'vi': '',
    },
    'qx8fgj6j': {
      'en': 'Recommended',
      'vi': 'Khuyến nghị',
    },
    'miywlur5': {
      'en': '...',
      'vi': '...',
    },
    'h1dzv5qk': {
      'en': '80',
      'vi': '',
    },
    'jqo5djlw': {
      'en': 'Target',
      'vi': 'Mục tiêu',
    },
    'z675ezyx': {
      'en': '',
      'vi': '',
    },
    'flf13i0h': {
      'en': 'Blood Glucose (mg/dL)',
      'vi': 'Đường huyết mong muốn (mg/dL)',
    },
    '7raz2vnl': {
      'en': 'Recommended',
      'vi': 'Khuyến nghị',
    },
    'z2onwto5': {
      'en': '...',
      'vi': '...',
    },
    'uenbjkdt': {
      'en': '80',
      'vi': '',
    },
    '9ngeg3te': {
      'en': 'Target',
      'vi': 'Mục tiêu',
    },
    'cfck5me9': {
      'en': '',
      'vi': '',
    },
    'az7bu7oq': {
      'en': 'Fluid Output (l)',
      'vi': 'Lượng nước tiểu mong muốn (lít)',
    },
    'ialop041': {
      'en': 'Recommended',
      'vi': 'Khuyến nghị',
    },
    'j45nagiw': {
      'en': '...',
      'vi': '...',
    },
    '0amn9tcg': {
      'en': 'Target',
      'vi': 'Mục tiêu',
    },
    'fvdnp8il': {
      'en': '',
      'vi': '',
    },
    'fwkcodf2': {
      'en': 'Lab Test Targets',
      'vi': 'Mục tiêu về chỉ số xét nghiệm',
    },
    'ljqwmq2z': {
      'en': 'Blood Glucose A1C (%)',
      'vi': 'Đường huyết A1C  mong muốn (%)',
    },
    '7x7fmgnp': {
      'en': 'Recommended',
      'vi': 'Khuyến nghị',
    },
    'seiiy7yj': {
      'en': '...',
      'vi': '...',
    },
    '024vpw2i': {
      'en': 'Target',
      'vi': 'Mục tiêu',
    },
    'idxjirnm': {
      'en': '',
      'vi': '',
    },
    'm6ptix4j': {
      'en': 'eGFR (mL/minute)',
      'vi': 'eGFR (mL/phút(',
    },
    'nj6b00ml': {
      'en': 'Recommended',
      'vi': 'Khuyến nghị',
    },
    '4lf938d5': {
      'en': '...',
      'vi': '...',
    },
    'y4yqz2i0': {
      'en': 'Target',
      'vi': 'Mục tiêu',
    },
    'dyse3mvn': {
      'en': '',
      'vi': '',
    },
    'f2xoqhsp': {
      'en': 'Albumin (g/dL)',
      'vi': 'Albumin mong muốn (g/dL)',
    },
    '8oltse75': {
      'en': 'Recommended',
      'vi': 'Khuyến nghị',
    },
    'nmtyg5ss': {
      'en': '...',
      'vi': '...',
    },
    'jh2n1z9l': {
      'en': 'Target',
      'vi': 'Mục tiêu',
    },
    'js197kpi': {
      'en': '',
      'vi': '',
    },
    '69wekrs7': {
      'en': 'Blood Urea Nitrogen (mg/dL)',
      'vi': 'Nitơ urê máu mong muốn (mg/dL)',
    },
    'cqje5kbk': {
      'en': 'Recommended',
      'vi': 'Khuyến nghị',
    },
    '6o73ajh5': {
      'en': '...',
      'vi': '...',
    },
    '1adxn9aj': {
      'en': 'Target',
      'vi': 'Mục tiêu',
    },
    'wdgnimv1': {
      'en': '',
      'vi': '',
    },
    'o52rqqa9': {
      'en': 'Save',
      'vi': 'Lưu',
    },
    'te9lc30e': {
      'en': 'Home',
      'vi': 'Trang chủ',
    },
  },
  // logMealPage
  {
    '1dyz3nmz': {
      'en': 'Skip',
      'vi': 'Bỏ qua',
    },
    'quez6del': {
      'en': 'Log Today\'s Meal',
      'vi': 'Nhật ký món ăn hôm nay',
    },
    'ovrr4i27': {
      'en': 'This is tooltip!',
      'vi': 'Hướng dẫn',
    },
    '3s6udcba': {
      'en': 'Log meal',
      'vi': 'Ghi lại món ăn',
    },
    'np5of6th': {
      'en': 'E.g. 2 pieces of chicken ',
      'vi': 'Ví dụ. 1 tô phở',
    },
    'dzdgc841': {
      'en': 'Protein: ',
      'vi': 'Chất đạm:',
    },
    'i0dsh1jg': {
      'en': 'Phosphorus: ',
      'vi': 'Phốt pho:',
    },
    '309a6gj4': {
      'en': 'Potassium: ',
      'vi': 'Kali:',
    },
    'km70df7z': {
      'en': 'Sodium: ',
      'vi': 'Natri:',
    },
    'l3oag2dj': {
      'en': 'Fluid: ',
      'vi': 'Lượng nước: ',
    },
    'uc01e1c1': {
      'en': 'Calories: ',
      'vi': 'Lượng calo: ',
    },
    'lz8aa5xx': {
      'en': 'Protein: ',
      'vi': 'Chất đạm:',
    },
    '7xnjymmm': {
      'en': 'Phosphorus: ',
      'vi': 'Phốt pho:',
    },
    'v3ekgrta': {
      'en': 'Potassium: ',
      'vi': 'Kali:',
    },
    '6fg1g8kr': {
      'en': 'Sodium: ',
      'vi': 'Natri:',
    },
    '2hcoqsdh': {
      'en': 'Fluid: ',
      'vi': 'Lượng nước: ',
    },
    'dq2rviah': {
      'en': 'Calories: ',
      'vi': 'Lượng calo: ',
    },
    'g4qa183w': {
      'en': 'Today\'s food so far',
      'vi': 'Danh sách món ăn hôm nay',
    },
    'kt2nm38n': {
      'en': 'Seems you don’t have any meals',
      'vi': 'Hôm nay bạn chưa thêm món ăn nào',
    },
    'f0g2zr4h': {
      'en': 'Add custom meal',
      'vi': 'Thêm món mới',
    },
    '59e3u5iu': {
      'en': 'Meal\'s name',
      'vi': 'Tên bữa ăn',
    },
    'j52aqxoh': {
      'en': 'Bún bò',
      'vi': '',
    },
    '2xwz95o1': {
      'en': 'Quantity',
      'vi': 'Số lượng',
    },
    '71hv0ehq': {
      'en': '1',
      'vi': '',
    },
    'qgrx8bbz': {
      'en': 'Unit',
      'vi': 'Đơn vị',
    },
    '0hglqexc': {
      'en': 'mg',
      'vi': 'gram',
    },
    'olyze2k8': {
      'en': 'mg',
      'vi': 'gram',
    },
    'lszpe4l6': {
      'en': 'cup',
      'vi': 'tách',
    },
    'oe9nadpg': {
      'en': 'bag',
      'vi': 'túi',
    },
    'pgddkiif': {
      'en': 'bowl',
      'vi': 'bát',
    },
    'cag81axg': {
      'en': 'piece',
      'vi': 'miếng',
    },
    '8hbg0vcl': {
      'en': 'portrion',
      'vi': 'khẩu phần',
    },
    'coeufvg9': {
      'en': 'Please select...',
      'vi': '',
    },
    '4qnzxz6j': {
      'en': 'Search for an item...',
      'vi': '',
    },
    'pxs46x0i': {
      'en': 'Calories',
      'vi': 'Lượng calo',
    },
    'ono3ycj3': {
      'en': '200',
      'vi': '',
    },
    '7ihytcdt': {
      'en': 'Unit',
      'vi': 'Đơn vị',
    },
    '1rkq58fg': {
      'en': 'kcal',
      'vi': 'kcal',
    },
    '73mqcjug': {
      'en': 'kcal',
      'vi': 'kcal',
    },
    '0zwqidc2': {
      'en': 'Please select...',
      'vi': '',
    },
    '6lkjdd1s': {
      'en': 'Search for an item...',
      'vi': '',
    },
    'iyh44lts': {
      'en': 'Phosphorus',
      'vi': 'Phốt pho',
    },
    'ts475j08': {
      'en': '100',
      'vi': '',
    },
    '8tdz0pi5': {
      'en': 'Unit',
      'vi': 'Đơn vị',
    },
    '9qetiox4': {
      'en': 'mg',
      'vi': 'mg',
    },
    'm5fqjhqq': {
      'en': 'mg',
      'vi': 'mg',
    },
    'dkkmkhaa': {
      'en': 'Please select...',
      'vi': '',
    },
    'cmb0f6xa': {
      'en': 'Search for an item...',
      'vi': '',
    },
    '0mnqjd2t': {
      'en': 'Protein',
      'vi': 'Chất đạm',
    },
    'y54c7vrb': {
      'en': '100',
      'vi': '',
    },
    'zbsem951': {
      'en': 'Unit',
      'vi': 'Đơn vị',
    },
    '6zitdmy9': {
      'en': 'g',
      'vi': 'mg',
    },
    'c6du7h25': {
      'en': 'g',
      'vi': 'mg',
    },
    'cd9k3lr9': {
      'en': 'Please select...',
      'vi': '',
    },
    'y8xt1y8k': {
      'en': 'Search for an item...',
      'vi': '',
    },
    'ghw9tyih': {
      'en': 'Potassium',
      'vi': 'Kali',
    },
    'rm8p0fus': {
      'en': '100',
      'vi': '',
    },
    '4gt6f7x4': {
      'en': 'Unit',
      'vi': 'Đơn vị',
    },
    'zlxqvkzi': {
      'en': 'mg',
      'vi': 'mg',
    },
    'o68mqr3y': {
      'en': 'mg',
      'vi': 'mg',
    },
    'ao8ooca5': {
      'en': 'Please select...',
      'vi': '',
    },
    'tccmeekm': {
      'en': 'Search for an item...',
      'vi': '',
    },
    '4jr45f60': {
      'en': 'Sodium',
      'vi': 'Natri',
    },
    '5ud2ujgl': {
      'en': '100',
      'vi': '',
    },
    'etx6744e': {
      'en': 'Unit',
      'vi': 'Đơn vị',
    },
    'ig3ce1mj': {
      'en': 'mg',
      'vi': 'mg',
    },
    'w4g25ugv': {
      'en': 'mg',
      'vi': 'mg',
    },
    'tkxqctza': {
      'en': 'Please select...',
      'vi': '',
    },
    '3q6psoif': {
      'en': 'Search for an item...',
      'vi': '',
    },
    'wm1gx41a': {
      'en': 'Fluid',
      'vi': 'Lượng nước',
    },
    'mh03q2ei': {
      'en': '100',
      'vi': '',
    },
    'ah93whdo': {
      'en': 'Unit',
      'vi': 'Đơn vị',
    },
    '0vz43n6k': {
      'en': 'ml',
      'vi': 'lít',
    },
    'e4p9oesl': {
      'en': 'ml',
      'vi': 'lít',
    },
    '3c248qyl': {
      'en': 'Please select...',
      'vi': '',
    },
    '6lu1w9w7': {
      'en': 'Search for an item...',
      'vi': '',
    },
    'un8nrqaa': {
      'en': 'Upload meal\'s photo',
      'vi': 'Tải ảnh bữa ăn lên',
    },
    'ehqvwqxk': {
      'en': 'Save',
      'vi': 'Lưu',
    },
    'w65e98nz': {
      'en': 'Field is required',
      'vi': 'Trường bắt buộc',
    },
    'n2aogyqp': {
      'en': 'Please choose an option from the dropdown',
      'vi': '',
    },
    'y0o06i34': {
      'en': 'Field is required',
      'vi': 'Trường bắt buộc',
    },
    'c9659lk4': {
      'en': 'Please choose an option from the dropdown',
      'vi': '',
    },
    'hpqf3r83': {
      'en': 'Field is required',
      'vi': '',
    },
    '0ytze6b8': {
      'en': 'Please choose an option from the dropdown',
      'vi': '',
    },
    'qgd08tc6': {
      'en': 'Field is required',
      'vi': 'Trường bắt buộc',
    },
    '3equ7m8c': {
      'en': 'Please choose an option from the dropdown',
      'vi': '',
    },
    '6valywdu': {
      'en': 'Field is required',
      'vi': 'Trường bắt buộc',
    },
    'mu3wuihd': {
      'en': 'Please choose an option from the dropdown',
      'vi': '',
    },
    'rqrikap5': {
      'en': 'Field is required',
      'vi': 'Trường bắt buộc',
    },
    'imp9fo8i': {
      'en': 'Please choose an option from the dropdown',
      'vi': '',
    },
    'ejyqzcxx': {
      'en': 'Field is required',
      'vi': 'Trường bắt buộc',
    },
    'k4m9dlm8': {
      'en': 'Please choose an option from the dropdown',
      'vi': '',
    },
    '9jltn5l7': {
      'en': 'Field is required',
      'vi': 'Trường bắt buộc',
    },
    '0vvv98tk': {
      'en': 'Please choose an option from the dropdown',
      'vi': '',
    },
    'ap68xz0j': {
      'en': 'Home',
      'vi': 'Trang chủ',
    },
  },
  // trackPage
  {
    '1qp1cmex': {
      'en': 'Track',
      'vi': 'Theo dõi',
    },
    '7msgdc6f': {
      'en': '📝',
      'vi': '📝',
    },
    'g11rm2f8': {
      'en':
          'Explore each category below to see history, view trends, and add new entries',
      'vi':
          'Khám phá từng danh mục bên dưới để xem lịch sử, xem xu hướng và thêm các mục mới',
    },
    'qs84ux6u': {
      'en': 'Daily Nutrient Intake',
      'vi': 'Lượng dinh dưỡng hàng ngày',
    },
    'cu3lgbvr': {
      'en': 'This is tooltip!',
      'vi': 'Đây là chú giải công cụ!',
    },
    'o65l2jau': {
      'en': 'Nutrient Tracking',
      'vi': 'Theo dõi dinh dưỡng',
    },
    'j5u5tgsr': {
      'en': 'Nutrient Tracking',
      'vi': 'Theo dõi dinh dưỡng',
    },
    'li42g1vs': {
      'en': 'Fluid Intake',
      'vi': 'Lượng nước',
    },
    'fgpoj9vf': {
      'en': 'Fluid Intake',
      'vi': 'Lượng nước',
    },
    'tmo8gvaq': {
      'en': 'Add a Meal',
      'vi': 'Thêm món ăn',
    },
    'x42fy118': {
      'en': 'Lab Test Results ',
      'vi': 'Lưu trữ kết quả xét nghiệm',
    },
    '4pejn85a': {
      'en': 'This is tooltip!',
      'vi': 'Đây là chú giải công cụ!',
    },
    'buntcde8': {
      'en': 'Seems you don’t have any lab test result photo',
      'vi': 'Có vẻ như bạn không có bất kỳ bức ảnh kết quả xét nghiệm nào',
    },
    '2xi1l8tk': {
      'en': 'Add a Lab Result Photo',
      'vi': 'Thêm ảnh kết quả xét nghiệm',
    },
    'h3bu1bo1': {
      'en': 'Vital Readings',
      'vi': 'Chỉ số quan trọng',
    },
    'owq21kp1': {
      'en': 'This is tooltip!',
      'vi': 'Đây là chú giải công cụ!',
    },
    'ocbk5fg8': {
      'en': 'Fluid Output',
      'vi': 'Lượng nước tiểu',
    },
    '1h094oll': {
      'en': 'Fluid Output',
      'vi': 'Nước tiểu',
    },
    'kmc3v9dw': {
      'en': 'Blood Pressure',
      'vi': 'Huyết áp',
    },
    '58ox2b7v': {
      'en': 'Blood Pressure',
      'vi': 'Huyết áp',
    },
    'wcuv26hh': {
      'en': 'Blood Glucose',
      'vi': 'Đường huyết',
    },
    'apqbpejd': {
      'en': 'Blood Glucose',
      'vi': 'Đường huyết',
    },
    'thj3zcz3': {
      'en': 'Add a Vitals Entry',
      'vi': 'Ghi lại các chỉ số quan trọng',
    },
    'rbe92whr': {
      'en': 'Lab Test Results',
      'vi': 'Kết quả xét nghiệm',
    },
    'ghev8ccw': {
      'en': 'This is tooltip!',
      'vi': 'Đây là chú giải công cụ!',
    },
    'uvyjv2t1': {
      'en': 'Blood Glucose (A1C)',
      'vi': 'Đường huyết (A1C)',
    },
    'qjrgg185': {
      'en': 'Blood Glucose (A1C)',
      'vi': 'Đường huyết (A1C)',
    },
    'yexwk1tj': {
      'en': 'eGFR',
      'vi': 'eGFR',
    },
    '2r7wmohs': {
      'en': 'GRF',
      'vi': 'GRF',
    },
    'k2wlo3lo': {
      'en': 'Albumin',
      'vi': 'Albumin',
    },
    'b173qf4o': {
      'en': 'Albumin',
      'vi': 'Albumin',
    },
    'knloy48k': {
      'en': 'Blood Urea Nitrogen',
      'vi': 'Ni tơ u rê trong máu',
    },
    '3xj9yops': {
      'en': 'Blood Urea Nitrogen',
      'vi': 'Ni tơ u rê trong máu',
    },
    '3mpifkao': {
      'en': 'Add a Lab Result',
      'vi': 'Ghi lại kết quả xét nghiệm',
    },
    'kattxxrm': {
      'en': 'Track',
      'vi': 'Theo dõi',
    },
  },
  // addLabTestResult
  {
    '8xxpz2a6': {
      'en': 'Add Lab Test Result',
      'vi': 'Thêm kết quả xét nghiệm',
    },
    'ypcosbzo': {
      'en': 'Which test results would you like to add?',
      'vi': 'Bạn muốn thêm kết quả xét nghiệm nào?',
    },
    'skh3ytie': {
      'en': 'Blood Glucose',
      'vi': 'Đường huyết',
    },
    'p40xc3c9': {
      'en': 'Albumin',
      'vi': 'Anbumin',
    },
    'ycgmhlqr': {
      'en': 'eGFR',
      'vi': 'eGFR',
    },
    'tsdtdnyh': {
      'en': 'BUN',
      'vi': 'BUN',
    },
    '09a6aix1': {
      'en': 'What was your Blood Glucose Result?',
      'vi': 'Kết quả đường huyết của bạn là bao nhiêu?',
    },
    '2obmkouw': {
      'en': 'Target:',
      'vi': 'Mục tiêu: ',
    },
    'sgeawnmo': {
      'en': '%',
      'vi': '%',
    },
    'q0e79fmb': {
      'en': 'What was your Albumin Result?',
      'vi': 'Kết quả Albumin của bạn là bao nhiêu?',
    },
    'yjvhec98': {
      'en': 'Target:',
      'vi': 'Mục tiêu: ',
    },
    'qvww593y': {
      'en': 'g/dL',
      'vi': 'g/dL',
    },
    '506rgtp7': {
      'en': 'What was your GFR Result?',
      'vi': 'Kết quả GFR của bạn là gì?',
    },
    'yair6z2i': {
      'en': 'Target:',
      'vi': 'Mục tiêu: ',
    },
    '6pe86jjv': {
      'en': 'ml/min',
      'vi': 'ml/phút',
    },
    'bfomdmok': {
      'en': 'What was your BUN Result?',
      'vi': 'Kết quả Nitơ u rê máu của bạn là bao nhiêu?',
    },
    'ub2wzfsh': {
      'en': 'Target:',
      'vi': 'Mục tiêu: ',
    },
    '204qzfsd': {
      'en': 'mg/dL',
      'vi': 'mg/dL',
    },
    'odj85x81': {
      'en': 'SAVE',
      'vi': 'LƯU',
    },
    'p3a7i8qq': {
      'en': 'Home',
      'vi': 'Trang chủ',
    },
  },
  // addFluidsPage
  {
    'zee6ep5q': {
      'en': 'Add Today\'s Fluids',
      'vi': 'Thêm lượng nước hôm nay',
    },
    'm2f5rto8': {
      'en': 'This is tooltip!',
      'vi': 'Đây là chú giải công cụ!',
    },
    '1ihedm3g': {
      'en': 'i.e. 250 ml',
      'vi': 'Ví dụ. 250 ml',
    },
    'x7tgxqg1': {
      'en': '* Field is required',
      'vi': '* Vui lòng nhập',
    },
    'ligxdsgl': {
      'en': 'Please choose an option from the dropdown',
      'vi': '',
    },
    'rhx2fwex': {
      'en': 'Click to add fluid',
      'vi': 'Bấm để thêm lượng nước',
    },
    'rn8uyceu': {
      'en': 'Today\'s fluid so far',
      'vi': 'Danh sách lượng nước hôm nay',
    },
    'l32zernm': {
      'en': 'Seems you don’t have any fluid',
      'vi': 'Hôm nay bạn chưa thêm lượng nước nào',
    },
    'hfy4dt25': {
      'en': 'Home',
      'vi': 'Trang chủ',
    },
  },
  // addVitalEntry
  {
    'ujhfo217': {
      'en': 'Add Vitals Entry',
      'vi': 'Thêm các chỉ số quan trọng',
    },
    'a51hucp4': {
      'en': 'Which vital entry would you like to add?',
      'vi': 'Bạn muốn thêm chỉ số nào?',
    },
    'x5af60ew': {
      'en': 'Fluid Output',
      'vi': 'Nước tiểu',
    },
    'f0y83e2c': {
      'en': 'Blood Pressure',
      'vi': 'Huyết áp',
    },
    'hkvftxsu': {
      'en': 'Blood Glucose',
      'vi': 'Đường huyết',
    },
    'e4gax94h': {
      'en': 'What was your Fluid Output Result?',
      'vi': 'Kết quả lượng nước tiểu của bạn là bao nhiêu?',
    },
    'hxsdoyd6': {
      'en': 'Target:',
      'vi': 'Mục tiêu: ',
    },
    '0we75hak': {
      'en': 'liter',
      'vi': 'lít',
    },
    'yconzbs8': {
      'en': 'What was your Blood Pressure Result?',
      'vi': 'Kết quả huyết áp của bạn là bao nhiêu?',
    },
    'h6va4ij2': {
      'en': 'Target:',
      'vi': 'Mục tiêu: ',
    },
    'dd0op2yx': {
      'en': 'mmHg',
      'vi': 'mmHg',
    },
    '68m6i1a8': {
      'en': 'What was your Blood Glucose Result?',
      'vi': 'Kết quả đường huyết của bạn là bao nhiêu?',
    },
    'wqnpdw8v': {
      'en': 'Target:',
      'vi': 'Mục tiêu: ',
    },
    'a2d8l5cb': {
      'en': 'mg/dL',
      'vi': '%',
    },
    'm6vaeh72': {
      'en': 'SAVE',
      'vi': 'LƯU',
    },
    'ags5m5jq': {
      'en': 'Home',
      'vi': 'Trang chủ',
    },
  },
  // trackNutrientPage
  {
    'b8nsaj7g': {
      'en': 'Seem like you don\'t have any meal',
      'vi': 'Có vẻ như bạn không có bất kỳ bữa ăn nào',
    },
    'bliwryew': {
      'en': 'Home',
      'vi': 'Trang chủ',
    },
  },
  // trackFluidPage
  {
    'r4pqjyy6': {
      'en': 'Seem like you don\'t have any fluid',
      'vi': 'Có vẻ như bạn không có bất kỳ lượng nước nào',
    },
    '1cc79x47': {
      'en': 'Home',
      'vi': 'Trang chủ',
    },
  },
  // trackFluidOutput
  {
    'oi5bos2a': {
      'en': 'Seem like you don\'t have any fluid output result',
      'vi': 'Có vẻ như bạn không có bất kỳ kết quả nước tiểu nào',
    },
    'cai5fskl': {
      'en': 'Home',
      'vi': 'Trang chủ',
    },
  },
  // trackBloodPressurePage
  {
    'c0e1jf2v': {
      'en': 'Seem like you don\'t have any blood pressure result',
      'vi': 'Có vẻ như bạn không có bất kỳ kết quả huyết áp nào',
    },
    'w1lp0a7h': {
      'en': 'Home',
      'vi': 'Trang chủ',
    },
  },
  // trackBloodGlucoseA1CPage
  {
    '82odyxl6': {
      'en': 'Seem like you don\'t have any blood glucose A1C result',
      'vi': 'Có vẻ như bạn không có bất kỳ kết quả đường huyết A1C nào',
    },
    'm1wvysf9': {
      'en': 'Home',
      'vi': 'Trang chủ',
    },
  },
  // trackGRFPage
  {
    '3ps5qymm': {
      'en': 'Seem like you don\'t have any GFR result',
      'vi': 'Có vẻ như bạn không có bất kỳ kết quả GFR nào',
    },
    'vi3vgueu': {
      'en': 'Home',
      'vi': 'Trang chủ',
    },
  },
  // trackAlbuminLabPage
  {
    'i7f1uaiy': {
      'en': 'Seem like you don\'t have any albumin result',
      'vi': 'Có vẻ như bạn không có bất kỳ kết quả albumin nào',
    },
    'p7t9o9sr': {
      'en': 'Home',
      'vi': 'Trang chủ',
    },
  },
  // trackBUNPage
  {
    'cy6jl4yu': {
      'en': 'Seem like you don\'t have any blood urea nitrogen result',
      'vi': 'Có vẻ như bạn không có bất kỳ kết quả nitơ urê máu nào',
    },
    'c17lw21u': {
      'en': 'Home',
      'vi': 'Trang chủ',
    },
  },
  // uploadPhotoPage
  {
    'ueksjzfp': {
      'en': 'Note: File is less than 4mb, only image format is accepted',
      'vi': 'Lưu ý: File nhỏ hơn 4mb, chỉ nhận định dạng ảnh',
    },
    '7qtwcji5': {
      'en': 'Click to upload file',
      'vi': 'Nhấp để tải tệp lên',
    },
    'i6ut423a': {
      'en': 'Save',
      'vi': 'Lưu',
    },
    'ufkek3jk': {
      'en': 'Home',
      'vi': '',
    },
  },
  // changeLanguagePage
  {
    'igjb99am': {
      'en': 'Change Language',
      'vi': 'Thay đổi ngôn ngữ',
    },
    'eg80n3ob': {
      'en': 'Tiếng Việt',
      'vi': 'Tiếng Việt',
    },
    'b13fzejq': {
      'en': 'English',
      'vi': 'English',
    },
    'moaw7k35': {
      'en': 'Home',
      'vi': '',
    },
  },
  // trackBloodGlucosePage
  {
    '3swh74o8': {
      'en': 'Seem like you don\'t have any blood glucose result',
      'vi': 'Có vẻ như bạn không có bất kỳ kết quả đường huyết nào',
    },
    'ao060gyq': {
      'en': 'Home',
      'vi': 'Trang chủ',
    },
  },
  // forgotPassword
  {
    '0rne2rs9': {
      'en': 'Forgot Password',
      'vi': 'Quên mật khẩu',
    },
    '3k0o4s51': {
      'en':
          'Enter the email associated with your account and we will send you a verification code.',
      'vi': 'Nhập email để lấy mã xác minh và reset mật khẩu',
    },
    'l682yrmn': {
      'en': 'Email Address',
      'vi': 'Địa chỉ email',
    },
    's00u2ihp': {
      'en': 'Enter your email...',
      'vi': 'Nhập email của bạn...',
    },
    'unhnez38': {
      'en': 'Send Reset Link',
      'vi': 'Lấy lại mật khẩu',
    },
    'm4rzthy3': {
      'en': 'Home',
      'vi': 'Trang chủ',
    },
  },
  // addCareTeam
  {
    'xhmt21j5': {
      'en': 'Add a Member',
      'vi': 'Thêm bác sĩ',
    },
    'qqbwadds': {
      'en': 'This is tooltip!',
      'vi': 'Đây là chú giải công cụ!',
    },
    'eb3qaxfo': {
      'en': 'What is the member\'s name?',
      'vi': 'Tên của bác sĩ là gì?',
    },
    'yjrrw76k': {
      'en': 'i.e. John Wick',
      'vi': 'Ví dụ. Nguyễn Văn A',
    },
    'cqajuih2': {
      'en': 'What is the member\'s phone number?',
      'vi': 'Số điện thoại của bác sĩ là gì?',
    },
    'nb1m5wwo': {
      'en': 'i.e. 0912345678',
      'vi': 'Ví dụ. 0912345678',
    },
    's9g5y7i3': {
      'en': 'What is the member\'s clinic address?',
      'vi': 'Địa chỉ phòng khám của bác sĩ là gì?',
    },
    '97aq1ntc': {
      'en': 'i.e. 99 Quang Trung Street,...',
      'vi': 'Ví dụ. 99 đường Quang Trung,...',
    },
    '2ugw2gnn': {
      'en': '* Field is required',
      'vi': '* Bắt buộc nhập',
    },
    'qzkuryzm': {
      'en': 'Please choose an option from the dropdown',
      'vi': '',
    },
    'r1xpktni': {
      'en': '* Field is required',
      'vi': '* Bắt buộc nhập',
    },
    '3w0n4nqe': {
      'en': '* Phone number is not valid',
      'vi': '* Số điện thoại không hợp lệ',
    },
    'ile1bcgh': {
      'en': '* Phone number is not valid',
      'vi': '* Số điện thoại không hợp lệ',
    },
    '913hqxru': {
      'en': 'Please choose an option from the dropdown',
      'vi': '',
    },
    'gafyzvd8': {
      'en': '* Field is required',
      'vi': '* Bắt buộc nhập',
    },
    'orz3vwx8': {
      'en': 'Please choose an option from the dropdown',
      'vi': '',
    },
    'jw7um009': {
      'en': 'Save',
      'vi': 'Lưu',
    },
    '7maoy0lw': {
      'en': 'Skip',
      'vi': 'Bỏ qua',
    },
    'y0vackc7': {
      'en': 'Home',
      'vi': '',
    },
  },
  // listCareTeam
  {
    '1al73let': {
      'en': 'Your Team Members',
      'vi': 'Bác sĩ của bạn',
    },
    'r6a3vmq0': {
      'en': 'Seem like you don\'t have any doctor',
      'vi': 'Có vẻ như bạn chưa thêm bác sĩ nào',
    },
    'nwk0ksp1': {
      'en': 'Home',
      'vi': '',
    },
  },
  // privacyPolicy
  {
    'tvmpa5wb': {
      'en': 'Privacy Policy',
      'vi': '',
    },
    'xihjv9x4': {
      'en':
          'Privacy Policy for Kidney247.com\n\nKidney247.com (\"the App\") is committed to protecting the privacy of its users. This Privacy Policy explains how we collect, use, and share your personal information when you use the App.\n\nInformation We Collect\n\nWe collect the following information from you when you use the App:\n\nPersonal Information: We may collect personal information, such as your name, email address, and phone number, when you create an account or contact us for support.\n\nHealth Data: The App may collect health data such as your vitals, lab results, and other data. This information is solely provided by you and collected to provide you with health insights and recommendations.\n\nUsage Data: We may collect information about how you use the App, such as the features you use, the time and date of your interactions, and the pages you visit.\n\nHow We Use Your Information\n\nWe use your information for the following purposes:\n\nTo provide you with the services and features of the App.\n\nTo improve the App and develop new features and services.\n\nTo communicate with you about your account and provide support.\n\nTo personalize your experience and provide you with tailored health insights and recommendations.\n\nTo comply with legal obligations and regulations.\n\nHow We Share Your Information\n\nWe will not share your information with third parties without your consent, except as required by law.\n\nSecurity\n\nWe take reasonable measures to protect your personal information from unauthorized access or disclosure.\n\nYour Choices\n\nYou can control the information we collect and use by adjusting your settings in the App. You can also delete your account and information at any time by contacting us.\n\nChanges to this Privacy Policy\n\nWe may update this Privacy Policy from time to time by posting a new version on our website or within the App. We encourage you to review this Privacy Policy periodically.\n\nContact Us\n\nIf you have any questions about this Privacy Policy, please contact us at kidney247.com@gmail.com',
      'vi': '',
    },
    '7vbzr906': {
      'en': 'Home',
      'vi': '',
    },
  },
  // Onboard
  {
    'k4eb4rkf': {
      'en': 'Page Title',
      'vi': '',
    },
    '1valnalp': {
      'en': 'Home',
      'vi': '',
    },
  },
  // userAccount
  {
    'z66lghkv': {
      'en': 'Delete account',
      'vi': '',
    },
    '5fi37wzw': {
      'en': 'Blocked user list',
      'vi': '',
    },
    'gvk2jzed': {
      'en': '__',
      'vi': '',
    },
  },
  // upcomingAppointment
  {
    'wahcg2va': {
      'en': 'Home',
      'vi': 'Trang chủ',
    },
  },
  // addMedication
  {
    '9k4mlvqp': {
      'en': 'Skip',
      'vi': 'Bỏ qua',
    },
    '2vjcj17k': {
      'en': 'Add Medication',
      'vi': 'Thêm thuốc',
    },
    '4cuevs03': {
      'en': 'This is tooltip!',
      'vi': 'Đây là chú giải công cụ!',
    },
    'bvrp6yxs': {
      'en': 'Search Medication',
      'vi': 'Tìm thuốc',
    },
    'glv7umi4': {
      'en': 'i.e. Prednisolon',
      'vi': 'Ví dụ. Prednisolon',
    },
    'lam4iorn': {
      'en': '* Field is required',
      'vi': '* Vui lòng nhập tên thuốc',
    },
    'ye6w4rc3': {
      'en': 'Please choose an option from the dropdown',
      'vi': '',
    },
    'awyob9p2': {
      'en': ',',
      'vi': ',',
    },
    '5dnrzs69': {
      'en': 'Enter Manually',
      'vi': 'Thêm thủ công',
    },
    'a643xfov': {
      'en': 'Medicine name',
      'vi': 'Tên thuốc',
    },
    'd58cp2e3': {
      'en': 'Tylenol',
      'vi': 'Tylenol',
    },
    'uj6xkug7': {
      'en': 'Medicine ingredients',
      'vi': 'Thành phần thuốc',
    },
    'irc407ad': {
      'en': 'Paracetamol\nAcetaminophen',
      'vi': 'Paracetamol\nAcetaminophen',
    },
    '9gdg1822': {
      'en': 'Injection',
      'vi': 'Tiêm',
    },
    'hmnef3od': {
      'en': 'Tablet',
      'vi': 'Viên nén',
    },
    'ax6jo8q8': {
      'en': 'Capsules',
      'vi': 'Viên nang',
    },
    'eh4wwktl': {
      'en': 'Solution',
      'vi': 'Dung dịch',
    },
    '9bgczf9p': {
      'en': 'Effervescent tablet',
      'vi': 'Viên sủi',
    },
    'qq11lt8t': {
      'en': 'Powder',
      'vi': 'Bột',
    },
    'e40d9y5s': {
      'en': 'Please select...',
      'vi': '',
    },
    'fed8xls2': {
      'en': 'Search for an item...',
      'vi': '',
    },
    'i7izyo4a': {
      'en': 'Immediated Release',
      'vi': 'Giải phóng ngay',
    },
    'cpawfvwh': {
      'en': 'Fast Release',
      'vi': 'Giải phóng nhanh',
    },
    'mvcmxdzp': {
      'en': 'Delay Release',
      'vi': 'Giải phóng muộn',
    },
    'lnrk6u4k': {
      'en': 'Pulsatile Release',
      'vi': 'Giải phóng theo nhịp',
    },
    'ze9pccu7': {
      'en': 'Extended Release',
      'vi': 'Giải phóng kéo dài',
    },
    'jbpgut8t': {
      'en': 'Controlled Release',
      'vi': 'Giải phóng kiểm soát',
    },
    'bdcidt5b': {
      'en': 'Please select...',
      'vi': '',
    },
    'i79vy7le': {
      'en': 'Search for an item...',
      'vi': '',
    },
    'dttbxvis': {
      'en': 'Medicine dosage',
      'vi': 'Liều lượng thuốc',
    },
    'vniy1519': {
      'en': '650mg',
      'vi': '650mg',
    },
    'ttcgf9xe': {
      'en': 'Save',
      'vi': 'Lưu',
    },
    'tm8rg2to': {
      'en': '* Field is required',
      'vi': '* Bắt buộc nhập',
    },
    'tnysc233': {
      'en': 'Please choose an option from the dropdown',
      'vi': '',
    },
    '78j9xgo6': {
      'en': '* Field is required',
      'vi': '* Bắt buộc nhập',
    },
    'ctbfwf9l': {
      'en': 'Please choose an option from the dropdown',
      'vi': '',
    },
    'cepzhiv8': {
      'en': '* Field is required',
      'vi': '* Bắt buộc nhập',
    },
    '6plup94y': {
      'en': 'Please choose an option from the dropdown',
      'vi': '',
    },
    '25f3vify': {
      'en': 'Home',
      'vi': '',
    },
  },
  // doneProfile
  {
    'xgf3bbdk': {
      'en': 'Thank you, we finished building your profile.',
      'vi': 'Cảm ơn bạn, chúng tôi đã hoàn thành việc xây dựng hồ sơ của bạn.',
    },
    'xl9i229i': {
      'en': 'Start manage my health!',
      'vi': 'Bắt đầu quản lý sức khỏe của tôi!',
    },
    'uv6b0pil': {
      'en': 'Home',
      'vi': '',
    },
  },
  // listMedicationRemind
  {
    '5z1guzk6': {
      'en': 'Home',
      'vi': 'Trang chủ',
    },
  },
  // userProfile
  {
    '0ua76loh': {
      'en': 'Join Kidney247 from ',
      'vi': 'Tham gia Kidney247 ',
    },
    '6ybsk2x3': {
      'en': 'Chat',
      'vi': 'Nhắn tin',
    },
    'bmm99pps': {
      'en': 'Post',
      'vi': 'Bài đăng',
    },
    'uwr5eiee': {
      'en': ' • ',
      'vi': ' • ',
    },
    'kx28z69t': {
      'en': 'No post yet!',
      'vi': 'Chưa có bài viết nào!',
    },
    'not2de3n': {
      'en': 'Home',
      'vi': '',
    },
  },
  // communityPage
  {
    'j2nanf93': {
      'en': 'Forum post',
      'vi': 'Diễn đàn',
    },
    'yw7s4x0d': {
      'en': 'Create new post',
      'vi': 'Tạo bài viết mới',
    },
    'va7b0jmq': {
      'en': 'Join ',
      'vi': 'Tham gia ',
    },
    'eks6yhzk': {
      'en': 'No post yet!',
      'vi': 'Chưa có bài viết nào!',
    },
    'fqvy044x': {
      'en': 'Group chat',
      'vi': 'Chat nhóm',
    },
    'sxm7tohc': {
      'en': 'Create new group',
      'vi': 'Tạo nhóm chat mới',
    },
    'uactlxuw': {
      'en': 'Chronic kidney disease',
      'vi': 'Nhóm Bệnh thận',
    },
    'yty89zcx': {
      'en': 'Chronic kidney disease',
      'vi': 'Nhóm Bệnh thận',
    },
    'lds0wzyy': {
      'en': 'Hemodialysis',
      'vi': 'Nhóm Chạy thận nhân tạo',
    },
    'shtm8gvs': {
      'en': 'Hemodialysis',
      'vi': 'Nhóm Chạy thận nhân tạo',
    },
    'y2og2aby': {
      'en': 'No group chat yet!',
      'vi': 'Chưa có cuộc trò chuyện nhóm nào!',
    },
    'pi1phr9j': {
      'en': 'Private chat',
      'vi': 'Tin nhắn',
    },
    'j19ffhjx': {
      'en': 'Find an user and click \'Chat\' to start a conversation',
      'vi':
          'Tìm người dùng và nhấp vào \'Trò chuyện\' để bắt đầu cuộc trò chuyện',
    },
    'hfpddkll': {
      'en': 'Kidney247 Community',
      'vi': 'Cộng đồng Kidney247',
    },
    'ucc2rduv': {
      'en': 'Community',
      'vi': 'Cộng đồng',
    },
  },
  // createGroupchat
  {
    'nmkm0mj7': {
      'en': 'Group chat name',
      'vi': 'Tên nhóm chat',
    },
    'bhamhx58': {
      'en': 'Group chat description',
      'vi': 'Mô tả nhóm chat',
    },
    'rrvk2uqw': {
      'en': 'English',
      'vi': 'English',
    },
    '4ijkzxyf': {
      'en': 'Tiếng Việt',
      'vi': 'Tiếng Việt',
    },
    'oz7v0nb7': {
      'en': '',
      'vi': '',
    },
    'uf8v9xqb': {
      'en': 'Create group',
      'vi': 'Tạo nhóm',
    },
    '3kv52svy': {
      'en': '* Field is required',
      'vi': '* Bắt buộc nhập',
    },
    'ty71wfnt': {
      'en': 'Please choose an option from the dropdown',
      'vi': '',
    },
    'f4qrr7t6': {
      'en': 'Field is required',
      'vi': '',
    },
    '6dym1bzc': {
      'en': 'Please choose an option from the dropdown',
      'vi': '',
    },
    'yuuh7au4': {
      'en': 'Create group chat',
      'vi': 'Tạo trò chuyện nhóm',
    },
  },
  // ChatPage
  {
    '8p19k2x8': {
      'en': 'Find user by using \'Search\' box above',
      'vi': 'Tìm người dùng bằng cách nhập Tên hoặc địa chỉ mail',
    },
    'mblbya92': {
      'en': 'Add to group',
      'vi': 'Thêm vào nhóm',
    },
    'f5u1bnr3': {
      'en': 'Leave group',
      'vi': 'Rời nhóm',
    },
  },
  // share
  {
    '9i5q5u18': {
      'en': 'Share',
      'vi': 'Chia sẻ',
    },
    '4cx4gv9q': {
      'en': 'Home',
      'vi': '',
    },
  },
  // bookAppointment
  {
    'n5lj2nno': {
      'en': 'Add Appointment',
      'vi': 'Đặt lịch hẹn',
    },
    'kmv5qyx7': {
      'en': 'Fill out the information below in order to add your appointment.',
      'vi': 'Điền thông tin dưới đây để thêm cuộc hẹn của bạn.',
    },
    'wk5xv8vg': {
      'en': 'Doctor',
      'vi': 'Bác sĩ',
    },
    'zn1k5bea': {
      'en': 'What\'s the problem?',
      'vi': 'Tình trạng bệnh hiện tại của bạn thế nào?',
    },
    '586z19m5': {
      'en': 'Choose Date & Time',
      'vi': 'Chọn Ngày & Giờ',
    },
    'za4i6ikr': {
      'en': 'Cancel',
      'vi': 'Hủy',
    },
    'z7inrj78': {
      'en': 'Add Now',
      'vi': 'Thêm ngay',
    },
    'c026s3j2': {
      'en': 'Field is required',
      'vi': '',
    },
    'rtbm0eib': {
      'en': 'Please choose an option from the dropdown',
      'vi': '',
    },
    'gggdaiy6': {
      'en': '* Field is required',
      'vi': '* Bạn chưa nhập gì cả',
    },
    'ndyevp10': {
      'en': 'Please choose an option from the dropdown',
      'vi': '',
    },
  },
  // blankChatGPT
  {
    '4tdc0spy': {
      'en': 'Ask me anything👋',
      'vi': '👋 Chào bạn, bạn muốn hỏi về điều gì?',
    },
  },
  // blankMeal
  {
    'li1350d5': {
      'en': 'Search above to find foods to add',
      'vi': 'Nhấn vào thanh tìm kiếm bên trên để tìm món ăn',
    },
    '8e3w9sb2': {
      'en': 'We couldn\'t match any of your food',
      'vi': 'Chúng tôi không thể tìm thấy món ăn này của bạn',
    },
    'i16rpeek': {
      'en':
          'The search function has been designed to make it easier and faster for you to log food.',
      'vi':
          'Tìm kiếm món ăn từ kho 100+ món ăn Việt Nam hoặc thêm món ăn của riêng bạn vào danh sách',
    },
  },
  // mealUnitSlider
  {
    'v3o8hrab': {
      'en': 'How much did you have?',
      'vi': 'Lượng thức ăn',
    },
    'pkyyz4u1': {
      'en': 'g',
      'vi': 'g',
    },
    '6vy9sv0a': {
      'en': 'Add to Log',
      'vi': 'Thêm vào lịch sử',
    },
    '7l79v1qu': {
      'en': 'Add to Log',
      'vi': 'Thêm vào lịch sử',
    },
  },
  // emptyList
  {
    'oanvno00': {
      'en':
          'Browse our database to find foods you want to add, once you add them, they will appear here.',
      'vi': 'Lịch sử món ăn sẽ xuất hiện tại đây.',
    },
  },
  // emptyTracking
  {
    'lh0aukf2': {
      'en': 'No tracking history',
      'vi': 'Không có lịch sử theo dõi',
    },
    'pjem2lec': {
      'en': 'Start tracking',
      'vi': 'Bắt đầu theo dõi',
    },
  },
  // editAlbumin
  {
    '1tb7mz6s': {
      'en': 'What was your Albumin Result?',
      'vi': 'Kết quả Albumin của bạn là bao nhiêu?',
    },
    '72ozux4b': {
      'en': 'g/dL',
      'vi': 'g/dL',
    },
    'bdo80odg': {
      'en': 'Save changes',
      'vi': 'Lưu thay đổi',
    },
  },
  // editBUN
  {
    'pvoh3dz1': {
      'en': 'What was your Blood Urea Nitrogen Result?',
      'vi': 'Kết quả Nitơ Ure máu của bạn là bao nhiêu?',
    },
    '7x5p6t1y': {
      'en': 'mg/dL',
      'vi': 'mg/dL',
    },
    'yaxbct7q': {
      'en': 'Save changes',
      'vi': 'Lưu thay đổi',
    },
  },
  // editGFR
  {
    '3pwg8vtk': {
      'en': 'What was your GFR Result?',
      'vi': 'Kết quả GFR của bạn là bao nhiêu?',
    },
    '15g26dhd': {
      'en': 'ml/min',
      'vi': 'ml/phút',
    },
    'jiy9kicj': {
      'en': 'Save changes',
      'vi': 'Lưu thay đổi',
    },
  },
  // editBloodGlucoseA1C
  {
    'wz3spkdd': {
      'en': 'What was your Blood Glucose A1C Result?',
      'vi': 'Kết quả Đường huyết A1C của bạn là bao nhiêu?',
    },
    'ntgx9kmq': {
      'en': '%',
      'vi': '%',
    },
    'dl2jeap1': {
      'en': 'Save changes',
      'vi': 'Lưu thay đổi',
    },
  },
  // editFluidOutput
  {
    'a94bw1m0': {
      'en': 'What was your Fluid Output Result?',
      'vi': 'Kết quả lượng nước tiểu của bạn là bao nhiêu?',
    },
    'fk9c2lyv': {
      'en': 'liter',
      'vi': 'lít',
    },
    'gkqrdp2n': {
      'en': 'Save changes',
      'vi': 'Lưu thay đổi',
    },
  },
  // editBloodGlucose
  {
    'uv46kr4q': {
      'en': 'What was your Blood Glucose Result?',
      'vi': 'Kết quả đường huyết của bạn là bao nhiêu?',
    },
    'ln9uprca': {
      'en': 'mg/dL',
      'vi': 'mg/dL',
    },
    'h9890uf1': {
      'en': 'Save changes',
      'vi': 'Lưu thay đổi',
    },
  },
  // editBloodPressure
  {
    'j1ihtn7n': {
      'en': 'What was your Blood Pressure Result?',
      'vi': 'Kết quả huyết áp của bạn là bao nhiêu?',
    },
    'l4n3ke9w': {
      'en': 'mmHg',
      'vi': 'mmHg',
    },
    'vkjtslh8': {
      'en': 'Save changes',
      'vi': 'Lưu thay đổi',
    },
  },
  // commentComponent
  {
    'g7bb2etn': {
      'en': 'Edit',
      'vi': 'Sửa',
    },
    '6enc8kaa': {
      'en': 'Delete',
      'vi': 'Xoá',
    },
    'nbq72vzz': {
      'en': 'No comment yet.',
      'vi': 'Chưa có bình luận nào.',
    },
    'hupepc8t': {
      'en': 'Edit',
      'vi': 'Sửa',
    },
    '9mqacp9f': {
      'en': 'Delete',
      'vi': 'Xoá',
    },
    '4raeqm0g': {
      'en': 'No comment yet.',
      'vi': 'Chưa có bình luận nào.',
    },
    'r5jj1upl': {
      'en': 'Reply ',
      'vi': 'Trả lời ',
    },
    'tvme4sea': {
      'en': 'Reply ',
      'vi': 'Trả lời ',
    },
    'jgsaagw2': {
      'en': 'Write some comment...',
      'vi': 'Viết vài dòng bình luận...',
    },
    'uhhjbs28': {
      'en': 'Write some comment...',
      'vi': 'Viết vài dòng bình luận...',
    },
    'darc88kb': {
      'en': 'Field is required',
      'vi': 'Bạn chưa viết gì cả!',
    },
    'i7ew1jun': {
      'en': 'Please choose an option from the dropdown',
      'vi': '',
    },
    '8wulvyuj': {
      'en': 'Field is required',
      'vi': 'Bạn chưa viết gì cả!',
    },
    'tjl1bbjo': {
      'en': '',
      'vi': '',
    },
    'az4ofgri': {
      'en': 'Please choose an option from the dropdown',
      'vi': '',
    },
  },
  // editMember
  {
    'i97do9go': {
      'en': 'What is the member\'s name?',
      'vi': 'Tên của bác sĩ là gì?',
    },
    'gtki6t4g': {
      'en': 'i.e. John Wick',
      'vi': 'Ví dụ. Nguyễn Văn A',
    },
    'rcgqdstz': {
      'en': 'What is the member\'s phone number?',
      'vi': 'Số điện thoại của bác sĩ là gì?',
    },
    '1wt3kmya': {
      'en': 'i.e. 0912345678',
      'vi': 'Ví dụ. 0912345678',
    },
    's9xgqt3s': {
      'en': 'What is the member\'s clinic address?',
      'vi': 'Địa chỉ phòng khám của bác sĩ là gì?',
    },
    'oq2dq0jc': {
      'en': 'i.e. 99 Quang Trung Street,...',
      'vi': 'Ví dụ. 99 đường Quang Trung,...',
    },
    'v2royq1t': {
      'en': '* Field is required',
      'vi': '* Bắt buộc nhập',
    },
    'np23v0v8': {
      'en': 'Please choose an option from the dropdown',
      'vi': '',
    },
    '1bgp4ljf': {
      'en': '* Field is required',
      'vi': '* Bắt buộc nhập',
    },
    '38jvvr9p': {
      'en': '* Phone number is not valid',
      'vi': '* Số điện thoại không hợp lệ',
    },
    'dnjo24s3': {
      'en': '* Phone number is not valid',
      'vi': '* Số điện thoại không hợp lệ',
    },
    'carlxd1p': {
      'en': 'Please choose an option from the dropdown',
      'vi': '',
    },
    'yicgrno9': {
      'en': '* Field is required',
      'vi': '* Bắt buộc nhập',
    },
    'mpgcimwv': {
      'en': 'Please choose an option from the dropdown',
      'vi': '',
    },
    'm9a9i02n': {
      'en': 'Save',
      'vi': 'Lưu',
    },
  },
  // emptyAppointment
  {
    '78h0k39q': {
      'en': 'No tracking appointment',
      'vi': 'Không có lịch sử cuộc hẹn',
    },
    'hg2vtjw8': {
      'en': 'Add Appointment',
      'vi': 'Thêm cuộc hẹn',
    },
  },
  // editAppointment
  {
    '3rxkmlhh': {
      'en': 'Edit Appointment',
      'vi': 'Sửa lịch hẹn',
    },
    'hc8nqw04': {
      'en': 'Fill out the information below in order to edit your appointment.',
      'vi': 'Điền thông tin dưới đây để sửa cuộc hẹn của bạn.',
    },
    '2y8smzy8': {
      'en': 'Doctor',
      'vi': 'Bác sĩ',
    },
    'yfekurvz': {
      'en': 'What\'s the problem?',
      'vi': 'Tình trạng bệnh hiện tại của bạn thế nào?',
    },
    '3uvph61l': {
      'en': 'Choose Date & Time',
      'vi': 'Chọn Ngày & Giờ',
    },
    '9m8jzob1': {
      'en': 'Cancel',
      'vi': 'Hủy',
    },
    'omo6cra4': {
      'en': 'Save',
      'vi': 'Lưu',
    },
    'e71aq7bb': {
      'en': 'Field is required',
      'vi': '',
    },
    '2qpv602q': {
      'en': 'Please choose an option from the dropdown',
      'vi': '',
    },
    '8h16en1b': {
      'en': '* Field is required',
      'vi': '* Bạn chưa nhập gì cả',
    },
    '766z9h7v': {
      'en': 'Please choose an option from the dropdown',
      'vi': '',
    },
  },
  // addMedicationReminder
  {
    'j7cdjk6s': {
      'en': 'When will you take this?',
      'vi': 'Bạn muốn uống vào buổi nào trong ngày?',
    },
    '0cm0h8re': {
      'en': 'Morning',
      'vi': 'Sáng',
    },
    'ntd68jj6': {
      'en': 'Mid-Day',
      'vi': 'Trưa',
    },
    'zacsc7sz': {
      'en': 'Evening',
      'vi': 'Tối',
    },
    '34h0tgh1': {
      'en': 'Any notes you\'d like to add?',
      'vi': 'Bạn muốn thêm ghi chú gì không?',
    },
    'uyvutwo9': {
      'en': 'Add notes...',
      'vi': 'Thêm ghi chú...',
    },
    'b9dresjj': {
      'en': 'How many days do you want to take this?',
      'vi': 'Bạn muốn uống trong bao nhiêu ngày?',
    },
    '29qrro97': {
      'en': 'Cancel',
      'vi': 'Hủy',
    },
    'htt616jh': {
      'en': 'Add Now',
      'vi': 'Thêm ngay',
    },
    '9ri8xnf5': {
      'en': 'Field is required',
      'vi': '',
    },
    'tqp1basd': {
      'en': 'Please choose an option from the dropdown',
      'vi': '',
    },
    'mz0i52b0': {
      'en': '* Field is required',
      'vi': '* Bạn chưa nhập gì cả',
    },
    'dv7tqvw1': {
      'en': 'Please choose an option from the dropdown',
      'vi': '',
    },
  },
  // postOptionPopup
  {
    '90i8oiim': {
      'en': 'Edit',
      'vi': 'Sửa',
    },
    'sm4skv6k': {
      'en': 'Delete',
      'vi': 'Xoá',
    },
  },
  // createNewPostComponent
  {
    '8hya48rx': {
      'en': 'Create',
      'vi': 'Tạo',
    },
    'zkgtn8o8': {
      'en': 'What\'s happening...?',
      'vi': 'Bạn đang nghĩ gì...?',
    },
    'szln4n6s': {
      'en': 'Save',
      'vi': 'Lưu',
    },
    'sqlowqz5': {
      'en': 'What\'s happening...?',
      'vi': 'Bạn đang nghĩ gì...?',
    },
  },
  // searchPost
  {
    'g5hr70xb': {
      'en': 'Search a post...',
      'vi': 'Tìm kiếm bài đăng...',
    },
    'b78a8hg1': {
      'en': 'Join ',
      'vi': 'Tham gia ',
    },
    'c2rtqa7s': {
      'en': 'No post found!',
      'vi': 'Không tìm thấy bài đăng nào!',
    },
  },
  // commentReply
  {
    'cozx4m4x': {
      'en': 'Delete',
      'vi': 'Xoá',
    },
    'tht17cno': {
      'en': 'Delete',
      'vi': 'Xoá',
    },
  },
  // Miscellaneous
  {
    'vpeokl10': {
      'en': '[Some hint text...]',
      'vi': '',
    },
    'cp3u5tex': {
      'en':
          'In order to take a picture or video, this app requires permission to access the camera.',
      'vi':
          'Để chụp ảnh hoặc quay video, ứng dụng này cần có quyền truy cập vào máy ảnh.',
    },
    'pd47hcrs': {
      'en':
          'In order to upload data, this app requires permission to access the photo library.',
      'vi':
          'Để tải dữ liệu lên, ứng dụng này cần có quyền truy cập vào thư viện ảnh.',
    },
    '49z387fi': {
      'en': 'Enable notification',
      'vi': '',
    },
    '3nmox27b': {
      'en':
          'In order to collect user behavior, this app requires permission to record screen',
      'vi': '',
    },
    'insdkkcg': {
      'en': '',
      'vi': '',
    },
    'ddhmcuo3': {
      'en': '',
      'vi': '',
    },
    'j53d7jta': {
      'en': '',
      'vi': '',
    },
    'j3gjk917': {
      'en': '',
      'vi': '',
    },
    'sqlf6gdh': {
      'en': '',
      'vi': '',
    },
    'pwbove5w': {
      'en': '',
      'vi': '',
    },
    'g97fgys7': {
      'en': '',
      'vi': '',
    },
    'u99m48xp': {
      'en': '',
      'vi': '',
    },
    't6lrssd0': {
      'en': '',
      'vi': '',
    },
    'bu01t6ln': {
      'en': '',
      'vi': '',
    },
    'ew4i9bvh': {
      'en': '',
      'vi': '',
    },
    'oszh2se4': {
      'en': '',
      'vi': 'Đang gửi ảnh',
    },
    'bahxy3gu': {
      'en': '',
      'vi': '',
    },
    '58d878il': {
      'en': '',
      'vi': 'Thư viện',
    },
    '8j22z2pw': {
      'en': '',
      'vi': 'Thư viện (Ảnh)',
    },
    'qdkk23zn': {
      'en': '',
      'vi': 'Thư viện (Video)',
    },
    'gl8in58n': {
      'en': '',
      'vi': 'Máy Ảnh',
    },
    'o01fgxxs': {
      'en': '',
      'vi': '',
    },
    'imfylxpw': {
      'en': '',
      'vi': '',
    },
    '4xj4kj0w': {
      'en': '',
      'vi': '',
    },
    'pa4mh7xd': {
      'en': '',
      'vi': '',
    },
  },
].reduce((a, b) => a..addAll(b));
