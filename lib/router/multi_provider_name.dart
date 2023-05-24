import 'package:provider/single_child_widget.dart';
import 'package:qwise/admin/admin_provider/admin_add_category_notifier.dart';
import 'package:qwise/provider/course_details_notifier.dart';
import 'package:qwise/provider/course_videos_notifier.dart';
import 'package:qwise/provider/page_index_selector.dart';
import 'package:qwise/provider/profile_screen_notifier.dart';

import '../provider/edit_profile_notifier.dart';
import '../provider/forgot_password_notifier.dart';
import '../provider/verify_otp_screen_notifier.dart';
import '../utils/file_collection.dart';

final List<SingleChildWidget> multiProviderName = [
  ChangeNotifierProvider(create: (_) => OnBoardingNotifier()),
  ChangeNotifierProvider(create: (_) => SignUpNotifier()),
  ChangeNotifierProvider(create: (_) => SigninNotifer()),
  ChangeNotifierProvider(create: (_) => ForgotPasswordNotifier()),
  ChangeNotifierProvider(create: (_) => VerifyOTPNotifier()),
  ChangeNotifierProvider(create: (_) => PageIndexSelectorNotifier()),
  ChangeNotifierProvider(create: (_) => EditProfileNotifier()),
  ChangeNotifierProvider(create: (_) => CourseVideoNotifier()),
  ChangeNotifierProvider(create: (_) => CourseDetailsNotifier()),
  ChangeNotifierProvider(create: (_) => ProfileScreenNotifier()),
  ChangeNotifierProvider(create: (_) => AdminAddCategoryNotifier()),
];
