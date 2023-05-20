import 'package:firebase_core/firebase_core.dart';
import 'package:qwise/rivorpod/forgot_password_notifier.dart';
import 'package:qwise/rivorpod/verify_otp_screen_notifier.dart';
import 'package:qwise/router/app_route.dart';
import 'package:qwise/router/multi_provider_name.dart';
import 'package:qwise/utils/file_collection.dart';

import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await SharedPreference.init();
  WidgetsFlutterBinding.ensureInitialized();
  await AppUtils.handleNotificationPermission(Permission.notification);
  runApp(MultiProvider(providers: multiProviderName, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Qwise',
      theme: themeData,
      routerConfig: appRoute,
      
    );
  }
}
