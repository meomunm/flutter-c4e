import 'package:comic_reader/screen/dashboard/dashboard_screen.dart';
import 'package:comic_reader/screen/login/bloc/login_bloc.dart';
import 'package:comic_reader/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loubank',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => BlocProvider<LoginBloc>(create: (context) => LoginBloc(), child: const LoginScreen()),
        DashBoardScreen.named: (context) => const DashBoardScreen(),
      },
    );
  }
}
