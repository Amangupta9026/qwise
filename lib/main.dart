import 'package:qwise/rivorpod/forgot_password_notifier.dart';
import 'package:qwise/rivorpod/verify_otp_screen_notifier.dart';
import 'package:qwise/utils/file_collection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppUtils.handleNotificationPermission(Permission.notification);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => SignUpNotifier()),
    ChangeNotifierProvider(create: (_) => OnBoardingNotifier()),
    ChangeNotifierProvider(create: (_) => SigninNotifer()),
    ChangeNotifierProvider(create: (_) => ForgotPasswordNotifier()),
    ChangeNotifierProvider(create: (_) => VerifyOTPNotifier()),

  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qwise',
      theme: themeData,
      home: const OnBoarding(),
    );
  }
}
