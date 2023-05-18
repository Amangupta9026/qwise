import 'package:provider/provider.dart';
import 'package:qwise/rivorpod/signup_notifier.dart';
import 'package:qwise/utils/file_collection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppUtils.handleNotificationPermission(Permission.notification);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => SignUpNotifier()),
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
