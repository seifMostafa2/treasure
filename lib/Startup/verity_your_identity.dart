// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, unused_field, unused_local_variable, deprecated_member_use, library_private_types_in_public_api

import 'package:finology/Constance/constance.dart';
import 'package:finology/Widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../main.dart';

enum BoxValues { boxSelected }

class VerityYourIdentity extends StatefulWidget {
  const VerityYourIdentity({Key? key}) : super(key: key);

  @override
  _VerityYourIdentityState createState() => _VerityYourIdentityState();
}

class _VerityYourIdentityState extends State<VerityYourIdentity> {
  BoxValues _character = BoxValues.boxSelected;
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    var boxSelected = _character == BoxValues.boxSelected;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.fromLTRB(
                defaultPadding,
                MediaQuery.of(context).padding.top + defaultPadding,
                defaultPadding,
                MediaQuery.of(context).padding.bottom + defaultPadding),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: AppBar().preferredSize.height),
                  Text("Verify Your Identity",
                      style: Theme.of(context).textTheme.headline5),
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width / 20),
                      child: Text(
                        "Please select your contact details and we will send a verification code to verify your identity.",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              fontSize: 13,
                            ),
                      )),
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    child: Container(
                      width: 200,
                      height: 120,
                      decoration: BoxDecoration(
                        color: selectedIndex == 0
                            ? blueColor
                            : Theme.of(context).backgroundColor,
                        borderRadius: BorderRadius.circular(defaultRadius),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 20),
                        ],
                      ),
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.email,
                              size: 30,
                              color: selectedIndex == 0
                                  ? Theme.of(context).backgroundColor
                                  : blueColor),
                          SizedBox(height: defaultPadding - 7),
                          Text("Email",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                      fontSize: 18,
                                      color: selectedIndex == 0
                                          ? Theme.of(context).backgroundColor
                                          : null))
                        ],
                      )),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 25),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    child: Container(
                      width: 200,
                      height: 120,
                      decoration: BoxDecoration(
                        color: selectedIndex == 1
                            ? blueColor
                            : Theme.of(context).backgroundColor,
                        borderRadius: BorderRadius.circular(defaultRadius),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 20),
                        ],
                      ),
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.mobileAlt,
                              size: 30,
                              color: selectedIndex == 1
                                  ? Theme.of(context).backgroundColor
                                  : blueColor),
                          SizedBox(height: defaultPadding),
                          Text("Mobile",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                      fontSize: 18,
                                      color: selectedIndex == 1
                                          ? Theme.of(context).backgroundColor
                                          : null))
                        ],
                      )),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                  padding: EdgeInsets.only(
                      left: defaultPadding,
                      right: defaultPadding,
                      top: defaultRadius,
                      bottom: MediaQuery.of(context).padding.bottom +
                          defaultPadding),
                  child: CustomButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.enterMobileNumber);
                      },
                      text: 'Sing Up Now')),
            ],
          ),
        ],
      ),
    );
  }
}
