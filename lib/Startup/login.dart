// ignore_for_file: prefer_const_constructors, deprecated_member_use, library_private_types_in_public_api

import 'package:finology/Constance/constance.dart';
import 'package:finology/Constance/theme.dart';
import 'package:finology/Widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(
            defaultPadding,
            defaultPadding,
            defaultPadding,
            MediaQuery.of(context).padding.bottom + defaultPadding),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 8),
              Center(
                child: Text(
                  "Treasure",
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: Theme.of(context).primaryColor, fontSize: 35),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 11),
              Text("Sing In", style: Theme.of(context).textTheme.headline5),
              SizedBox(height: defaultPadding),
              CustomField(
                  prefixSize: 18,
                  hintText: 'Username of Email',
                  prefixIcon: FontAwesomeIcons.userAlt,
                  prefixIconColor: Theme.of(context).primaryColor),
              SizedBox(height: defaultPadding),
              CustomField(
                  hintText: 'Enter Password',
                  prefixIcon: Icons.lock,
                  prefixIconColor: Theme.of(context).primaryColor),
              SizedBox(height: defaultPadding),
              Text("Forgot Password?",
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Theme.of(context).accentColor, fontSize: 13)),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: defaultPadding * 2.2),
                  child: CustomButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.introduction);
                      },
                      text: 'Sing In')),
        /*      Center(
                  child: Text("or Login With",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(fontSize: 13))),
              SizedBox(height: defaultPadding),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding * 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(child: SizedBox()),
                    Flexible(
                        flex: 2,
                        child: Container(
                            height: 55,
                            decoration: BoxDecoration(
                                color: Theme.of(context).backgroundColor,
                                borderRadius:
                                    BorderRadius.circular(defaultRadius)),
                            child: Center(
                                child: Image.asset(ConstanceData.googleIcon,
                                    height: 30)))),
                    SizedBox(width: defaultPadding),
                    Flexible(
                        flex: 2,
                        child: Container(
                            height: 55,
                            decoration: BoxDecoration(
                                color: Theme.of(context).backgroundColor,
                                borderRadius:
                                    BorderRadius.circular(defaultRadius)),
                            child: Center(
                                child: Image.asset(ConstanceData.facebookFIcon,
                                    color: Theme.of(context).primaryColor,
                                    height: 30)))),
                    SizedBox(width: defaultPadding),
                    Flexible(
                        flex: 2,
                        child: Container(
                            height: 55,
                            decoration: BoxDecoration(
                                color: Theme.of(context).backgroundColor,
                                borderRadius:
                                    BorderRadius.circular(defaultRadius)),
                            child: Center(
                                child: Image.asset(ConstanceData.appleIcon,
                                    color: AppTheme.isLightTheme
                                        ? Colors.black
                                        : Colors.white,
                                    height: 30)))),
                    Flexible(child: SizedBox()),
                  ],
                ),
              ),*/
              SizedBox(height: MediaQuery.of(context).size.height / 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?",
                      style: Theme.of(context).textTheme.subtitle1),
                  SizedBox(width: defaultPadding - 10),
                  InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.rEGISTER);
                      },
                      child: Text("Sing Up",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  color: Theme.of(context).accentColor,
                                  fontSize: 14))),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
