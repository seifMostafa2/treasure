// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:finology/Constance/constance.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2800),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
    _loadNextScreen();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  late BuildContext myContext;

  _loadNextScreen() async {
    await Future.delayed(Duration(milliseconds: 3000));
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, Routes.lOGIN);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(ConstanceData.splashBg),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(ConstanceData.claylogo, height: 60),
            SizedBox(height: defaultPadding),
            Text(
              "Treasure",
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(color: Colors.white, fontSize: 35),
            ),
            SizedBox(height: defaultPadding),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: defaultPadding * 4),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(defaultRadius),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.white38,
                  value: controller.value,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
