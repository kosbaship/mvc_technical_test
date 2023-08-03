import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'home/view/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = '/splash';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late Animation<double> animationSize;
  late Animation<double> animationAngle;
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animationSize = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          context.goNamed(HomeScreen.routeName);
        }
      });
    animationAngle = Tween<double>(begin: 0, end: 1).animate(controller);

    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: AnimatedContainer(
          duration: const Duration(seconds: 1),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: animationSize.value > 100 ? Alignment.topRight : Alignment.topLeft,
            end: animationSize.value > 150 ? Alignment.bottomLeft : Alignment.bottomRight,
            stops: const [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.blueGrey.shade100,
              Colors.lightBlue.shade50,
              Colors.lightBlue.shade300,
              Colors.lightBlueAccent.shade400
            ],
          )),
          child: Center(
            child: Transform.rotate(
              angle: animationAngle.value > 0.5 ? 0 : pi * 4 * animationAngle.value,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: animationSize.value,
                width: animationSize.value,
                child: const FlutterLogo(),
              ),
            ),
          ),
        ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
