// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, deprecated_member_use, library_private_types_in_public_api

import 'package:finology/Constance/constance.dart';
import 'package:finology/Widgets/Navigator/navigator_page.dart';
import 'package:finology/Widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../main.dart';
import 'verity_your_identity.dart';

class EnterOTP extends StatefulWidget {
  const EnterOTP({Key? key}) : super(key: key);

  @override
  _EnterOTPState createState() => _EnterOTPState();
}

class _EnterOTPState extends State<EnterOTP> {
  String currentText = "";
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await Navigator.pushReplacementNamed(
            context, Routes.verityYourIdentity);
        return true;
      },
      child: Scaffold(
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
                    Row(children: [
                      SplashIcon(
                          onPressed: () {
                            Navigator.push(context,
                                SlideRightRoute(widget: VerityYourIdentity()));
                          },
                          icon: Icon(Icons.arrow_back_rounded,
                              color: Theme.of(context).iconTheme.color)),
                    ]),
                    SizedBox(height: defaultPadding * 1.5),
                    Text("Enter OTP",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline5),
                    SizedBox(height: MediaQuery.of(context).size.height / 20),
                    Padding(
                      padding: EdgeInsets.fromLTRB(defaultPadding * 2, 0,
                          defaultPadding * 2, defaultPadding),
                      child: Form(
                        key: formKey,
                        child: PinCodeTextField(
                          appContext: context,
                          length: 4,
                          blinkWhenObscuring: true,
                          animationType: AnimationType.fade,
                          pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius:
                                  BorderRadius.circular(defaultRadius),
                              fieldHeight: 75,
                              fieldWidth: 60,
                              activeColor: blueColor,
                              activeFillColor: blueColor,
                              selectedColor: blueColor,
                              selectedFillColor: blueColor,
                              inactiveColor: Theme.of(context).backgroundColor,
                              inactiveFillColor:
                                  Theme.of(context).backgroundColor),
                          textStyle: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          animationDuration: Duration(milliseconds: 300),
                          enableActiveFill: true,
                          keyboardType: TextInputType.number,
                          validator: (v) {
                            if (v!.length < 3) {
                              return null;
                            } else {
                              return null;
                            }
                          },
                          onCompleted: (v) {
                            print("Completed");
                          },
                          onChanged: (value) {
                            print(value);
                            setState(() {
                              currentText = value;
                            });
                          },
                          beforeTextPaste: (text) {
                            print("Allowing to paste $text");
                            return true;
                          },
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Did not receive OTP?",
                            style: Theme.of(context).textTheme.subtitle1),
                        SizedBox(width: defaultPadding - 10),
                        InkWell(
                            onTap: () {
                              setState(() {
                                currentText = "";
                              });
                            },
                            child: Text("Resend OTP",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                        color: Theme.of(context).accentColor,
                                        fontSize: 14))),
                      ],
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
                            context, Routes.introduction);
                      },
                      text: 'Verify OTP',
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
