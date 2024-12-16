import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flashchat/screens/registration_screen.dart';
import 'package:flutter/material.dart';

import '../components/rounded_button.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  static String id = 'welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);

    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    controller.forward();
    animation.addStatusListener((status) {});
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 60.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: const ['Flash Chat'],
                  textStyle: const TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.black54,
                  ),
                  totalRepeatCount: 1,
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedButton(
                color: Colors.lightBlueAccent,
                title: 'Log In',
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                }),
            RoundedButton(
              color: Colors.blueAccent,
              title: 'Register',
              onPressed: () async {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
