// ignore_for_file: prefer_const_constructors, prefer_adjacent_string_concatenation, deprecated_member_use, library_private_types_in_public_api

import 'package:finology/Constance/constance.dart';
import 'package:finology/Widgets/common_button.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await Navigator.pushReplacementNamed(context, Routes.lOGIN);
        return true;
      },
      child: Scaffold(
        body: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.fromLTRB(
              defaultPadding,
              defaultPadding,
              defaultPadding,
              MediaQuery.of(context).padding.bottom + defaultPadding),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 8),
                Text("Sing Up", style: Theme.of(context).textTheme.headline5),
                SizedBox(height: defaultPadding),
                CustomField(prefixIcon: Icons.email, hintText: 'Email Address'),
                SizedBox(height: defaultPadding),
                CustomField(prefixIcon: Icons.lock, hintText: 'Enter Password'),
                SizedBox(height: defaultPadding),
                CustomField(
                    prefixIcon: Icons.lock, hintText: 'Confiram Password'),
                SizedBox(height: defaultPadding),
                Row(
                  children: [
                    Checkbox(
                      value: _isSelected,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _isSelected = newValue!;
                        });
                      },
                    ),
                    Text("By signing up you are agree to our" + " ",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(fontSize: 13)),
                    Flexible(
                        child: Text("trems & services",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(
                                    color: Theme.of(context).accentColor,
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 13))),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: defaultPadding * 2.2),
                    child: CustomButton(
                        disableButton: _isSelected ? false : true,
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, Routes.verityYourIdentity);
                        },
                        text: 'Sing Up Now')),
                Center(
                    child: Text("or Login With",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(fontSize: 13))),
                SizedBox(height: defaultPadding),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding * 3),
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
                                  child: Image.asset(
                                      ConstanceData.facebookFIcon,
                                      color: Theme.of(context).primaryColor,
                                      height: 30)))),
                      SizedBox(width: defaultPadding),
                      Flexible(
                          flex: 2,
                          child: Container(
                              height: 55,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.circular(defaultRadius)),
                              child: Center(
                                  child: Image.asset(ConstanceData.appleIcon,
                                      height: 30)))),
                      Flexible(child: SizedBox()),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? ",
                        style: Theme.of(context).textTheme.subtitle1),
                    SizedBox(width: defaultPadding - 10),
                    InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, Routes.lOGIN);
                        },
                        child: Text("Login",
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
      ),
    );
  }
}
