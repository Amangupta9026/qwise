import 'package:qwise/utils/file_collection.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                "Welcome, Aman",
                style: TextStyle(
                  fontSize: 14,
                  color: lightBlueTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
