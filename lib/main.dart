import 'package:qwise/router/app_route.dart';
import 'package:qwise/router/multi_provider_name.dart';
import 'package:qwise/utils/file_collection.dart';

Future<void> main() async {
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
      title: 'QWise',
      theme: themeData,
      routerConfig: appRoute,
    );
  }
}
