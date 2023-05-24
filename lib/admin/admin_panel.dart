import 'package:flutter/material.dart';

class AdminPanel extends StatelessWidget {
  AdminPanel({super.key});

  final List<String> services = [
    "Add Courses",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: services.length,
            itemBuilder: (context, index) {
              final service = services[index];
              return Card(
                child: Text(service),
              );
            },
          )
        ],
      ),
    );
  }
}
