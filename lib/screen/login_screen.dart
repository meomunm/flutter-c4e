import 'package:comic_reader/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'dashboard/dashboard_screen.dart';
import 'login/bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context1) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        body: BlocBuilder<LoginBloc, LoginState>(
          builder: (context2, state) {
            return Stack(
              children: [
                Positioned.fill(
                  child: Column(
                    children: const [
                      AppBarLogin(),
                      Expanded(child: ContentLogin()),
                      ExpansionTileExample(),
                      SizedBox(
                        height: 16,
                      )
                    ],
                  ),
                ),
                if (state.isLoading)
                  const Center(
                    child: SizedBox(width: 60, height: 60, child: CircularProgressIndicator()),
                  )
              ],
            );
          },
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
        InkWell(
            onTap: () {
              BlocProvider.of<LoginBloc>(context).add(RequestLoginEvent(onFinish: () {
                Navigator.pushNamed(context, DashBoardScreen.named);
              }));
            },
            child: _buildButton('Log in', <Color>[const Color(0xFFFCFFDF), const Color(0xFFF1FE87)], Colors.black)),
        const SizedBox(height: 16),
        _buildButton(
            'Become a client of the bank', <Color>[const Color(0x12FFFFFF), const Color(0x12FFFFFF)], Colors.white),
      ],
    );
  }

  Widget _buildButton(String buttonTitle, List<Color> colors, Color textColor) {
    return Container(
      height: 40,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: LinearGradient(colors: colors, begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Center(child: Text(buttonTitle, style: TextStyle(color: textColor))),
    );
  }
}

class CurrentLoanWidget extends StatelessWidget {
  const CurrentLoanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExpansionTileExample();
  }
}

class ExpansionTileExample extends StatefulWidget {
  const ExpansionTileExample({super.key});

  @override
  State<ExpansionTileExample> createState() => _ExpansionTileExampleState();
}

class _ExpansionTileExampleState extends State<ExpansionTileExample> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: const Color(0x12FFFFFF),
      ),
      child: Column(
        children: <Widget>[
          ExpansionTile(
            title: const Text('CURRENT LOAN', style: TextStyle(color: Colors.white)),
            // subtitle: const Text('Custom expansion arrow icon', style: TextStyle(color: Colors.white)),
            trailing: Icon(
              _customTileExpanded ? Icons.arrow_drop_down_circle : Icons.arrow_drop_down,
              color: Colors.white,
            ),
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.black),
                child: Row(
                  children: [
                    /// MARK: Icon
                    Container(
                      width: 40,
                      height: 40,
                      decoration:
                          BoxDecoration(color: const Color(0xFFB2D0CE), borderRadius: BorderRadius.circular(12)),
                      child: const Icon(
                        Icons.add_chart,
                        size: 20,
                      ),
                    ),

                    /// MARK: Center content
                    Container(
                      margin: const EdgeInsets.only(left: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Account № 3874825", style: TextStyle(color: Colors.white)),
                          Text("Expires 12/22/2023", style: TextStyle(color: Color(0xFF79767D))),
                        ],
                      ),
                    ),

                    /// MARK: Right content
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Text("\$ 78,92", style: TextStyle(color: Colors.white)),
                            Text("Rate 3.5%", style: TextStyle(color: Color(0xFF79767D))),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() {
                _customTileExpanded = expanded;
              });
            },
          ),
        ],
      ),
    );
  }
}
