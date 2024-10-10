import 'package:flutter/material.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  static String named = '/second';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('DashBoard'),
          actions: [
            BackButton(
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
        body: Text("DashBoard Screen"),
      ),
    );
  }
}
