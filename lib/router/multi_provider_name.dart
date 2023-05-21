import 'package:provider/single_child_widget.dart';
import 'package:qwise/provider/page_index_selector.dart';

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
];