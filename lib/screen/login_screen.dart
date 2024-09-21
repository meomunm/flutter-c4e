import 'package:comic_reader/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        body: Column(
          children: const [
            AppBarLogin(),
            Expanded(
              child: ContentLogin(),
            ),
          ],
        ),
      ),
    );
  }
}

class AppBarLogin extends StatelessWidget {
  const AppBarLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Image.asset(
                logo,
                height: 50,
              )),
          Positioned(top: 10, right: 15, child: _buildActionButton()),
        ],
      ),
    );
  }

  Widget _buildActionButton() {
    return Container(
      width: 32,
      height: 32,
      padding: const EdgeInsets.all(7),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0x12FFFFFF),
      ),
      child: SvgPicture.asset(
        icon,
        width: 3,
        height: 7,
      ),
    );
  }
}

class ContentLogin extends StatelessWidget {
  const ContentLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(logo, fit: BoxFit.fill, width: 200, height: 64),
        const SizedBox(height: 84),
        _buildButton('Log in',  <Color>[Color(0xFFFCFFDF), Color(0xFFF1FE87)], Colors.black),
        const SizedBox(height: 16),
        _buildButton('Become a client of the bank', <Color>[Color(0x12FFFFFF), Color(0x12FFFFFF)], Colors.white),
      ],
    );
  }

  Widget _buildButton(String buttonTitle, List<Color> colors, Color textColor) {
    return Container(
      height: 40,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), gradient: LinearGradient(colors: colors, begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Center(child: Text(buttonTitle, style: TextStyle(color: textColor))),
    );
  }
}
